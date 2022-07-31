// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcommingmeals_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpcommingmealsRecord> _$upcommingmealsRecordSerializer =
    new _$UpcommingmealsRecordSerializer();

class _$UpcommingmealsRecordSerializer
    implements StructuredSerializer<UpcommingmealsRecord> {
  @override
  final Iterable<Type> types = const [
    UpcommingmealsRecord,
    _$UpcommingmealsRecord
  ];
  @override
  final String wireName = 'UpcommingmealsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, UpcommingmealsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sequence;
    if (value != null) {
      result
        ..add('sequence')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
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
  UpcommingmealsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UpcommingmealsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sequence':
          result.sequence = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
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

class _$UpcommingmealsRecord extends UpcommingmealsRecord {
  @override
  final String name;
  @override
  final String image;
  @override
  final int sequence;
  @override
  final String uid;
  @override
  final DocumentReference<Object> reference;

  factory _$UpcommingmealsRecord(
          [void Function(UpcommingmealsRecordBuilder) updates]) =>
      (new UpcommingmealsRecordBuilder()..update(updates))._build();

  _$UpcommingmealsRecord._(
      {this.name, this.image, this.sequence, this.uid, this.reference})
      : super._();

  @override
  UpcommingmealsRecord rebuild(
          void Function(UpcommingmealsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpcommingmealsRecordBuilder toBuilder() =>
      new UpcommingmealsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpcommingmealsRecord &&
        name == other.name &&
        image == other.image &&
        sequence == other.sequence &&
        uid == other.uid &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), image.hashCode), sequence.hashCode),
            uid.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpcommingmealsRecord')
          ..add('name', name)
          ..add('image', image)
          ..add('sequence', sequence)
          ..add('uid', uid)
          ..add('reference', reference))
        .toString();
  }
}

class UpcommingmealsRecordBuilder
    implements Builder<UpcommingmealsRecord, UpcommingmealsRecordBuilder> {
  _$UpcommingmealsRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  int _sequence;
  int get sequence => _$this._sequence;
  set sequence(int sequence) => _$this._sequence = sequence;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UpcommingmealsRecordBuilder() {
    UpcommingmealsRecord._initializeBuilder(this);
  }

  UpcommingmealsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _image = $v.image;
      _sequence = $v.sequence;
      _uid = $v.uid;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpcommingmealsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpcommingmealsRecord;
  }

  @override
  void update(void Function(UpcommingmealsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  UpcommingmealsRecord build() => _build();

  _$UpcommingmealsRecord _build() {
    final _$result = _$v ??
        new _$UpcommingmealsRecord._(
            name: name,
            image: image,
            sequence: sequence,
            uid: uid,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
