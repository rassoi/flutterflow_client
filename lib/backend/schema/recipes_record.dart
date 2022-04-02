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
    ..nameAsArray = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recipes');

  static Stream<RecipesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

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
          ..nameAsArray = null));
