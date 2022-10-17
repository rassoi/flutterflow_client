import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'upcomming_meals_record.g.dart';

abstract class UpcommingMealsRecord
    implements Built<UpcommingMealsRecord, UpcommingMealsRecordBuilder> {
  static Serializer<UpcommingMealsRecord> get serializer =>
      _$upcommingMealsRecordSerializer;

  String? get image;

  String? get text;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UpcommingMealsRecordBuilder builder) => builder
    ..image = ''
    ..text = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('upcomming_meals');

  static Stream<UpcommingMealsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UpcommingMealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UpcommingMealsRecord._();
  factory UpcommingMealsRecord(
          [void Function(UpcommingMealsRecordBuilder) updates]) =
      _$UpcommingMealsRecord;

  static UpcommingMealsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUpcommingMealsRecordData({
  String? image,
  String? text,
}) {
  final firestoreData = serializers.toFirestore(
    UpcommingMealsRecord.serializer,
    UpcommingMealsRecord(
      (u) => u
        ..image = image
        ..text = text,
    ),
  );

  return firestoreData;
}
