// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_ingred_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MealIngredRecord> _$mealIngredRecordSerializer =
    new _$MealIngredRecordSerializer();

class _$MealIngredRecordSerializer
    implements StructuredSerializer<MealIngredRecord> {
  @override
  final Iterable<Type> types = const [MealIngredRecord, _$MealIngredRecord];
  @override
  final String wireName = 'MealIngredRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, MealIngredRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.english;
    if (value != null) {
      result
        ..add('english')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hindi;
    if (value != null) {
      result
        ..add('hindi')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ingedId;
    if (value != null) {
      result
        ..add('inged_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userUid;
    if (value != null) {
      result
        ..add('user_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recipeNames;
    if (value != null) {
      result
        ..add('recipe_names')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.mealCount;
    if (value != null) {
      result
        ..add('meal_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('img')
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
  MealIngredRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MealIngredRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'english':
          result.english = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hindi':
          result.hindi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'inged_id':
          result.ingedId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_uid':
          result.userUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'recipe_names':
          result.recipeNames.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'meal_count':
          result.mealCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
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

class _$MealIngredRecord extends MealIngredRecord {
  @override
  final String english;
  @override
  final String hindi;
  @override
  final String ingedId;
  @override
  final String userUid;
  @override
  final String status;
  @override
  final BuiltList<String> recipeNames;
  @override
  final int mealCount;
  @override
  final String img;
  @override
  final DocumentReference<Object> reference;

  factory _$MealIngredRecord(
          [void Function(MealIngredRecordBuilder) updates]) =>
      (new MealIngredRecordBuilder()..update(updates))._build();

  _$MealIngredRecord._(
      {this.english,
      this.hindi,
      this.ingedId,
      this.userUid,
      this.status,
      this.recipeNames,
      this.mealCount,
      this.img,
      this.reference})
      : super._();

  @override
  MealIngredRecord rebuild(void Function(MealIngredRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MealIngredRecordBuilder toBuilder() =>
      new MealIngredRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MealIngredRecord &&
        english == other.english &&
        hindi == other.hindi &&
        ingedId == other.ingedId &&
        userUid == other.userUid &&
        status == other.status &&
        recipeNames == other.recipeNames &&
        mealCount == other.mealCount &&
        img == other.img &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, english.hashCode), hindi.hashCode),
                                ingedId.hashCode),
                            userUid.hashCode),
                        status.hashCode),
                    recipeNames.hashCode),
                mealCount.hashCode),
            img.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MealIngredRecord')
          ..add('english', english)
          ..add('hindi', hindi)
          ..add('ingedId', ingedId)
          ..add('userUid', userUid)
          ..add('status', status)
          ..add('recipeNames', recipeNames)
          ..add('mealCount', mealCount)
          ..add('img', img)
          ..add('reference', reference))
        .toString();
  }
}

class MealIngredRecordBuilder
    implements Builder<MealIngredRecord, MealIngredRecordBuilder> {
  _$MealIngredRecord _$v;

  String _english;
  String get english => _$this._english;
  set english(String english) => _$this._english = english;

  String _hindi;
  String get hindi => _$this._hindi;
  set hindi(String hindi) => _$this._hindi = hindi;

  String _ingedId;
  String get ingedId => _$this._ingedId;
  set ingedId(String ingedId) => _$this._ingedId = ingedId;

  String _userUid;
  String get userUid => _$this._userUid;
  set userUid(String userUid) => _$this._userUid = userUid;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  ListBuilder<String> _recipeNames;
  ListBuilder<String> get recipeNames =>
      _$this._recipeNames ??= new ListBuilder<String>();
  set recipeNames(ListBuilder<String> recipeNames) =>
      _$this._recipeNames = recipeNames;

  int _mealCount;
  int get mealCount => _$this._mealCount;
  set mealCount(int mealCount) => _$this._mealCount = mealCount;

  String _img;
  String get img => _$this._img;
  set img(String img) => _$this._img = img;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  MealIngredRecordBuilder() {
    MealIngredRecord._initializeBuilder(this);
  }

  MealIngredRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _english = $v.english;
      _hindi = $v.hindi;
      _ingedId = $v.ingedId;
      _userUid = $v.userUid;
      _status = $v.status;
      _recipeNames = $v.recipeNames?.toBuilder();
      _mealCount = $v.mealCount;
      _img = $v.img;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MealIngredRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MealIngredRecord;
  }

  @override
  void update(void Function(MealIngredRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  MealIngredRecord build() => _build();

  _$MealIngredRecord _build() {
    _$MealIngredRecord _$result;
    try {
      _$result = _$v ??
          new _$MealIngredRecord._(
              english: english,
              hindi: hindi,
              ingedId: ingedId,
              userUid: userUid,
              status: status,
              recipeNames: _recipeNames?.build(),
              mealCount: mealCount,
              img: img,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'recipeNames';
        _recipeNames?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MealIngredRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
