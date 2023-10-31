import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:demo_flutter_test/api/api_exception.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  // Base URL by flavor
  static String baseUrl = 'http://13.215.97.116/';
  // Default language
  static String defaultLang = 'en';
  // No internet message
  static String noInternetMsg = 'No Internet Connection';

  static Future<Map<String, String>> getHeaders({
    bool isAuthorized = false,
    bool isFormData = false,
    String? inputLang,
  }) async {
    const accessToken = 'token';
    const savedLang = 'en';
    const lang = savedLang;
    const isLoggedIn = true;
    var contentType = 'application/json';

    if (isFormData) {
      contentType = 'multipart/form-data';
    }

    // header for authorization
    final headersAuth = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': contentType,
      'lang': inputLang ?? lang,
    };

    // header for non authorization
    final headers = {
      'Content-Type': 'application/json',
      'lang': inputLang ?? lang,
    };

    return isAuthorized && isLoggedIn ? headersAuth : headers;
  }

  static Future<dynamic> getRequest({
    String? endpoint,
    bool isAuthorized = false,
    Map<String, dynamic>? params,
    bool setNoHeader = false,
    String? lang,
    String? newUrl,
    int? indexTabbar,
  }) async {
    // if (!(await NetworkState.isConnected)) {
    //   throw FetchDataError(message: noInternetMsg);
    // }

    final uri = Uri.parse(newUrl ?? (baseUrl + (endpoint ?? '')));

    final headersToGet = setNoHeader
        ? null
        : await getHeaders(
            isAuthorized: isAuthorized,
            inputLang: lang,
          );

    _logRequest(
      url: uri,
      headers: headersToGet,
      params: params,
      type: 'GET',
    );

    try {
      final result = http
          .get(
            uri,
            headers: headersToGet,
          )
          .then((value) => _handleResponse(value, indexTabbar: indexTabbar));

      return result;
    } on TimeoutException catch (_) {
      throw TimeOutError(
        code: _.message,
      );
    } on SocketException catch (_) {
      throw FetchDataError(
        message: noInternetMsg,
        code: _.message,
      );
    }
  }

  static Future<dynamic> postRequest(
    String endpoint, {
    required dynamic params,
    bool isAuthorized = false,
    bool isLogResponse = true,
    int? indexTabbar,
  }) async {
    // if (!(await NetworkState.isConnected)) {
    //   throw FetchDataError(message: noInternetMsg);
    // }

    final uri = Uri.parse(baseUrl + endpoint);
    final headersToPost = await getHeaders(isAuthorized: isAuthorized);

    _logRequest(
      url: uri,
      headers: headersToPost,
      params: params,
      type: 'POST',
    );

    try {
      final result = http
          .post(
            uri,
            headers: headersToPost,
            body: json.encode(params),
          )
          .then((value) => _handleResponse(value, indexTabbar: indexTabbar));

      return result;
    } on TimeoutException catch (_) {
      throw TimeOutError(
        code: _.message,
      );
    } on SocketException catch (_) {
      throw FetchDataError(
        message: noInternetMsg,
        code: _.message,
      );
    }
  }

  static Future<dynamic> postFileRequest(
    String endpoint, {
    required String key,
    required File image,
    Map<String, String>? params,
    bool isAuthorized = false,
    bool isLogResponse = true,
  }) async {
    // if (!(await NetworkState.isConnected)) {
    //   throw FetchDataError(message: noInternetMsg);
    // }
    final uri = Uri.parse(baseUrl + endpoint);

    final headersToPost = await getHeaders(
      isAuthorized: isAuthorized,
      isFormData: true,
    );

    _logRequest(
      url: uri,
      headers: headersToPost,
      params: image,
      type: 'POST',
    );

    try {
      final request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath(key, image.path));
      request.headers.addAll(headersToPost);

      if (params != null) {
        params.forEach((key, value) {
          request.fields[key] = value;
        });
      }

      final res = await request.send();
      return res.statusCode;
    } on TimeoutException catch (_) {
      throw TimeOutError(
        code: _.message,
      );
    } on SocketException catch (_) {
      throw FetchDataError(
        message: noInternetMsg,
        code: _.message,
      );
    }
  }

  static Future<dynamic> putRequest(
    String endpoint, {
    required Map<String, dynamic>? params,
    bool isAuthorized = false,
  }) async {
    Map<String, String>? headers;
    final uri = Uri.parse(baseUrl + endpoint);

    final result = http
        .put(uri, headers: headers, body: json.encode(params))
        .then(_handleResponse)
        .catchError(_handleError);

    return result;
  }

  static Future<dynamic> deleteRequest(String endpoint) async {
    Map<String, String>? headers;
    final uri = Uri.parse(baseUrl + endpoint);

    final result = http
        .delete(
          uri,
          headers: headers,
        )
        .then(_handleResponse)
        .catchError(_handleError);

    return result;
  }

  static dynamic _handleError(dynamic onError) {
    log(
      'Error ${onError.toString()}',
    );

    if (onError is TimeoutException) {
      log('Timeout');
    } else if (onError is SocketException) {
      log('Socket');
    }
  }

  static dynamic _handleResponse(
    http.Response response, {
    bool isLogResponse = true,
    int? indexTabbar,
  }) async {
    final statusCode = response.statusCode;
    final url = response.request?.url.toString();
    var message = 'unknownErrorMessage';

    if (statusCode == 500) {
      throw InternalServerError(
        code: 500,
        message: message,
        success: false,
      );
    }

    log(
      isLogResponse ? json.decode(response.body) : 'No log',
      //'Response │ Status: $statusCode\n$url',
    );

    final code = json.decode(response.body)['code'];
    message = json.decode(response.body)['message'].toString();
    final success = json.decode(response.body)['success'];

    switch (code) {
      case 200:
        return json.decode(response.body)['data'];
      case 400:
        throw BadRequestError(
          code: code,
          message: message,
          success: success,
        );
      case 401:
      case 403:
        // await Utils.handleUnauthorizedError(indexTabbar);
        throw UnauthorizedError(
          code: code,
          message: message,
          success: success,
        );
      case 404:
        throw NotFoundError(
          code: 404,
          message: message,
          success: success,
        );
      case 500:
        throw InternalServerError(
          code: 500,
          message: message,
          success: success,
        );
      default:
        throw FetchDataError(
          code: code,
          message: message,
          success: success,
        );
    }
  }

  static dynamic _logRequest({
    required dynamic url,
    required dynamic headers,
    required dynamic params,
    required dynamic type,
  }) {
    log(
      '$url Request │ $type',
    );
  }
}
