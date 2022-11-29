// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_temp_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RecipesTempRecord> _$recipesTempRecordSerializer =
    new _$RecipesTempRecordSerializer();

class _$RecipesTempRecordSerializer
    implements StructuredSerializer<RecipesTempRecord> {
  @override
  final Iterable<Type> types = const [RecipesTempRecord, _$RecipesTempRecord];
  @override
  final String wireName = 'RecipesTempRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecipesTempRecord object,
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
    value = object.mealTime;
    if (value != null) {
      result
        ..add('mealTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameHindi;
    if (value != null) {
      result
        ..add('name_hindi')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recipeId;
    if (value != null) {
      result
        ..add('recipe_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subCategories;
    if (value != null) {
      result
        ..add('subCategories')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.categoryName;
    if (value != null) {
      result
        ..add('categoryName')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.veg;
    if (value != null) {
      result
        ..add('veg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.youtubeLink;
    if (value != null) {
      result
        ..add('youtube_link')
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
  RecipesTempRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecipesTempRecordBuilder();

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
        case 'mealTime':
          result.mealTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name_hindi':
          result.nameHindi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recipe_id':
          result.recipeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'subCategories':
          result.subCategories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'categoryName':
          result.categoryName.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'veg':
          result.veg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'youtube_link':
          result.youtubeLink = serializers.deserialize(value,
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

class _$RecipesTempRecord extends RecipesTempRecord {
  @override
  final String? image;
  @override
  final String? mealTime;
  @override
  final String? name;
  @override
  final String? nameHindi;
  @override
  final String? recipeId;
  @override
  final BuiltList<String>? subCategories;
  @override
  final BuiltList<String>? categoryName;
  @override
  final String? veg;
  @override
  final String? youtubeLink;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RecipesTempRecord(
          [void Function(RecipesTempRecordBuilder)? updates]) =>
      (new RecipesTempRecordBuilder()..update(updates))._build();

  _$RecipesTempRecord._(
      {this.image,
      this.mealTime,
      this.name,
      this.nameHindi,
      this.recipeId,
      this.subCategories,
      this.categoryName,
      this.veg,
      this.youtubeLink,
      this.ffRef})
      : super._();

  @override
  RecipesTempRecord rebuild(void Function(RecipesTempRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipesTempRecordBuilder toBuilder() =>
      new RecipesTempRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipesTempRecord &&
        image == other.image &&
        mealTime == other.mealTime &&
        name == other.name &&
        nameHindi == other.nameHindi &&
        recipeId == other.recipeId &&
        subCategories == other.subCategories &&
        categoryName == other.categoryName &&
        veg == other.veg &&
        youtubeLink == other.youtubeLink &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, image.hashCode),
                                        mealTime.hashCode),
                                    name.hashCode),
                                nameHindi.hashCode),
                            recipeId.hashCode),
                        subCategories.hashCode),
                    categoryName.hashCode),
                veg.hashCode),
            youtubeLink.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipesTempRecord')
          ..add('image', image)
          ..add('mealTime', mealTime)
          ..add('name', name)
          ..add('nameHindi', nameHindi)
          ..add('recipeId', recipeId)
          ..add('subCategories', subCategories)
          ..add('categoryName', categoryName)
          ..add('veg', veg)
          ..add('youtubeLink', youtubeLink)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RecipesTempRecordBuilder
    implements Builder<RecipesTempRecord, RecipesTempRecordBuilder> {
  _$RecipesTempRecord? _$v;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _mealTime;
  String? get mealTime => _$this._mealTime;
  set mealTime(String? mealTime) => _$this._mealTime = mealTime;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _nameHindi;
  String? get nameHindi => _$this._nameHindi;
  set nameHindi(String? nameHindi) => _$this._nameHindi = nameHindi;

  String? _recipeId;
  String? get recipeId => _$this._recipeId;
  set recipeId(String? recipeId) => _$this._recipeId = recipeId;

  ListBuilder<String>? _subCategories;
  ListBuilder<String> get subCategories =>
      _$this._subCategories ??= new ListBuilder<String>();
  set subCategories(ListBuilder<String>? subCategories) =>
      _$this._subCategories = subCategories;

  ListBuilder<String>? _categoryName;
  ListBuilder<String> get categoryName =>
      _$this._categoryName ??= new ListBuilder<String>();
  set categoryName(ListBuilder<String>? categoryName) =>
      _$this._categoryName = categoryName;

  String? _veg;
  String? get veg => _$this._veg;
  set veg(String? veg) => _$this._veg = veg;

  String? _youtubeLink;
  String? get youtubeLink => _$this._youtubeLink;
  set youtubeLink(String? youtubeLink) => _$this._youtubeLink = youtubeLink;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RecipesTempRecordBuilder() {
    RecipesTempRecord._initializeBuilder(this);
  }

  RecipesTempRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image = $v.image;
      _mealTime = $v.mealTime;
      _name = $v.name;
      _nameHindi = $v.nameHindi;
      _recipeId = $v.recipeId;
      _subCategories = $v.subCategories?.toBuilder();
      _categoryName = $v.categoryName?.toBuilder();
      _veg = $v.veg;
      _youtubeLink = $v.youtubeLink;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipesTempRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipesTempRecord;
  }

  @override
  void update(void Function(RecipesTempRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipesTempRecord build() => _build();

  _$RecipesTempRecord _build() {
    _$RecipesTempRecord _$result;
    try {
      _$result = _$v ??
          new _$RecipesTempRecord._(
              image: image,
              mealTime: mealTime,
              name: name,
              nameHindi: nameHindi,
              recipeId: recipeId,
              subCategories: _subCategories?.build(),
              categoryName: _categoryName?.build(),
              veg: veg,
              youtubeLink: youtubeLink,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subCategories';
        _subCategories?.build();
        _$failedField = 'categoryName';
        _categoryName?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecipesTempRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
