// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingreds_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IngredsRecord> _$ingredsRecordSerializer =
    new _$IngredsRecordSerializer();

class _$IngredsRecordSerializer implements StructuredSerializer<IngredsRecord> {
  @override
  final Iterable<Type> types = const [IngredsRecord, _$IngredsRecord];
  @override
  final String wireName = 'IngredsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, IngredsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.english;
    if (value != null) {
      result
        ..add('english')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  IngredsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IngredsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'english':
          result.english = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$IngredsRecord extends IngredsRecord {
  @override
  final String? english;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$IngredsRecord([void Function(IngredsRecordBuilder)? updates]) =>
      (new IngredsRecordBuilder()..update(updates))._build();

  _$IngredsRecord._({this.english, this.ffRef}) : super._();

  @override
  IngredsRecord rebuild(void Function(IngredsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IngredsRecordBuilder toBuilder() => new IngredsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IngredsRecord &&
        english == other.english &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, english.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IngredsRecord')
          ..add('english', english)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class IngredsRecordBuilder
    implements Builder<IngredsRecord, IngredsRecordBuilder> {
  _$IngredsRecord? _$v;

  String? _english;
  String? get english => _$this._english;
  set english(String? english) => _$this._english = english;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  IngredsRecordBuilder() {
    IngredsRecord._initializeBuilder(this);
  }

  IngredsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _english = $v.english;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IngredsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IngredsRecord;
  }

  @override
  void update(void Function(IngredsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IngredsRecord build() => _build();

  _$IngredsRecord _build() {
    final _$result =
        _$v ?? new _$IngredsRecord._(english: english, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
