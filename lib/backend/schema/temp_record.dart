import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'temp_record.g.dart';

abstract class TempRecord implements Built<TempRecord, TempRecordBuilder> {
  static Serializer<TempRecord> get serializer => _$tempRecordSerializer;

  @nullable
  String get chd;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TempRecordBuilder builder) =>
      builder..chd = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('temp');

  static Stream<TempRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TempRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TempRecord._();
  factory TempRecord([void Function(TempRecordBuilder) updates]) = _$TempRecord;

  static TempRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTempRecordData({
  String chd,
}) =>
    serializers.toFirestore(
        TempRecord.serializer, TempRecord((t) => t..chd = chd));
