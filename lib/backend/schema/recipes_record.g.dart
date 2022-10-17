// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RecipesRecord> _$recipesRecordSerializer =
    new _$RecipesRecordSerializer();

class _$RecipesRecordSerializer implements StructuredSerializer<RecipesRecord> {
  @override
  final Iterable<Type> types = const [RecipesRecord, _$RecipesRecord];
  @override
  final String wireName = 'RecipesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecipesRecord object,
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
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
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
    value = object.ref;
    if (value != null) {
      result
        ..add('ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ingredNames;
    if (value != null) {
      result
        ..add('ingred_names')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.desc;
    if (value != null) {
      result
        ..add('desc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameAsArray;
    if (value != null) {
      result
        ..add('nameAsArray')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.recipeId;
    if (value != null) {
      result
        ..add('recipe_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryName;
    if (value != null) {
      result
        ..add('categoryName')
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
  RecipesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecipesRecordBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'youtube_link':
          result.youtubeLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ref':
          result.ref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'ingred_names':
          result.ingredNames = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'desc':
          result.desc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nameAsArray':
          result.nameAsArray.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'recipe_id':
          result.recipeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'categoryName':
          result.categoryName.replace(serializers.deserialize(value,
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

class _$RecipesRecord extends RecipesRecord {
  @override
  final String? image;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? youtubeLink;
  @override
  final DocumentReference<Object?>? ref;
  @override
  final String? ingredNames;
  @override
  final String? desc;
  @override
  final BuiltList<String>? nameAsArray;
  @override
  final String? recipeId;
  @override
  final BuiltList<String>? categoryName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RecipesRecord([void Function(RecipesRecordBuilder)? updates]) =>
      (new RecipesRecordBuilder()..update(updates))._build();

  _$RecipesRecord._(
      {this.image,
      this.name,
      this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.youtubeLink,
      this.ref,
      this.ingredNames,
      this.desc,
      this.nameAsArray,
      this.recipeId,
      this.categoryName,
      this.ffRef})
      : super._();

  @override
  RecipesRecord rebuild(void Function(RecipesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipesRecordBuilder toBuilder() => new RecipesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipesRecord &&
        image == other.image &&
        name == other.name &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        youtubeLink == other.youtubeLink &&
        ref == other.ref &&
        ingredNames == other.ingredNames &&
        desc == other.desc &&
        nameAsArray == other.nameAsArray &&
        recipeId == other.recipeId &&
        categoryName == other.categoryName &&
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
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    image
                                                                        .hashCode),
                                                                name.hashCode),
                                                            email.hashCode),
                                                        displayName.hashCode),
                                                    photoUrl.hashCode),
                                                uid.hashCode),
                                            createdTime.hashCode),
                                        phoneNumber.hashCode),
                                    youtubeLink.hashCode),
                                ref.hashCode),
                            ingredNames.hashCode),
                        desc.hashCode),
                    nameAsArray.hashCode),
                recipeId.hashCode),
            categoryName.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipesRecord')
          ..add('image', image)
          ..add('name', name)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('youtubeLink', youtubeLink)
          ..add('ref', ref)
          ..add('ingredNames', ingredNames)
          ..add('desc', desc)
          ..add('nameAsArray', nameAsArray)
          ..add('recipeId', recipeId)
          ..add('categoryName', categoryName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RecipesRecordBuilder
    implements Builder<RecipesRecord, RecipesRecordBuilder> {
  _$RecipesRecord? _$v;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _youtubeLink;
  String? get youtubeLink => _$this._youtubeLink;
  set youtubeLink(String? youtubeLink) => _$this._youtubeLink = youtubeLink;

  DocumentReference<Object?>? _ref;
  DocumentReference<Object?>? get ref => _$this._ref;
  set ref(DocumentReference<Object?>? ref) => _$this._ref = ref;

  String? _ingredNames;
  String? get ingredNames => _$this._ingredNames;
  set ingredNames(String? ingredNames) => _$this._ingredNames = ingredNames;

  String? _desc;
  String? get desc => _$this._desc;
  set desc(String? desc) => _$this._desc = desc;

  ListBuilder<String>? _nameAsArray;
  ListBuilder<String> get nameAsArray =>
      _$this._nameAsArray ??= new ListBuilder<String>();
  set nameAsArray(ListBuilder<String>? nameAsArray) =>
      _$this._nameAsArray = nameAsArray;

  String? _recipeId;
  String? get recipeId => _$this._recipeId;
  set recipeId(String? recipeId) => _$this._recipeId = recipeId;

  ListBuilder<String>? _categoryName;
  ListBuilder<String> get categoryName =>
      _$this._categoryName ??= new ListBuilder<String>();
  set categoryName(ListBuilder<String>? categoryName) =>
      _$this._categoryName = categoryName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RecipesRecordBuilder() {
    RecipesRecord._initializeBuilder(this);
  }

  RecipesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image = $v.image;
      _name = $v.name;
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _youtubeLink = $v.youtubeLink;
      _ref = $v.ref;
      _ingredNames = $v.ingredNames;
      _desc = $v.desc;
      _nameAsArray = $v.nameAsArray?.toBuilder();
      _recipeId = $v.recipeId;
      _categoryName = $v.categoryName?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipesRecord;
  }

  @override
  void update(void Function(RecipesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipesRecord build() => _build();

  _$RecipesRecord _build() {
    _$RecipesRecord _$result;
    try {
      _$result = _$v ??
          new _$RecipesRecord._(
              image: image,
              name: name,
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              youtubeLink: youtubeLink,
              ref: ref,
              ingredNames: ingredNames,
              desc: desc,
              nameAsArray: _nameAsArray?.build(),
              recipeId: recipeId,
              categoryName: _categoryName?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nameAsArray';
        _nameAsArray?.build();

        _$failedField = 'categoryName';
        _categoryName?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecipesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
