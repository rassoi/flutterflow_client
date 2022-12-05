import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'meal_ingred_record.g.dart';

abstract class MealIngredRecord
    implements Built<MealIngredRecord, MealIngredRecordBuilder> {
  static Serializer<MealIngredRecord> get serializer =>
      _$mealIngredRecordSerializer;

  String? get english;

  String? get hindi;

  @BuiltValueField(wireName: 'inged_id')
  String? get ingedId;

  @BuiltValueField(wireName: 'user_uid')
  String? get userUid;

  String? get status;

  @BuiltValueField(wireName: 'recipe_names')
  BuiltList<String>? get recipeNames;

  @BuiltValueField(wireName: 'meal_count')
  int? get mealCount;

  String? get img;

  int? get audit;

  int? get price;

  String? get desc;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MealIngredRecordBuilder builder) => builder
    ..english = ''
    ..hindi = ''
    ..ingedId = ''
    ..userUid = ''
    ..status = ''
    ..recipeNames = ListBuilder()
    ..mealCount = 0
    ..img = ''
    ..audit = 0
    ..price = 0
    ..desc = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meal_ingred');

  static Stream<MealIngredRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MealIngredRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MealIngredRecord._();
  factory MealIngredRecord([void Function(MealIngredRecordBuilder) updates]) =
      _$MealIngredRecord;

  static MealIngredRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMealIngredRecordData({
  String? english,
  String? hindi,
  String? ingedId,
  String? userUid,
  String? status,
  int? mealCount,
  String? img,
  int? audit,
  int? price,
  String? desc,
}) {
  final firestoreData = serializers.toFirestore(
    MealIngredRecord.serializer,
    MealIngredRecord(
      (m) => m
        ..english = english
        ..hindi = hindi
        ..ingedId = ingedId
        ..userUid = userUid
        ..status = status
        ..recipeNames = null
        ..mealCount = mealCount
        ..img = img
        ..audit = audit
        ..price = price
        ..desc = desc,
    ),
  );

  return firestoreData;
}
