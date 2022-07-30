// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcomming_meals_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpcommingMealsRecord> _$upcommingMealsRecordSerializer =
    new _$UpcommingMealsRecordSerializer();

class _$UpcommingMealsRecordSerializer
    implements StructuredSerializer<UpcommingMealsRecord> {
  @override
  final Iterable<Type> types = const [
    UpcommingMealsRecord,
    _$UpcommingMealsRecord
  ];
  @override
  final String wireName = 'UpcommingMealsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, UpcommingMealsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  UpcommingMealsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UpcommingMealsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$UpcommingMealsRecord extends UpcommingMealsRecord {
  @override
  final String image;
  @override
  final String text;
  @override
  final DocumentReference<Object> reference;

  factory _$UpcommingMealsRecord(
          [void Function(UpcommingMealsRecordBuilder) updates]) =>
      (new UpcommingMealsRecordBuilder()..update(updates))._build();

  _$UpcommingMealsRecord._({this.image, this.text, this.reference}) : super._();

  @override
  UpcommingMealsRecord rebuild(
          void Function(UpcommingMealsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpcommingMealsRecordBuilder toBuilder() =>
      new UpcommingMealsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpcommingMealsRecord &&
        image == other.image &&
        text == other.text &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, image.hashCode), text.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpcommingMealsRecord')
          ..add('image', image)
          ..add('text', text)
          ..add('reference', reference))
        .toString();
  }
}

class UpcommingMealsRecordBuilder
    implements Builder<UpcommingMealsRecord, UpcommingMealsRecordBuilder> {
  _$UpcommingMealsRecord _$v;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UpcommingMealsRecordBuilder() {
    UpcommingMealsRecord._initializeBuilder(this);
  }

  UpcommingMealsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image = $v.image;
      _text = $v.text;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpcommingMealsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpcommingMealsRecord;
  }

  @override
  void update(void Function(UpcommingMealsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  UpcommingMealsRecord build() => _build();

  _$UpcommingMealsRecord _build() {
    final _$result = _$v ??
        new _$UpcommingMealsRecord._(
            image: image, text: text, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
