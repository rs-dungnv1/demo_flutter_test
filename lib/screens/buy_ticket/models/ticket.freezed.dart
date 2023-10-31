// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  String? get aId => throw _privateConstructorUsedError;
  String? get ticketName => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get aTicketItemResponses =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get aTicketComboResponses =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
  $Res call(
      {String? aId,
      String? ticketName,
      List<Map<String, dynamic>>? aTicketItemResponses,
      List<Map<String, dynamic>>? aTicketComboResponses});
}

/// @nodoc
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aId = freezed,
    Object? ticketName = freezed,
    Object? aTicketItemResponses = freezed,
    Object? aTicketComboResponses = freezed,
  }) {
    return _then(_value.copyWith(
      aId: freezed == aId
          ? _value.aId
          : aId // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketName: freezed == ticketName
          ? _value.ticketName
          : ticketName // ignore: cast_nullable_to_non_nullable
              as String?,
      aTicketItemResponses: freezed == aTicketItemResponses
          ? _value.aTicketItemResponses
          : aTicketItemResponses // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      aTicketComboResponses: freezed == aTicketComboResponses
          ? _value.aTicketComboResponses
          : aTicketComboResponses // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicketCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$_TicketCopyWith(_$_Ticket value, $Res Function(_$_Ticket) then) =
      __$$_TicketCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? aId,
      String? ticketName,
      List<Map<String, dynamic>>? aTicketItemResponses,
      List<Map<String, dynamic>>? aTicketComboResponses});
}

/// @nodoc
class __$$_TicketCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$_Ticket>
    implements _$$_TicketCopyWith<$Res> {
  __$$_TicketCopyWithImpl(_$_Ticket _value, $Res Function(_$_Ticket) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aId = freezed,
    Object? ticketName = freezed,
    Object? aTicketItemResponses = freezed,
    Object? aTicketComboResponses = freezed,
  }) {
    return _then(_$_Ticket(
      aId: freezed == aId
          ? _value.aId
          : aId // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketName: freezed == ticketName
          ? _value.ticketName
          : ticketName // ignore: cast_nullable_to_non_nullable
              as String?,
      aTicketItemResponses: freezed == aTicketItemResponses
          ? _value._aTicketItemResponses
          : aTicketItemResponses // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      aTicketComboResponses: freezed == aTicketComboResponses
          ? _value._aTicketComboResponses
          : aTicketComboResponses // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ticket implements _Ticket {
  _$_Ticket(
      {this.aId,
      this.ticketName,
      final List<Map<String, dynamic>>? aTicketItemResponses,
      final List<Map<String, dynamic>>? aTicketComboResponses})
      : _aTicketItemResponses = aTicketItemResponses,
        _aTicketComboResponses = aTicketComboResponses;

  factory _$_Ticket.fromJson(Map<String, dynamic> json) =>
      _$$_TicketFromJson(json);

  @override
  final String? aId;
  @override
  final String? ticketName;
  final List<Map<String, dynamic>>? _aTicketItemResponses;
  @override
  List<Map<String, dynamic>>? get aTicketItemResponses {
    final value = _aTicketItemResponses;
    if (value == null) return null;
    if (_aTicketItemResponses is EqualUnmodifiableListView)
      return _aTicketItemResponses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Map<String, dynamic>>? _aTicketComboResponses;
  @override
  List<Map<String, dynamic>>? get aTicketComboResponses {
    final value = _aTicketComboResponses;
    if (value == null) return null;
    if (_aTicketComboResponses is EqualUnmodifiableListView)
      return _aTicketComboResponses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Ticket(aId: $aId, ticketName: $ticketName, aTicketItemResponses: $aTicketItemResponses, aTicketComboResponses: $aTicketComboResponses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ticket &&
            (identical(other.aId, aId) || other.aId == aId) &&
            (identical(other.ticketName, ticketName) ||
                other.ticketName == ticketName) &&
            const DeepCollectionEquality()
                .equals(other._aTicketItemResponses, _aTicketItemResponses) &&
            const DeepCollectionEquality()
                .equals(other._aTicketComboResponses, _aTicketComboResponses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      aId,
      ticketName,
      const DeepCollectionEquality().hash(_aTicketItemResponses),
      const DeepCollectionEquality().hash(_aTicketComboResponses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      __$$_TicketCopyWithImpl<_$_Ticket>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketToJson(
      this,
    );
  }
}

abstract class _Ticket implements Ticket {
  factory _Ticket(
      {final String? aId,
      final String? ticketName,
      final List<Map<String, dynamic>>? aTicketItemResponses,
      final List<Map<String, dynamic>>? aTicketComboResponses}) = _$_Ticket;

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$_Ticket.fromJson;

  @override
  String? get aId;
  @override
  String? get ticketName;
  @override
  List<Map<String, dynamic>>? get aTicketItemResponses;
  @override
  List<Map<String, dynamic>>? get aTicketComboResponses;
  @override
  @JsonKey(ignore: true)
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      throw _privateConstructorUsedError;
}
