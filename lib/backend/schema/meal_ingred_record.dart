import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'meal_ingred_record.g.dart';

abstract class MealIngredRecord
    implements Built<MealIngredRecord, MealIngredRecordBuilder> {
  static Serializer<MealIngredRecord> get serializer =>
      _$mealIngredRecordSerializer;

  @nullable
  String get english;

  @nullable
  String get hindi;

  @nullable
  String get img;

  @nullable
  @BuiltValueField(wireName: 'inged_id')
  String get ingedId;

  @nullable
  @BuiltValueField(wireName: 'user_uid')
  String get userUid;

  @nullable
  String get status;

  @nullable
  @BuiltValueField(wireName: 'recipe_names')
  BuiltList<String> get recipeNames;

  @nullable
  @BuiltValueField(wireName: 'meal_count')
  int get mealCount;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MealIngredRecordBuilder builder) => builder
    ..english = ''
    ..hindi = ''
    ..img = ''
    ..ingedId = ''
    ..userUid = ''
    ..status = ''
    ..recipeNames = ListBuilder()
    ..mealCount = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meal_ingred');

  static Stream<MealIngredRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MealIngredRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MealIngredRecord._();
  factory MealIngredRecord([void Function(MealIngredRecordBuilder) updates]) =
      _$MealIngredRecord;

  static MealIngredRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMealIngredRecordData({
  String english,
  String hindi,
  String img,
  String ingedId,
  String userUid,
  String status,
  int mealCount,
}) =>
    serializers.toFirestore(
        MealIngredRecord.serializer,
        MealIngredRecord((m) => m
          ..english = english
          ..hindi = hindi
          ..img = img
          ..ingedId = ingedId
          ..userUid = userUid
          ..status = status
          ..recipeNames = null
          ..mealCount = mealCount));
