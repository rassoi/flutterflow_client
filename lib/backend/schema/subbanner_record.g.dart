// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subbanner_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubbannerRecord> _$subbannerRecordSerializer =
    new _$SubbannerRecordSerializer();

class _$SubbannerRecordSerializer
    implements StructuredSerializer<SubbannerRecord> {
  @override
  final Iterable<Type> types = const [SubbannerRecord, _$SubbannerRecord];
  @override
  final String wireName = 'SubbannerRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SubbannerRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.array;
    if (value != null) {
      result
        ..add('array')
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
  SubbannerRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubbannerRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'array':
          result.array.replace(serializers.deserialize(value,
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

class _$SubbannerRecord extends SubbannerRecord {
  @override
  final BuiltList<String>? array;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SubbannerRecord([void Function(SubbannerRecordBuilder)? updates]) =>
      (new SubbannerRecordBuilder()..update(updates))._build();

  _$SubbannerRecord._({this.array, this.ffRef}) : super._();

  @override
  SubbannerRecord rebuild(void Function(SubbannerRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubbannerRecordBuilder toBuilder() =>
      new SubbannerRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubbannerRecord &&
        array == other.array &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, array.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubbannerRecord')
          ..add('array', array)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SubbannerRecordBuilder
    implements Builder<SubbannerRecord, SubbannerRecordBuilder> {
  _$SubbannerRecord? _$v;

  ListBuilder<String>? _array;
  ListBuilder<String> get array => _$this._array ??= new ListBuilder<String>();
  set array(ListBuilder<String>? array) => _$this._array = array;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SubbannerRecordBuilder() {
    SubbannerRecord._initializeBuilder(this);
  }

  SubbannerRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _array = $v.array?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubbannerRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubbannerRecord;
  }

  @override
  void update(void Function(SubbannerRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubbannerRecord build() => _build();

  _$SubbannerRecord _build() {
    _$SubbannerRecord _$result;
    try {
      _$result =
          _$v ?? new _$SubbannerRecord._(array: _array?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'array';
        _array?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SubbannerRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
