import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'upcommingmeals_record.g.dart';

abstract class UpcommingmealsRecord
    implements Built<UpcommingmealsRecord, UpcommingmealsRecordBuilder> {
  static Serializer<UpcommingmealsRecord> get serializer =>
      _$upcommingmealsRecordSerializer;

  String? get name;

  String? get image;

  int? get sequence;

  String? get uid;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UpcommingmealsRecordBuilder builder) => builder
    ..name = ''
    ..image = ''
    ..sequence = 0
    ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('upcommingmeals');

  static Stream<UpcommingmealsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UpcommingmealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UpcommingmealsRecord._();
  factory UpcommingmealsRecord(
          [void Function(UpcommingmealsRecordBuilder) updates]) =
      _$UpcommingmealsRecord;

  static UpcommingmealsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUpcommingmealsRecordData({
  String? name,
  String? image,
  int? sequence,
  String? uid,
}) {
  final firestoreData = serializers.toFirestore(
    UpcommingmealsRecord.serializer,
    UpcommingmealsRecord(
      (u) => u
        ..name = name
        ..image = image
        ..sequence = sequence
        ..uid = uid,
    ),
  );

  return firestoreData;
}
