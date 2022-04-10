import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'recipes_record.g.dart';

abstract class RecipesRecord
    implements Built<RecipesRecord, RecipesRecordBuilder> {
  static Serializer<RecipesRecord> get serializer => _$recipesRecordSerializer;

  @nullable
  String get image;

  @nullable
  String get name;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'youtube_link')
  String get youtubeLink;

  @nullable
  DocumentReference get ref;

  @nullable
  @BuiltValueField(wireName: 'ingred_names')
  String get ingredNames;

  @nullable
  String get desc;

  @nullable
  BuiltList<String> get nameAsArray;

  @nullable
  @BuiltValueField(wireName: 'recipe_id')
  String get recipeId;

  @nullable
  BuiltList<String> get categoryName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RecipesRecordBuilder builder) => builder
    ..image = ''
    ..name = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..youtubeLink = ''
    ..ingredNames = ''
    ..desc = ''
    ..nameAsArray = ListBuilder()
    ..recipeId = ''
    ..categoryName = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recipes');

  static Stream<RecipesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static RecipesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      RecipesRecord(
        (c) => c
          ..image = snapshot.data['image']
          ..name = snapshot.data['name']
          ..email = snapshot.data['email']
          ..displayName = snapshot.data['display_name']
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..youtubeLink = snapshot.data['youtube_link']
          ..ref = safeGet(() => toRef(snapshot.data['ref']))
          ..ingredNames = snapshot.data['ingred_names']
          ..desc = snapshot.data['desc']
          ..nameAsArray =
              safeGet(() => ListBuilder(snapshot.data['nameAsArray']))
          ..recipeId = snapshot.data['recipe_id']
          ..categoryName =
              safeGet(() => ListBuilder(snapshot.data['categoryName']))
          ..reference = RecipesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RecipesRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'recipes',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  RecipesRecord._();
  factory RecipesRecord([void Function(RecipesRecordBuilder) updates]) =
      _$RecipesRecord;

  static RecipesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRecipesRecordData({
  String image,
  String name,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String youtubeLink,
  DocumentReference ref,
  String ingredNames,
  String desc,
  String recipeId,
}) =>
    serializers.toFirestore(
        RecipesRecord.serializer,
        RecipesRecord((r) => r
          ..image = image
          ..name = name
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..youtubeLink = youtubeLink
          ..ref = ref
          ..ingredNames = ingredNames
          ..desc = desc
          ..nameAsArray = null
          ..recipeId = recipeId
          ..categoryName = null));
