import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'temp_record.g.dart';

abstract class TempRecord implements Built<TempRecord, TempRecordBuilder> {
  static Serializer<TempRecord> get serializer => _$tempRecordSerializer;

  String? get image;

  String? get name;

  @BuiltValueField(wireName: 'youtube_link')
  String? get youtubeLink;

  DocumentReference? get ref;

  @BuiltValueField(wireName: 'ingred_names')
  String? get ingredNames;

  @BuiltValueField(wireName: 'user_uid')
  String? get userUid;

  @BuiltValueField(wireName: 'recipe_id')
  String? get recipeId;

  int? get counter;

  BuiltList<String>? get nameAsArray;

  String? get status;

  bool? get fav;

  String? get uid;

  @BuiltValueField(wireName: 'meal_time')
  BuiltList<String>? get mealTime;

  BuiltList<String>? get day;

  @BuiltValueField(wireName: 'which_meal')
  BuiltList<String>? get whichMeal;

  BuiltList<String>? get dates;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TempRecordBuilder builder) => builder
    ..image = ''
    ..name = ''
    ..youtubeLink = ''
    ..ingredNames = ''
    ..userUid = ''
    ..recipeId = ''
    ..counter = 0
    ..nameAsArray = ListBuilder()
    ..status = ''
    ..fav = false
    ..uid = ''
    ..mealTime = ListBuilder()
    ..day = ListBuilder()
    ..whichMeal = ListBuilder()
    ..dates = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('temp');

  static Stream<TempRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TempRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TempRecord._();
  factory TempRecord([void Function(TempRecordBuilder) updates]) = _$TempRecord;

  static TempRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTempRecordData({
  String? image,
  String? name,
  String? youtubeLink,
  DocumentReference? ref,
  String? ingredNames,
  String? userUid,
  String? recipeId,
  int? counter,
  String? status,
  bool? fav,
  String? uid,
}) {
  final firestoreData = serializers.toFirestore(
    TempRecord.serializer,
    TempRecord(
      (t) => t
        ..image = image
        ..name = name
        ..youtubeLink = youtubeLink
        ..ref = ref
        ..ingredNames = ingredNames
        ..userUid = userUid
        ..recipeId = recipeId
        ..counter = counter
        ..nameAsArray = null
        ..status = status
        ..fav = fav
        ..uid = uid
        ..mealTime = null
        ..day = null
        ..whichMeal = null
        ..dates = null,
    ),
  );

  return firestoreData;
}
