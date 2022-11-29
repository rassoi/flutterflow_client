import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'recipes_temp_record.g.dart';

abstract class RecipesTempRecord
    implements Built<RecipesTempRecord, RecipesTempRecordBuilder> {
  static Serializer<RecipesTempRecord> get serializer =>
      _$recipesTempRecordSerializer;

  String? get image;

  String? get mealTime;

  String? get name;

  @BuiltValueField(wireName: 'name_hindi')
  String? get nameHindi;

  @BuiltValueField(wireName: 'recipe_id')
  String? get recipeId;

  BuiltList<String>? get subCategories;

  BuiltList<String>? get categoryName;

  String? get veg;

  @BuiltValueField(wireName: 'youtube_link')
  String? get youtubeLink;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RecipesTempRecordBuilder builder) => builder
    ..image = ''
    ..mealTime = ''
    ..name = ''
    ..nameHindi = ''
    ..recipeId = ''
    ..subCategories = ListBuilder()
    ..categoryName = ListBuilder()
    ..veg = ''
    ..youtubeLink = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recipes_temp');

  static Stream<RecipesTempRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RecipesTempRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RecipesTempRecord._();
  factory RecipesTempRecord([void Function(RecipesTempRecordBuilder) updates]) =
      _$RecipesTempRecord;

  static RecipesTempRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRecipesTempRecordData({
  String? image,
  String? mealTime,
  String? name,
  String? nameHindi,
  String? recipeId,
  String? veg,
  String? youtubeLink,
}) {
  final firestoreData = serializers.toFirestore(
    RecipesTempRecord.serializer,
    RecipesTempRecord(
      (r) => r
        ..image = image
        ..mealTime = mealTime
        ..name = name
        ..nameHindi = nameHindi
        ..recipeId = recipeId
        ..subCategories = null
        ..categoryName = null
        ..veg = veg
        ..youtubeLink = youtubeLink,
    ),
  );

  return firestoreData;
}
