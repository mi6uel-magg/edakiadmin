// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mascotas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MascotasRecord> _$mascotasRecordSerializer =
    new _$MascotasRecordSerializer();

class _$MascotasRecordSerializer
    implements StructuredSerializer<MascotasRecord> {
  @override
  final Iterable<Type> types = const [MascotasRecord, _$MascotasRecord];
  @override
  final String wireName = 'MascotasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MascotasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nombre;
    if (value != null) {
      result
        ..add('nombre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sexo;
    if (value != null) {
      result
        ..add('sexo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nacimento;
    if (value != null) {
      result
        ..add('nacimento')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.raza;
    if (value != null) {
      result
        ..add('raza')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.especie;
    if (value != null) {
      result
        ..add('especie')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foto;
    if (value != null) {
      result
        ..add('foto')
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
  MascotasRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MascotasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nombre':
          result.nombre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sexo':
          result.sexo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nacimento':
          result.nacimento = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'raza':
          result.raza = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'especie':
          result.especie = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'foto':
          result.foto = serializers.deserialize(value,
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

class _$MascotasRecord extends MascotasRecord {
  @override
  final String? nombre;
  @override
  final String? color;
  @override
  final String? sexo;
  @override
  final String? nacimento;
  @override
  final String? raza;
  @override
  final String? especie;
  @override
  final String? foto;
  @override
  final String? dueno;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MascotasRecord([void Function(MascotasRecordBuilder)? updates]) =>
      (new MascotasRecordBuilder()..update(updates))._build();

  _$MascotasRecord._(
      {this.nombre,
      this.color,
      this.sexo,
      this.nacimento,
      this.raza,
      this.especie,
      this.foto,
      this.dueno,
      this.ffRef})
      : super._();

  @override
  MascotasRecord rebuild(void Function(MascotasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MascotasRecordBuilder toBuilder() =>
      new MascotasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MascotasRecord &&
        nombre == other.nombre &&
        color == other.color &&
        sexo == other.sexo &&
        nacimento == other.nacimento &&
        raza == other.raza &&
        especie == other.especie &&
        foto == other.foto &&
        dueno == other.dueno &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, nombre.hashCode), color.hashCode),
                                sexo.hashCode),
                            nacimento.hashCode),
                        raza.hashCode),
                    especie.hashCode),
                foto.hashCode),
            dueno.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MascotasRecord')
          ..add('nombre', nombre)
          ..add('color', color)
          ..add('sexo', sexo)
          ..add('nacimento', nacimento)
          ..add('raza', raza)
          ..add('especie', especie)
          ..add('foto', foto)
          ..add('dueno', dueno)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MascotasRecordBuilder
    implements Builder<MascotasRecord, MascotasRecordBuilder> {
  _$MascotasRecord? _$v;

  String? _nombre;
  String? get nombre => _$this._nombre;
  set nombre(String? nombre) => _$this._nombre = nombre;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  String? _sexo;
  String? get sexo => _$this._sexo;
  set sexo(String? sexo) => _$this._sexo = sexo;

  String? _nacimento;
  String? get nacimento => _$this._nacimento;
  set nacimento(String? nacimento) => _$this._nacimento = nacimento;

  String? _raza;
  String? get raza => _$this._raza;
  set raza(String? raza) => _$this._raza = raza;

  String? _especie;
  String? get especie => _$this._especie;
  set especie(String? especie) => _$this._especie = especie;

  String? _foto;
  String? get foto => _$this._foto;
  set foto(String? foto) => _$this._foto = foto;

  String? _dueno;
  String? get dueno => _$this._dueno;
  set dueno(String? dueno) => _$this._dueno = dueno;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MascotasRecordBuilder() {
    MascotasRecord._initializeBuilder(this);
  }

  MascotasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nombre = $v.nombre;
      _color = $v.color;
      _sexo = $v.sexo;
      _nacimento = $v.nacimento;
      _raza = $v.raza;
      _especie = $v.especie;
      _foto = $v.foto;
      _dueno = $v.dueno;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MascotasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MascotasRecord;
  }

  @override
  void update(void Function(MascotasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MascotasRecord build() => _build();

  _$MascotasRecord _build() {
    final _$result = _$v ??
        new _$MascotasRecord._(
            nombre: nombre,
            color: color,
            sexo: sexo,
            nacimento: nacimento,
            raza: raza,
            especie: especie,
            foto: foto,
            dueno: dueno,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
