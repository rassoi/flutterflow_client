import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'categories_temp_record.g.dart';

abstract class CategoriesTempRecord
    implements Built<CategoriesTempRecord, CategoriesTempRecordBuilder> {
  static Serializer<CategoriesTempRecord> get serializer =>
      _$categoriesTempRecordSerializer;

  BuiltList<String>? get list;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CategoriesTempRecordBuilder builder) =>
      builder..list = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories_temp');

  static Stream<CategoriesTempRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CategoriesTempRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CategoriesTempRecord._();
  factory CategoriesTempRecord(
          [void Function(CategoriesTempRecordBuilder) updates]) =
      _$CategoriesTempRecord;

  static CategoriesTempRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCategoriesTempRecordData() {
  final firestoreData = serializers.toFirestore(
    CategoriesTempRecord.serializer,
    CategoriesTempRecord(
      (c) => c..list = null,
    ),
  );

  return firestoreData;
}
