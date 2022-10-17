import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'banner_record.g.dart';

abstract class BannerRecord
    implements Built<BannerRecord, BannerRecordBuilder> {
  static Serializer<BannerRecord> get serializer => _$bannerRecordSerializer;

  String? get image;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BannerRecordBuilder builder) =>
      builder..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banner');

  static Stream<BannerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BannerRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BannerRecord._();
  factory BannerRecord([void Function(BannerRecordBuilder) updates]) =
      _$BannerRecord;

  static BannerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBannerRecordData({
  String? image,
}) {
  final firestoreData = serializers.toFirestore(
    BannerRecord.serializer,
    BannerRecord(
      (b) => b..image = image,
    ),
  );

  return firestoreData;
}
