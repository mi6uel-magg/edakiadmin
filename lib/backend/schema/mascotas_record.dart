import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'mascotas_record.g.dart';

abstract class MascotasRecord
    implements Built<MascotasRecord, MascotasRecordBuilder> {
  static Serializer<MascotasRecord> get serializer =>
      _$mascotasRecordSerializer;

  String? get nombre;

  String? get color;

  String? get sexo;

  String? get nacimento;

  String? get raza;

  String? get especie;

  String? get foto;

  String? get dueno;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(MascotasRecordBuilder builder) => builder
    ..nombre = ''
    ..color = ''
    ..sexo = ''
    ..nacimento = ''
    ..raza = ''
    ..especie = ''
    ..foto = ''
    ..dueno = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('mascotas')
          : FirebaseFirestore.instance.collectionGroup('mascotas');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('mascotas').doc();

  static Stream<MascotasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MascotasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MascotasRecord._();
  factory MascotasRecord([void Function(MascotasRecordBuilder) updates]) =
      _$MascotasRecord;

  static MascotasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMascotasRecordData({
  String? nombre,
  String? color,
  String? sexo,
  String? nacimento,
  String? raza,
  String? especie,
  String? foto,
  String? dueno,
}) {
  final firestoreData = serializers.toFirestore(
    MascotasRecord.serializer,
    MascotasRecord(
      (m) => m
        ..nombre = nombre
        ..color = color
        ..sexo = sexo
        ..nacimento = nacimento
        ..raza = raza
        ..especie = especie
        ..foto = foto
        ..dueno = dueno,
    ),
  );

  return firestoreData;
}
