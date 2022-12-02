import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'category_temp_record.g.dart';

abstract class CategoryTempRecord
    implements Built<CategoryTempRecord, CategoryTempRecordBuilder> {
  static Serializer<CategoryTempRecord> get serializer =>
      _$categoryTempRecordSerializer;

  BuiltList<String>? get categoriName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CategoryTempRecordBuilder builder) =>
      builder..categoriName = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categoryTemp');

  static Stream<CategoryTempRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CategoryTempRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CategoryTempRecord._();
  factory CategoryTempRecord(
          [void Function(CategoryTempRecordBuilder) updates]) =
      _$CategoryTempRecord;

  static CategoryTempRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCategoryTempRecordData() {
  final firestoreData = serializers.toFirestore(
    CategoryTempRecord.serializer,
    CategoryTempRecord(
      (c) => c..categoriName = null,
    ),
  );

  return firestoreData;
}
