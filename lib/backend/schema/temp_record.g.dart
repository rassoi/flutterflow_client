// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TempRecord> _$tempRecordSerializer = new _$TempRecordSerializer();

class _$TempRecordSerializer implements StructuredSerializer<TempRecord> {
  @override
  final Iterable<Type> types = const [TempRecord, _$TempRecord];
  @override
  final String wireName = 'TempRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TempRecord object,
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
    value = object.userUid;
    if (value != null) {
      result
        ..add('user_uid')
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
    value = object.counter;
    if (value != null) {
      result
        ..add('counter')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.nameAsArray;
    if (value != null) {
      result
        ..add('nameAsArray')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fav;
    if (value != null) {
      result
        ..add('fav')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mealTime;
    if (value != null) {
      result
        ..add('meal_time')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.whichMeal;
    if (value != null) {
      result
        ..add('which_meal')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.dates;
    if (value != null) {
      result
        ..add('dates')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.longPreperation;
    if (value != null) {
      result
        ..add('longPreperation')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.veg;
    if (value != null) {
      result
        ..add('veg')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  TempRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TempRecordBuilder();

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
        case 'user_uid':
          result.userUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recipe_id':
          result.recipeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'counter':
          result.counter = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'nameAsArray':
          result.nameAsArray.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fav':
          result.fav = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'meal_time':
          result.mealTime.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'day':
          result.day.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'which_meal':
          result.whichMeal.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'dates':
          result.dates.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'longPreperation':
          result.longPreperation = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'veg':
          result.veg = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$TempRecord extends TempRecord {
  @override
  final String? image;
  @override
  final String? name;
  @override
  final String? youtubeLink;
  @override
  final DocumentReference<Object?>? ref;
  @override
  final String? ingredNames;
  @override
  final String? userUid;
  @override
  final String? recipeId;
  @override
  final int? counter;
  @override
  final BuiltList<String>? nameAsArray;
  @override
  final String? status;
  @override
  final bool? fav;
  @override
  final String? uid;
  @override
  final BuiltList<String>? mealTime;
  @override
  final BuiltList<String>? day;
  @override
  final BuiltList<String>? whichMeal;
  @override
  final BuiltList<String>? dates;
  @override
  final int? longPreperation;
  @override
  final bool? veg;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TempRecord([void Function(TempRecordBuilder)? updates]) =>
      (new TempRecordBuilder()..update(updates))._build();

  _$TempRecord._(
      {this.image,
      this.name,
      this.youtubeLink,
      this.ref,
      this.ingredNames,
      this.userUid,
      this.recipeId,
      this.counter,
      this.nameAsArray,
      this.status,
      this.fav,
      this.uid,
      this.mealTime,
      this.day,
      this.whichMeal,
      this.dates,
      this.longPreperation,
      this.veg,
      this.ffRef})
      : super._();

  @override
  TempRecord rebuild(void Function(TempRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TempRecordBuilder toBuilder() => new TempRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TempRecord &&
        image == other.image &&
        name == other.name &&
        youtubeLink == other.youtubeLink &&
        ref == other.ref &&
        ingredNames == other.ingredNames &&
        userUid == other.userUid &&
        recipeId == other.recipeId &&
        counter == other.counter &&
        nameAsArray == other.nameAsArray &&
        status == other.status &&
        fav == other.fav &&
        uid == other.uid &&
        mealTime == other.mealTime &&
        day == other.day &&
        whichMeal == other.whichMeal &&
        dates == other.dates &&
        longPreperation == other.longPreperation &&
        veg == other.veg &&
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
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                image
                                                                                    .hashCode),
                                                                            name
                                                                                .hashCode),
                                                                        youtubeLink
                                                                            .hashCode),
                                                                    ref
                                                                        .hashCode),
                                                                ingredNames
                                                                    .hashCode),
                                                            userUid.hashCode),
                                                        recipeId.hashCode),
                                                    counter.hashCode),
                                                nameAsArray.hashCode),
                                            status.hashCode),
                                        fav.hashCode),
                                    uid.hashCode),
                                mealTime.hashCode),
                            day.hashCode),
                        whichMeal.hashCode),
                    dates.hashCode),
                longPreperation.hashCode),
            veg.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TempRecord')
          ..add('image', image)
          ..add('name', name)
          ..add('youtubeLink', youtubeLink)
          ..add('ref', ref)
          ..add('ingredNames', ingredNames)
          ..add('userUid', userUid)
          ..add('recipeId', recipeId)
          ..add('counter', counter)
          ..add('nameAsArray', nameAsArray)
          ..add('status', status)
          ..add('fav', fav)
          ..add('uid', uid)
          ..add('mealTime', mealTime)
          ..add('day', day)
          ..add('whichMeal', whichMeal)
          ..add('dates', dates)
          ..add('longPreperation', longPreperation)
          ..add('veg', veg)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TempRecordBuilder implements Builder<TempRecord, TempRecordBuilder> {
  _$TempRecord? _$v;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _youtubeLink;
  String? get youtubeLink => _$this._youtubeLink;
  set youtubeLink(String? youtubeLink) => _$this._youtubeLink = youtubeLink;

  DocumentReference<Object?>? _ref;
  DocumentReference<Object?>? get ref => _$this._ref;
  set ref(DocumentReference<Object?>? ref) => _$this._ref = ref;

  String? _ingredNames;
  String? get ingredNames => _$this._ingredNames;
  set ingredNames(String? ingredNames) => _$this._ingredNames = ingredNames;

  String? _userUid;
  String? get userUid => _$this._userUid;
  set userUid(String? userUid) => _$this._userUid = userUid;

  String? _recipeId;
  String? get recipeId => _$this._recipeId;
  set recipeId(String? recipeId) => _$this._recipeId = recipeId;

  int? _counter;
  int? get counter => _$this._counter;
  set counter(int? counter) => _$this._counter = counter;

  ListBuilder<String>? _nameAsArray;
  ListBuilder<String> get nameAsArray =>
      _$this._nameAsArray ??= new ListBuilder<String>();
  set nameAsArray(ListBuilder<String>? nameAsArray) =>
      _$this._nameAsArray = nameAsArray;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  bool? _fav;
  bool? get fav => _$this._fav;
  set fav(bool? fav) => _$this._fav = fav;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  ListBuilder<String>? _mealTime;
  ListBuilder<String> get mealTime =>
      _$this._mealTime ??= new ListBuilder<String>();
  set mealTime(ListBuilder<String>? mealTime) => _$this._mealTime = mealTime;

  ListBuilder<String>? _day;
  ListBuilder<String> get day => _$this._day ??= new ListBuilder<String>();
  set day(ListBuilder<String>? day) => _$this._day = day;

  ListBuilder<String>? _whichMeal;
  ListBuilder<String> get whichMeal =>
      _$this._whichMeal ??= new ListBuilder<String>();
  set whichMeal(ListBuilder<String>? whichMeal) =>
      _$this._whichMeal = whichMeal;

  ListBuilder<String>? _dates;
  ListBuilder<String> get dates => _$this._dates ??= new ListBuilder<String>();
  set dates(ListBuilder<String>? dates) => _$this._dates = dates;

  int? _longPreperation;
  int? get longPreperation => _$this._longPreperation;
  set longPreperation(int? longPreperation) =>
      _$this._longPreperation = longPreperation;

  bool? _veg;
  bool? get veg => _$this._veg;
  set veg(bool? veg) => _$this._veg = veg;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TempRecordBuilder() {
    TempRecord._initializeBuilder(this);
  }

  TempRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image = $v.image;
      _name = $v.name;
      _youtubeLink = $v.youtubeLink;
      _ref = $v.ref;
      _ingredNames = $v.ingredNames;
      _userUid = $v.userUid;
      _recipeId = $v.recipeId;
      _counter = $v.counter;
      _nameAsArray = $v.nameAsArray?.toBuilder();
      _status = $v.status;
      _fav = $v.fav;
      _uid = $v.uid;
      _mealTime = $v.mealTime?.toBuilder();
      _day = $v.day?.toBuilder();
      _whichMeal = $v.whichMeal?.toBuilder();
      _dates = $v.dates?.toBuilder();
      _longPreperation = $v.longPreperation;
      _veg = $v.veg;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TempRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TempRecord;
  }

  @override
  void update(void Function(TempRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TempRecord build() => _build();

  _$TempRecord _build() {
    _$TempRecord _$result;
    try {
      _$result = _$v ??
          new _$TempRecord._(
              image: image,
              name: name,
              youtubeLink: youtubeLink,
              ref: ref,
              ingredNames: ingredNames,
              userUid: userUid,
              recipeId: recipeId,
              counter: counter,
              nameAsArray: _nameAsArray?.build(),
              status: status,
              fav: fav,
              uid: uid,
              mealTime: _mealTime?.build(),
              day: _day?.build(),
              whichMeal: _whichMeal?.build(),
              dates: _dates?.build(),
              longPreperation: longPreperation,
              veg: veg,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nameAsArray';
        _nameAsArray?.build();

        _$failedField = 'mealTime';
        _mealTime?.build();
        _$failedField = 'day';
        _day?.build();
        _$failedField = 'whichMeal';
        _whichMeal?.build();
        _$failedField = 'dates';
        _dates?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TempRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
