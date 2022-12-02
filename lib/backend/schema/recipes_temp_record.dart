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

  String? get name;

  @BuiltValueField(wireName: 'name_hindi')
  String? get nameHindi;

  @BuiltValueField(wireName: 'recipe_id')
  String? get recipeId;

  BuiltList<String>? get subCategories;

  BuiltList<String>? get categoryName;

  @BuiltValueField(wireName: 'youtube_link')
  String? get youtubeLink;

  bool? get veg;

  BuiltList<String>? get mealTime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RecipesTempRecordBuilder builder) => builder
    ..image = ''
    ..name = ''
    ..nameHindi = ''
    ..recipeId = ''
    ..subCategories = ListBuilder()
    ..categoryName = ListBuilder()
    ..youtubeLink = ''
    ..veg = false
    ..mealTime = ListBuilder();

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
  String? name,
  String? nameHindi,
  String? recipeId,
  String? youtubeLink,
  bool? veg,
}) {
  final firestoreData = serializers.toFirestore(
    RecipesTempRecord.serializer,
    RecipesTempRecord(
      (r) => r
        ..image = image
        ..name = name
        ..nameHindi = nameHindi
        ..recipeId = recipeId
        ..subCategories = null
        ..categoryName = null
        ..youtubeLink = youtubeLink
        ..veg = veg
        ..mealTime = null,
    ),
  );

  return firestoreData;
}
