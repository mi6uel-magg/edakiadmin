// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archivo_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArchivoRecord> _$archivoRecordSerializer =
    new _$ArchivoRecordSerializer();

class _$ArchivoRecordSerializer implements StructuredSerializer<ArchivoRecord> {
  @override
  final Iterable<Type> types = const [ArchivoRecord, _$ArchivoRecord];
  @override
  final String wireName = 'ArchivoRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ArchivoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.hora;
    if (value != null) {
      result
        ..add('hora')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fecha;
    if (value != null) {
      result
        ..add('fecha')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.nombre;
    if (value != null) {
      result
        ..add('nombre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.servicio;
    if (value != null) {
      result
        ..add('servicio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dueno;
    if (value != null) {
      result
        ..add('dueno')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ArchivoRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArchivoRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hora':
          result.hora = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fecha':
          result.fecha = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'nombre':
          result.nombre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'servicio':
          result.servicio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dueno':
          result.dueno = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ArchivoRecord extends ArchivoRecord {
  @override
  final String? hora;
  @override
  final DateTime? fecha;
  @override
  final String? nombre;
  @override
  final String? servicio;
  @override
  final String? dueno;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ArchivoRecord([void Function(ArchivoRecordBuilder)? updates]) =>
      (new ArchivoRecordBuilder()..update(updates))._build();

  _$ArchivoRecord._(
      {this.hora,
      this.fecha,
      this.nombre,
      this.servicio,
      this.dueno,
      this.ffRef})
      : super._();

  @override
  ArchivoRecord rebuild(void Function(ArchivoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArchivoRecordBuilder toBuilder() => new ArchivoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArchivoRecord &&
        hora == other.hora &&
        fecha == other.fecha &&
        nombre == other.nombre &&
        servicio == other.servicio &&
        dueno == other.dueno &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, hora.hashCode), fecha.hashCode),
                    nombre.hashCode),
                servicio.hashCode),
            dueno.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ArchivoRecord')
          ..add('hora', hora)
          ..add('fecha', fecha)
          ..add('nombre', nombre)
          ..add('servicio', servicio)
          ..add('dueno', dueno)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ArchivoRecordBuilder
    implements Builder<ArchivoRecord, ArchivoRecordBuilder> {
  _$ArchivoRecord? _$v;

  String? _hora;
  String? get hora => _$this._hora;
  set hora(String? hora) => _$this._hora = hora;

  DateTime? _fecha;
  DateTime? get fecha => _$this._fecha;
  set fecha(DateTime? fecha) => _$this._fecha = fecha;

  String? _nombre;
  String? get nombre => _$this._nombre;
  set nombre(String? nombre) => _$this._nombre = nombre;

  String? _servicio;
  String? get servicio => _$this._servicio;
  set servicio(String? servicio) => _$this._servicio = servicio;

  String? _dueno;
  String? get dueno => _$this._dueno;
  set dueno(String? dueno) => _$this._dueno = dueno;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ArchivoRecordBuilder() {
    ArchivoRecord._initializeBuilder(this);
  }

  ArchivoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hora = $v.hora;
      _fecha = $v.fecha;
      _nombre = $v.nombre;
      _servicio = $v.servicio;
      _dueno = $v.dueno;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArchivoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ArchivoRecord;
  }

  @override
  void update(void Function(ArchivoRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ArchivoRecord build() => _build();

  _$ArchivoRecord _build() {
    final _$result = _$v ??
        new _$ArchivoRecord._(
            hora: hora,
            fecha: fecha,
            nombre: nombre,
            servicio: servicio,
            dueno: dueno,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
