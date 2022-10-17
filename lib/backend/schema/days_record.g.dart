// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'days_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DaysRecord> _$daysRecordSerializer = new _$DaysRecordSerializer();

class _$DaysRecordSerializer implements StructuredSerializer<DaysRecord> {
  @override
  final Iterable<Type> types = const [DaysRecord, _$DaysRecord];
  @override
  final String wireName = 'DaysRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DaysRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  DaysRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DaysRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'day':
          result.day.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$DaysRecord extends DaysRecord {
  @override
  final BuiltList<String>? day;
  @override
  final String? type;
  @override
  final BuiltList<String>? date;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DaysRecord([void Function(DaysRecordBuilder)? updates]) =>
      (new DaysRecordBuilder()..update(updates))._build();

  _$DaysRecord._({this.day, this.type, this.date, this.ffRef}) : super._();

  @override
  DaysRecord rebuild(void Function(DaysRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DaysRecordBuilder toBuilder() => new DaysRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DaysRecord &&
        day == other.day &&
        type == other.type &&
        date == other.date &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, day.hashCode), type.hashCode), date.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DaysRecord')
          ..add('day', day)
          ..add('type', type)
          ..add('date', date)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DaysRecordBuilder implements Builder<DaysRecord, DaysRecordBuilder> {
  _$DaysRecord? _$v;

  ListBuilder<String>? _day;
  ListBuilder<String> get day => _$this._day ??= new ListBuilder<String>();
  set day(ListBuilder<String>? day) => _$this._day = day;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  ListBuilder<String>? _date;
  ListBuilder<String> get date => _$this._date ??= new ListBuilder<String>();
  set date(ListBuilder<String>? date) => _$this._date = date;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DaysRecordBuilder() {
    DaysRecord._initializeBuilder(this);
  }

  DaysRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _day = $v.day?.toBuilder();
      _type = $v.type;
      _date = $v.date?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DaysRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DaysRecord;
  }

  @override
  void update(void Function(DaysRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DaysRecord build() => _build();

  _$DaysRecord _build() {
    _$DaysRecord _$result;
    try {
      _$result = _$v ??
          new _$DaysRecord._(
              day: _day?.build(),
              type: type,
              date: _date?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'day';
        _day?.build();

        _$failedField = 'date';
        _date?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DaysRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
