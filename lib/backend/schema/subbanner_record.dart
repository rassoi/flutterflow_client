import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'subbanner_record.g.dart';

abstract class SubbannerRecord
    implements Built<SubbannerRecord, SubbannerRecordBuilder> {
  static Serializer<SubbannerRecord> get serializer =>
      _$subbannerRecordSerializer;

  BuiltList<String>? get array;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(SubbannerRecordBuilder builder) =>
      builder..array = ListBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('subbanner')
          : FirebaseFirestore.instance.collectionGroup('subbanner');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('subbanner').doc();

  static Stream<SubbannerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SubbannerRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SubbannerRecord._();
  factory SubbannerRecord([void Function(SubbannerRecordBuilder) updates]) =
      _$SubbannerRecord;

  static SubbannerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSubbannerRecordData() {
  final firestoreData = serializers.toFirestore(
    SubbannerRecord.serializer,
    SubbannerRecord(
      (s) => s..array = null,
    ),
  );

  return firestoreData;
}
