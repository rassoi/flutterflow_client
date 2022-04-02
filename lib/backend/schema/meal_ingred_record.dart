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
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MealIngredRecordBuilder builder) =>
      builder..english = '';

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
}) =>
    serializers.toFirestore(MealIngredRecord.serializer,
        MealIngredRecord((m) => m..english = english));
