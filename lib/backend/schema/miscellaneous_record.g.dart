// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'miscellaneous_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MiscellaneousRecord> _$miscellaneousRecordSerializer =
    new _$MiscellaneousRecordSerializer();

class _$MiscellaneousRecordSerializer
    implements StructuredSerializer<MiscellaneousRecord> {
  @override
  final Iterable<Type> types = const [
    MiscellaneousRecord,
    _$MiscellaneousRecord
  ];
  @override
  final String wireName = 'MiscellaneousRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MiscellaneousRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.categoriesList;
    if (value != null) {
      result
        ..add('categories_list')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.avaialable;
    if (value != null) {
      result
        ..add('avaialable')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  MiscellaneousRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MiscellaneousRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'categories_list':
          result.categoriesList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'avaialable':
          result.avaialable = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$MiscellaneousRecord extends MiscellaneousRecord {
  @override
  final BuiltList<String>? categoriesList;
  @override
  final int? avaialable;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MiscellaneousRecord(
          [void Function(MiscellaneousRecordBuilder)? updates]) =>
      (new MiscellaneousRecordBuilder()..update(updates))._build();

  _$MiscellaneousRecord._({this.categoriesList, this.avaialable, this.ffRef})
      : super._();

  @override
  MiscellaneousRecord rebuild(
          void Function(MiscellaneousRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MiscellaneousRecordBuilder toBuilder() =>
      new MiscellaneousRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MiscellaneousRecord &&
        categoriesList == other.categoriesList &&
        avaialable == other.avaialable &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, categoriesList.hashCode), avaialable.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MiscellaneousRecord')
          ..add('categoriesList', categoriesList)
          ..add('avaialable', avaialable)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MiscellaneousRecordBuilder
    implements Builder<MiscellaneousRecord, MiscellaneousRecordBuilder> {
  _$MiscellaneousRecord? _$v;

  ListBuilder<String>? _categoriesList;
  ListBuilder<String> get categoriesList =>
      _$this._categoriesList ??= new ListBuilder<String>();
  set categoriesList(ListBuilder<String>? categoriesList) =>
      _$this._categoriesList = categoriesList;

  int? _avaialable;
  int? get avaialable => _$this._avaialable;
  set avaialable(int? avaialable) => _$this._avaialable = avaialable;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MiscellaneousRecordBuilder() {
    MiscellaneousRecord._initializeBuilder(this);
  }

  MiscellaneousRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoriesList = $v.categoriesList?.toBuilder();
      _avaialable = $v.avaialable;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MiscellaneousRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MiscellaneousRecord;
  }

  @override
  void update(void Function(MiscellaneousRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MiscellaneousRecord build() => _build();

  _$MiscellaneousRecord _build() {
    _$MiscellaneousRecord _$result;
    try {
      _$result = _$v ??
          new _$MiscellaneousRecord._(
              categoriesList: _categoriesList?.build(),
              avaialable: avaialable,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categoriesList';
        _categoriesList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MiscellaneousRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
