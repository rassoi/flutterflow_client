import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'miscellaneous_record.g.dart';

abstract class MiscellaneousRecord
    implements Built<MiscellaneousRecord, MiscellaneousRecordBuilder> {
  static Serializer<MiscellaneousRecord> get serializer =>
      _$miscellaneousRecordSerializer;

  @BuiltValueField(wireName: 'categories_list')
  BuiltList<String>? get categoriesList;

  int? get avaialable;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MiscellaneousRecordBuilder builder) => builder
    ..categoriesList = ListBuilder()
    ..avaialable = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('miscellaneous');

  static Stream<MiscellaneousRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MiscellaneousRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MiscellaneousRecord._();
  factory MiscellaneousRecord(
          [void Function(MiscellaneousRecordBuilder) updates]) =
      _$MiscellaneousRecord;

  static MiscellaneousRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMiscellaneousRecordData({
  int? avaialable,
}) {
  final firestoreData = serializers.toFirestore(
    MiscellaneousRecord.serializer,
    MiscellaneousRecord(
      (m) => m
        ..categoriesList = null
        ..avaialable = avaialable,
    ),
  );

  return firestoreData;
}
