import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'ingred_buy_notifier_record.g.dart';

abstract class IngredBuyNotifierRecord
    implements Built<IngredBuyNotifierRecord, IngredBuyNotifierRecordBuilder> {
  static Serializer<IngredBuyNotifierRecord> get serializer =>
      _$ingredBuyNotifierRecordSerializer;

  String? get uid;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(IngredBuyNotifierRecordBuilder builder) =>
      builder..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ingredBuyNotifier');

  static Stream<IngredBuyNotifierRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<IngredBuyNotifierRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  IngredBuyNotifierRecord._();
  factory IngredBuyNotifierRecord(
          [void Function(IngredBuyNotifierRecordBuilder) updates]) =
      _$IngredBuyNotifierRecord;

  static IngredBuyNotifierRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createIngredBuyNotifierRecordData({
  String? uid,
}) {
  final firestoreData = serializers.toFirestore(
    IngredBuyNotifierRecord.serializer,
    IngredBuyNotifierRecord(
      (i) => i..uid = uid,
    ),
  );

  return firestoreData;
}
