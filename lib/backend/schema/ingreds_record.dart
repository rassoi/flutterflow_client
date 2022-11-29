import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'ingreds_record.g.dart';

abstract class IngredsRecord
    implements Built<IngredsRecord, IngredsRecordBuilder> {
  static Serializer<IngredsRecord> get serializer => _$ingredsRecordSerializer;

  String? get english;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(IngredsRecordBuilder builder) =>
      builder..english = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ingreds')
          : FirebaseFirestore.instance.collectionGroup('ingreds');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('ingreds').doc();

  static Stream<IngredsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<IngredsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  IngredsRecord._();
  factory IngredsRecord([void Function(IngredsRecordBuilder) updates]) =
      _$IngredsRecord;

  static IngredsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createIngredsRecordData({
  String? english,
}) {
  final firestoreData = serializers.toFirestore(
    IngredsRecord.serializer,
    IngredsRecord(
      (i) => i..english = english,
    ),
  );

  return firestoreData;
}
