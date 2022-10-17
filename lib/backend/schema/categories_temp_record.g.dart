// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_temp_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoriesTempRecord> _$categoriesTempRecordSerializer =
    new _$CategoriesTempRecordSerializer();

class _$CategoriesTempRecordSerializer
    implements StructuredSerializer<CategoriesTempRecord> {
  @override
  final Iterable<Type> types = const [
    CategoriesTempRecord,
    _$CategoriesTempRecord
  ];
  @override
  final String wireName = 'CategoriesTempRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CategoriesTempRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.list;
    if (value != null) {
      result
        ..add('list')
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
  CategoriesTempRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoriesTempRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'list':
          result.list.replace(serializers.deserialize(value,
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

class _$CategoriesTempRecord extends CategoriesTempRecord {
  @override
  final BuiltList<String>? list;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CategoriesTempRecord(
          [void Function(CategoriesTempRecordBuilder)? updates]) =>
      (new CategoriesTempRecordBuilder()..update(updates))._build();

  _$CategoriesTempRecord._({this.list, this.ffRef}) : super._();

  @override
  CategoriesTempRecord rebuild(
          void Function(CategoriesTempRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriesTempRecordBuilder toBuilder() =>
      new CategoriesTempRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoriesTempRecord &&
        list == other.list &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, list.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoriesTempRecord')
          ..add('list', list)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CategoriesTempRecordBuilder
    implements Builder<CategoriesTempRecord, CategoriesTempRecordBuilder> {
  _$CategoriesTempRecord? _$v;

  ListBuilder<String>? _list;
  ListBuilder<String> get list => _$this._list ??= new ListBuilder<String>();
  set list(ListBuilder<String>? list) => _$this._list = list;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CategoriesTempRecordBuilder() {
    CategoriesTempRecord._initializeBuilder(this);
  }

  CategoriesTempRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _list = $v.list?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoriesTempRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoriesTempRecord;
  }

  @override
  void update(void Function(CategoriesTempRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoriesTempRecord build() => _build();

  _$CategoriesTempRecord _build() {
    _$CategoriesTempRecord _$result;
    try {
      _$result = _$v ??
          new _$CategoriesTempRecord._(list: _list?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'list';
        _list?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CategoriesTempRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
