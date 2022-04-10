import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'miscellaneous_record.g.dart';

abstract class MiscellaneousRecord
    implements Built<MiscellaneousRecord, MiscellaneousRecordBuilder> {
  static Serializer<MiscellaneousRecord> get serializer =>
      _$miscellaneousRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'categories_list')
  BuiltList<String> get categoriesList;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MiscellaneousRecordBuilder builder) =>
      builder..categoriesList = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('miscellaneous');

  static Stream<MiscellaneousRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MiscellaneousRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  MiscellaneousRecord._();
  factory MiscellaneousRecord(
          [void Function(MiscellaneousRecordBuilder) updates]) =
      _$MiscellaneousRecord;

  static MiscellaneousRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMiscellaneousRecordData() => serializers.toFirestore(
    MiscellaneousRecord.serializer,
    MiscellaneousRecord((m) => m..categoriesList = null));
