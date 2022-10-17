// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BannerRecord> _$bannerRecordSerializer =
    new _$BannerRecordSerializer();

class _$BannerRecordSerializer implements StructuredSerializer<BannerRecord> {
  @override
  final Iterable<Type> types = const [BannerRecord, _$BannerRecord];
  @override
  final String wireName = 'BannerRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, BannerRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
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
  BannerRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BannerRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'image':
          result.image = serializers.deserialize(value,
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

class _$BannerRecord extends BannerRecord {
  @override
  final String? image;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BannerRecord([void Function(BannerRecordBuilder)? updates]) =>
      (new BannerRecordBuilder()..update(updates))._build();

  _$BannerRecord._({this.image, this.ffRef}) : super._();

  @override
  BannerRecord rebuild(void Function(BannerRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BannerRecordBuilder toBuilder() => new BannerRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BannerRecord &&
        image == other.image &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, image.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BannerRecord')
          ..add('image', image)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BannerRecordBuilder
    implements Builder<BannerRecord, BannerRecordBuilder> {
  _$BannerRecord? _$v;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BannerRecordBuilder() {
    BannerRecord._initializeBuilder(this);
  }

  BannerRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image = $v.image;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BannerRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BannerRecord;
  }

  @override
  void update(void Function(BannerRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BannerRecord build() => _build();

  _$BannerRecord _build() {
    final _$result = _$v ?? new _$BannerRecord._(image: image, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
