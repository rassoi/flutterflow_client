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
  Iterable<Object> serialize(
      Serializers serializers, MiscellaneousRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
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
    value = object.unavaialable;
    if (value != null) {
      result
        ..add('unavaialable')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  MiscellaneousRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MiscellaneousRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'categories_list':
          result.categoriesList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'avaialable':
          result.avaialable = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'unavaialable':
          result.unavaialable = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$MiscellaneousRecord extends MiscellaneousRecord {
  @override
  final BuiltList<String> categoriesList;
  @override
  final int avaialable;
  @override
  final int unavaialable;
  @override
  final DocumentReference<Object> reference;

  factory _$MiscellaneousRecord(
          [void Function(MiscellaneousRecordBuilder) updates]) =>
      (new MiscellaneousRecordBuilder()..update(updates)).build();

  _$MiscellaneousRecord._(
      {this.categoriesList, this.avaialable, this.unavaialable, this.reference})
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
        unavaialable == other.unavaialable &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, categoriesList.hashCode), avaialable.hashCode),
            unavaialable.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MiscellaneousRecord')
          ..add('categoriesList', categoriesList)
          ..add('avaialable', avaialable)
          ..add('unavaialable', unavaialable)
          ..add('reference', reference))
        .toString();
  }
}

class MiscellaneousRecordBuilder
    implements Builder<MiscellaneousRecord, MiscellaneousRecordBuilder> {
  _$MiscellaneousRecord _$v;

  ListBuilder<String> _categoriesList;
  ListBuilder<String> get categoriesList =>
      _$this._categoriesList ??= new ListBuilder<String>();
  set categoriesList(ListBuilder<String> categoriesList) =>
      _$this._categoriesList = categoriesList;

  int _avaialable;
  int get avaialable => _$this._avaialable;
  set avaialable(int avaialable) => _$this._avaialable = avaialable;

  int _unavaialable;
  int get unavaialable => _$this._unavaialable;
  set unavaialable(int unavaialable) => _$this._unavaialable = unavaialable;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  MiscellaneousRecordBuilder() {
    MiscellaneousRecord._initializeBuilder(this);
  }

  MiscellaneousRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoriesList = $v.categoriesList?.toBuilder();
      _avaialable = $v.avaialable;
      _unavaialable = $v.unavaialable;
      _reference = $v.reference;
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
  void update(void Function(MiscellaneousRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MiscellaneousRecord build() {
    _$MiscellaneousRecord _$result;
    try {
      _$result = _$v ??
          new _$MiscellaneousRecord._(
              categoriesList: _categoriesList?.build(),
              avaialable: avaialable,
              unavaialable: unavaialable,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'categoriesList';
        _categoriesList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MiscellaneousRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
