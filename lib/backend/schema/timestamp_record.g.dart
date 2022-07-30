// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timestamp_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TimestampRecord> _$timestampRecordSerializer =
    new _$TimestampRecordSerializer();

class _$TimestampRecordSerializer
    implements StructuredSerializer<TimestampRecord> {
  @override
  final Iterable<Type> types = const [TimestampRecord, _$TimestampRecord];
  @override
  final String wireName = 'TimestampRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, TimestampRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.lastAudit;
    if (value != null) {
      result
        ..add('lastAudit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.lastBuy;
    if (value != null) {
      result
        ..add('lastBuy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  TimestampRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TimestampRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'lastAudit':
          result.lastAudit = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'lastBuy':
          result.lastBuy = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$TimestampRecord extends TimestampRecord {
  @override
  final DateTime lastAudit;
  @override
  final DateTime lastBuy;
  @override
  final DocumentReference<Object> reference;

  factory _$TimestampRecord([void Function(TimestampRecordBuilder) updates]) =>
      (new TimestampRecordBuilder()..update(updates))._build();

  _$TimestampRecord._({this.lastAudit, this.lastBuy, this.reference})
      : super._();

  @override
  TimestampRecord rebuild(void Function(TimestampRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TimestampRecordBuilder toBuilder() =>
      new TimestampRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TimestampRecord &&
        lastAudit == other.lastAudit &&
        lastBuy == other.lastBuy &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, lastAudit.hashCode), lastBuy.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TimestampRecord')
          ..add('lastAudit', lastAudit)
          ..add('lastBuy', lastBuy)
          ..add('reference', reference))
        .toString();
  }
}

class TimestampRecordBuilder
    implements Builder<TimestampRecord, TimestampRecordBuilder> {
  _$TimestampRecord _$v;

  DateTime _lastAudit;
  DateTime get lastAudit => _$this._lastAudit;
  set lastAudit(DateTime lastAudit) => _$this._lastAudit = lastAudit;

  DateTime _lastBuy;
  DateTime get lastBuy => _$this._lastBuy;
  set lastBuy(DateTime lastBuy) => _$this._lastBuy = lastBuy;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  TimestampRecordBuilder() {
    TimestampRecord._initializeBuilder(this);
  }

  TimestampRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lastAudit = $v.lastAudit;
      _lastBuy = $v.lastBuy;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TimestampRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TimestampRecord;
  }

  @override
  void update(void Function(TimestampRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  TimestampRecord build() => _build();

  _$TimestampRecord _build() {
    final _$result = _$v ??
        new _$TimestampRecord._(
            lastAudit: lastAudit, lastBuy: lastBuy, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
