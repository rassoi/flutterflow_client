import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'temp_record.g.dart';

abstract class TempRecord implements Built<TempRecord, TempRecordBuilder> {
  static Serializer<TempRecord> get serializer => _$tempRecordSerializer;

  @nullable
  String get image;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'meal_time')
  String get mealTime;

  @nullable
  String get day;

  @nullable
  @BuiltValueField(wireName: 'youtube_link')
  String get youtubeLink;

  @nullable
  DocumentReference get ref;

  @nullable
  @BuiltValueField(wireName: 'ingred_names')
  String get ingredNames;

  @nullable
  @BuiltValueField(wireName: 'user_uid')
  String get userUid;

  @nullable
  @BuiltValueField(wireName: 'recipe_id')
  String get recipeId;

  @nullable
  int get counter;

  @nullable
  BuiltList<String> get nameAsArray;

  @nullable
  String get status;

  @nullable
  bool get fav;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TempRecordBuilder builder) => builder
    ..image = ''
    ..name = ''
    ..mealTime = ''
    ..day = ''
    ..youtubeLink = ''
    ..ingredNames = ''
    ..userUid = ''
    ..recipeId = ''
    ..counter = 0
    ..nameAsArray = ListBuilder()
    ..status = ''
    ..fav = false
    ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('temp');

  static Stream<TempRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TempRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TempRecord._();
  factory TempRecord([void Function(TempRecordBuilder) updates]) = _$TempRecord;

  static TempRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTempRecordData({
  String image,
  String name,
  String mealTime,
  String day,
  String youtubeLink,
  DocumentReference ref,
  String ingredNames,
  String userUid,
  String recipeId,
  int counter,
  String status,
  bool fav,
  String uid,
}) =>
    serializers.toFirestore(
        TempRecord.serializer,
        TempRecord((t) => t
          ..image = image
          ..name = name
          ..mealTime = mealTime
          ..day = day
          ..youtubeLink = youtubeLink
          ..ref = ref
          ..ingredNames = ingredNames
          ..userUid = userUid
          ..recipeId = recipeId
          ..counter = counter
          ..nameAsArray = null
          ..status = status
          ..fav = fav
          ..uid = uid));
