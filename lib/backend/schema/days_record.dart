import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'days_record.g.dart';

abstract class DaysRecord implements Built<DaysRecord, DaysRecordBuilder> {
  static Serializer<DaysRecord> get serializer => _$daysRecordSerializer;

  @nullable
  String get date;

  @nullable
  BuiltList<String> get day;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DaysRecordBuilder builder) => builder
    ..date = ''
    ..day = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('days');

  static Stream<DaysRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DaysRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DaysRecord._();
  factory DaysRecord([void Function(DaysRecordBuilder) updates]) = _$DaysRecord;

  static DaysRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDaysRecordData({
  String date,
}) =>
    serializers.toFirestore(
        DaysRecord.serializer,
        DaysRecord((d) => d
          ..date = date
          ..day = null));
