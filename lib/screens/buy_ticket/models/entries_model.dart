import 'dart:convert';

class EntriesModel {
  String? api;
  String? description;
  String? auth;
  bool? https;
  String? cors;
  String? link;
  String? category;

  EntriesModel({
    this.api,
    this.description,
    this.auth,
    this.https,
    this.cors,
    this.link,
    this.category,
  });

  factory EntriesModel.fromMap(Map<String, dynamic> data) => EntriesModel(
        api: data['API'] as String?,
        description: data['Description'] as String?,
        auth: data['Auth'] as String?,
        https: data['HTTPS'] as bool?,
        cors: data['Cors'] as String?,
        link: data['Link'] as String?,
        category: data['Category'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'API': api,
        'Description': description,
        'Auth': auth,
        'HTTPS': https,
        'Cors': cors,
        'Link': link,
        'Category': category,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EntriesModel].
  factory EntriesModel.fromJson(String data) {
    return EntriesModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EntriesModel] to a JSON string.
  String toJson() => json.encode(toMap());

  EntriesModel copyWith({
    String? api,
    String? description,
    String? auth,
    bool? https,
    String? cors,
    String? link,
    String? category,
  }) {
    return EntriesModel(
      api: api ?? this.api,
      description: description ?? this.description,
      auth: auth ?? this.auth,
      https: https ?? this.https,
      cors: cors ?? this.cors,
      link: link ?? this.link,
      category: category ?? this.category,
    );
  }
}
