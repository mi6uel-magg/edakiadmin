import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'citas_record.g.dart';

abstract class CitasRecord implements Built<CitasRecord, CitasRecordBuilder> {
  static Serializer<CitasRecord> get serializer => _$citasRecordSerializer;

  DateTime? get fecha;

  String? get hora;

  String? get nombre;

  String? get servicio;

  String? get dueno;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CitasRecordBuilder builder) => builder
    ..hora = ''
    ..nombre = ''
    ..servicio = ''
    ..dueno = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('citas')
          : FirebaseFirestore.instance.collectionGroup('citas');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('citas').doc();

  static Stream<CitasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CitasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CitasRecord._();
  factory CitasRecord([void Function(CitasRecordBuilder) updates]) =
      _$CitasRecord;

  static CitasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCitasRecordData({
  DateTime? fecha,
  String? hora,
  String? nombre,
  String? servicio,
  String? dueno,
}) {
  final firestoreData = serializers.toFirestore(
    CitasRecord.serializer,
    CitasRecord(
      (c) => c
        ..fecha = fecha
        ..hora = hora
        ..nombre = nombre
        ..servicio = servicio
        ..dueno = dueno,
    ),
  );

  return firestoreData;
}
