import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'timestamp_record.g.dart';

abstract class TimestampRecord
    implements Built<TimestampRecord, TimestampRecordBuilder> {
  static Serializer<TimestampRecord> get serializer =>
      _$timestampRecordSerializer;

  DateTime? get lastAudit;

  DateTime? get lastBuy;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TimestampRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('timestamp');

  static Stream<TimestampRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TimestampRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TimestampRecord._();
  factory TimestampRecord([void Function(TimestampRecordBuilder) updates]) =
      _$TimestampRecord;

  static TimestampRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTimestampRecordData({
  DateTime? lastAudit,
  DateTime? lastBuy,
}) {
  final firestoreData = serializers.toFirestore(
    TimestampRecord.serializer,
    TimestampRecord(
      (t) => t
        ..lastAudit = lastAudit
        ..lastBuy = lastBuy,
    ),
  );

  return firestoreData;
}
