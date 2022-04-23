import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'days_record.g.dart';

abstract class DaysRecord implements Built<DaysRecord, DaysRecordBuilder> {
  static Serializer<DaysRecord> get serializer => _$daysRecordSerializer;

  @nullable
  BuiltList<String> get day;

  @nullable
  String get type;

  @nullable
  BuiltList<String> get date;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DaysRecordBuilder builder) => builder
    ..day = ListBuilder()
    ..type = ''
    ..date = ListBuilder();

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
  String type,
}) =>
    serializers.toFirestore(
        DaysRecord.serializer,
        DaysRecord((d) => d
          ..day = null
          ..type = type
          ..date = null));
