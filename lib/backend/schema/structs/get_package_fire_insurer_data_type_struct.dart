// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetPackageFireInsurerDataTypeStruct extends FFFirebaseStruct {
  GetPackageFireInsurerDataTypeStruct({
    int? id,
    String? companyId,
    String? packageId,
    String? packageName,
    String? sumInsured,
    String? yearCover,
    String? fireAndExplosion,
    String? naturalDisaster,
    String? strikeAndRiot,
    String? electricalAppliance,
    String? flood,
    String? thief,
    String? buildingRepairs,
    String? lockRepairs,
    String? mirrorDamage,
    String? tppd,
    String? dieFire,
    String? medicalTreat,
    String? netPremium,
    String? vat,
    String? stamp,
    String? grossTotal,
    String? effectiveDate,
    String? expiryDate,
    String? serialName,
    String? shortName,
    String? fullName,
    String? logo,
    String? productId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _companyId = companyId,
        _packageId = packageId,
        _packageName = packageName,
        _sumInsured = sumInsured,
        _yearCover = yearCover,
        _fireAndExplosion = fireAndExplosion,
        _naturalDisaster = naturalDisaster,
        _strikeAndRiot = strikeAndRiot,
        _electricalAppliance = electricalAppliance,
        _flood = flood,
        _thief = thief,
        _buildingRepairs = buildingRepairs,
        _lockRepairs = lockRepairs,
        _mirrorDamage = mirrorDamage,
        _tppd = tppd,
        _dieFire = dieFire,
        _medicalTreat = medicalTreat,
        _netPremium = netPremium,
        _vat = vat,
        _stamp = stamp,
        _grossTotal = grossTotal,
        _effectiveDate = effectiveDate,
        _expiryDate = expiryDate,
        _serialName = serialName,
        _shortName = shortName,
        _fullName = fullName,
        _logo = logo,
        _productId = productId,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "company_id" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  set companyId(String? val) => _companyId = val;

  bool hasCompanyId() => _companyId != null;

  // "package_id" field.
  String? _packageId;
  String get packageId => _packageId ?? '';
  set packageId(String? val) => _packageId = val;

  bool hasPackageId() => _packageId != null;

  // "package_name" field.
  String? _packageName;
  String get packageName => _packageName ?? '';
  set packageName(String? val) => _packageName = val;

  bool hasPackageName() => _packageName != null;

  // "sum_insured" field.
  String? _sumInsured;
  String get sumInsured => _sumInsured ?? '';
  set sumInsured(String? val) => _sumInsured = val;

  bool hasSumInsured() => _sumInsured != null;

  // "year_cover" field.
  String? _yearCover;
  String get yearCover => _yearCover ?? '';
  set yearCover(String? val) => _yearCover = val;

  bool hasYearCover() => _yearCover != null;

  // "fire_and_explosion" field.
  String? _fireAndExplosion;
  String get fireAndExplosion => _fireAndExplosion ?? '';
  set fireAndExplosion(String? val) => _fireAndExplosion = val;

  bool hasFireAndExplosion() => _fireAndExplosion != null;

  // "natural_disaster" field.
  String? _naturalDisaster;
  String get naturalDisaster => _naturalDisaster ?? '';
  set naturalDisaster(String? val) => _naturalDisaster = val;

  bool hasNaturalDisaster() => _naturalDisaster != null;

  // "strike_and_riot" field.
  String? _strikeAndRiot;
  String get strikeAndRiot => _strikeAndRiot ?? '';
  set strikeAndRiot(String? val) => _strikeAndRiot = val;

  bool hasStrikeAndRiot() => _strikeAndRiot != null;

  // "electrical_appliance" field.
  String? _electricalAppliance;
  String get electricalAppliance => _electricalAppliance ?? '';
  set electricalAppliance(String? val) => _electricalAppliance = val;

  bool hasElectricalAppliance() => _electricalAppliance != null;

  // "flood" field.
  String? _flood;
  String get flood => _flood ?? '';
  set flood(String? val) => _flood = val;

  bool hasFlood() => _flood != null;

  // "thief" field.
  String? _thief;
  String get thief => _thief ?? '';
  set thief(String? val) => _thief = val;

  bool hasThief() => _thief != null;

  // "building_repairs" field.
  String? _buildingRepairs;
  String get buildingRepairs => _buildingRepairs ?? '';
  set buildingRepairs(String? val) => _buildingRepairs = val;

  bool hasBuildingRepairs() => _buildingRepairs != null;

  // "lock_repairs" field.
  String? _lockRepairs;
  String get lockRepairs => _lockRepairs ?? '';
  set lockRepairs(String? val) => _lockRepairs = val;

  bool hasLockRepairs() => _lockRepairs != null;

  // "mirror_damage" field.
  String? _mirrorDamage;
  String get mirrorDamage => _mirrorDamage ?? '';
  set mirrorDamage(String? val) => _mirrorDamage = val;

  bool hasMirrorDamage() => _mirrorDamage != null;

  // "tppd" field.
  String? _tppd;
  String get tppd => _tppd ?? '';
  set tppd(String? val) => _tppd = val;

  bool hasTppd() => _tppd != null;

  // "die_fire" field.
  String? _dieFire;
  String get dieFire => _dieFire ?? '';
  set dieFire(String? val) => _dieFire = val;

  bool hasDieFire() => _dieFire != null;

  // "medical_treat" field.
  String? _medicalTreat;
  String get medicalTreat => _medicalTreat ?? '';
  set medicalTreat(String? val) => _medicalTreat = val;

  bool hasMedicalTreat() => _medicalTreat != null;

  // "net_premium" field.
  String? _netPremium;
  String get netPremium => _netPremium ?? '';
  set netPremium(String? val) => _netPremium = val;

  bool hasNetPremium() => _netPremium != null;

  // "vat" field.
  String? _vat;
  String get vat => _vat ?? '';
  set vat(String? val) => _vat = val;

  bool hasVat() => _vat != null;

  // "stamp" field.
  String? _stamp;
  String get stamp => _stamp ?? '';
  set stamp(String? val) => _stamp = val;

  bool hasStamp() => _stamp != null;

  // "gross_total" field.
  String? _grossTotal;
  String get grossTotal => _grossTotal ?? '';
  set grossTotal(String? val) => _grossTotal = val;

  bool hasGrossTotal() => _grossTotal != null;

  // "effective_date" field.
  String? _effectiveDate;
  String get effectiveDate => _effectiveDate ?? '';
  set effectiveDate(String? val) => _effectiveDate = val;

  bool hasEffectiveDate() => _effectiveDate != null;

  // "expiry_date" field.
  String? _expiryDate;
  String get expiryDate => _expiryDate ?? '';
  set expiryDate(String? val) => _expiryDate = val;

  bool hasExpiryDate() => _expiryDate != null;

  // "serial_name" field.
  String? _serialName;
  String get serialName => _serialName ?? '';
  set serialName(String? val) => _serialName = val;

  bool hasSerialName() => _serialName != null;

  // "short_name" field.
  String? _shortName;
  String get shortName => _shortName ?? '';
  set shortName(String? val) => _shortName = val;

  bool hasShortName() => _shortName != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  static GetPackageFireInsurerDataTypeStruct fromMap(
          Map<String, dynamic> data) =>
      GetPackageFireInsurerDataTypeStruct(
        id: castToType<int>(data['id']),
        companyId: data['company_id'] as String?,
        packageId: data['package_id'] as String?,
        packageName: data['package_name'] as String?,
        sumInsured: data['sum_insured'] as String?,
        yearCover: data['year_cover'] as String?,
        fireAndExplosion: data['fire_and_explosion'] as String?,
        naturalDisaster: data['natural_disaster'] as String?,
        strikeAndRiot: data['strike_and_riot'] as String?,
        electricalAppliance: data['electrical_appliance'] as String?,
        flood: data['flood'] as String?,
        thief: data['thief'] as String?,
        buildingRepairs: data['building_repairs'] as String?,
        lockRepairs: data['lock_repairs'] as String?,
        mirrorDamage: data['mirror_damage'] as String?,
        tppd: data['tppd'] as String?,
        dieFire: data['die_fire'] as String?,
        medicalTreat: data['medical_treat'] as String?,
        netPremium: data['net_premium'] as String?,
        vat: data['vat'] as String?,
        stamp: data['stamp'] as String?,
        grossTotal: data['gross_total'] as String?,
        effectiveDate: data['effective_date'] as String?,
        expiryDate: data['expiry_date'] as String?,
        serialName: data['serial_name'] as String?,
        shortName: data['short_name'] as String?,
        fullName: data['full_name'] as String?,
        logo: data['logo'] as String?,
        productId: data['productId'] as String?,
      );

  static GetPackageFireInsurerDataTypeStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? GetPackageFireInsurerDataTypeStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'company_id': _companyId,
        'package_id': _packageId,
        'package_name': _packageName,
        'sum_insured': _sumInsured,
        'year_cover': _yearCover,
        'fire_and_explosion': _fireAndExplosion,
        'natural_disaster': _naturalDisaster,
        'strike_and_riot': _strikeAndRiot,
        'electrical_appliance': _electricalAppliance,
        'flood': _flood,
        'thief': _thief,
        'building_repairs': _buildingRepairs,
        'lock_repairs': _lockRepairs,
        'mirror_damage': _mirrorDamage,
        'tppd': _tppd,
        'die_fire': _dieFire,
        'medical_treat': _medicalTreat,
        'net_premium': _netPremium,
        'vat': _vat,
        'stamp': _stamp,
        'gross_total': _grossTotal,
        'effective_date': _effectiveDate,
        'expiry_date': _expiryDate,
        'serial_name': _serialName,
        'short_name': _shortName,
        'full_name': _fullName,
        'logo': _logo,
        'productId': _productId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'company_id': serializeParam(
          _companyId,
          ParamType.String,
        ),
        'package_id': serializeParam(
          _packageId,
          ParamType.String,
        ),
        'package_name': serializeParam(
          _packageName,
          ParamType.String,
        ),
        'sum_insured': serializeParam(
          _sumInsured,
          ParamType.String,
        ),
        'year_cover': serializeParam(
          _yearCover,
          ParamType.String,
        ),
        'fire_and_explosion': serializeParam(
          _fireAndExplosion,
          ParamType.String,
        ),
        'natural_disaster': serializeParam(
          _naturalDisaster,
          ParamType.String,
        ),
        'strike_and_riot': serializeParam(
          _strikeAndRiot,
          ParamType.String,
        ),
        'electrical_appliance': serializeParam(
          _electricalAppliance,
          ParamType.String,
        ),
        'flood': serializeParam(
          _flood,
          ParamType.String,
        ),
        'thief': serializeParam(
          _thief,
          ParamType.String,
        ),
        'building_repairs': serializeParam(
          _buildingRepairs,
          ParamType.String,
        ),
        'lock_repairs': serializeParam(
          _lockRepairs,
          ParamType.String,
        ),
        'mirror_damage': serializeParam(
          _mirrorDamage,
          ParamType.String,
        ),
        'tppd': serializeParam(
          _tppd,
          ParamType.String,
        ),
        'die_fire': serializeParam(
          _dieFire,
          ParamType.String,
        ),
        'medical_treat': serializeParam(
          _medicalTreat,
          ParamType.String,
        ),
        'net_premium': serializeParam(
          _netPremium,
          ParamType.String,
        ),
        'vat': serializeParam(
          _vat,
          ParamType.String,
        ),
        'stamp': serializeParam(
          _stamp,
          ParamType.String,
        ),
        'gross_total': serializeParam(
          _grossTotal,
          ParamType.String,
        ),
        'effective_date': serializeParam(
          _effectiveDate,
          ParamType.String,
        ),
        'expiry_date': serializeParam(
          _expiryDate,
          ParamType.String,
        ),
        'serial_name': serializeParam(
          _serialName,
          ParamType.String,
        ),
        'short_name': serializeParam(
          _shortName,
          ParamType.String,
        ),
        'full_name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'productId': serializeParam(
          _productId,
          ParamType.String,
        ),
      }.withoutNulls;

  static GetPackageFireInsurerDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GetPackageFireInsurerDataTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        companyId: deserializeParam(
          data['company_id'],
          ParamType.String,
          false,
        ),
        packageId: deserializeParam(
          data['package_id'],
          ParamType.String,
          false,
        ),
        packageName: deserializeParam(
          data['package_name'],
          ParamType.String,
          false,
        ),
        sumInsured: deserializeParam(
          data['sum_insured'],
          ParamType.String,
          false,
        ),
        yearCover: deserializeParam(
          data['year_cover'],
          ParamType.String,
          false,
        ),
        fireAndExplosion: deserializeParam(
          data['fire_and_explosion'],
          ParamType.String,
          false,
        ),
        naturalDisaster: deserializeParam(
          data['natural_disaster'],
          ParamType.String,
          false,
        ),
        strikeAndRiot: deserializeParam(
          data['strike_and_riot'],
          ParamType.String,
          false,
        ),
        electricalAppliance: deserializeParam(
          data['electrical_appliance'],
          ParamType.String,
          false,
        ),
        flood: deserializeParam(
          data['flood'],
          ParamType.String,
          false,
        ),
        thief: deserializeParam(
          data['thief'],
          ParamType.String,
          false,
        ),
        buildingRepairs: deserializeParam(
          data['building_repairs'],
          ParamType.String,
          false,
        ),
        lockRepairs: deserializeParam(
          data['lock_repairs'],
          ParamType.String,
          false,
        ),
        mirrorDamage: deserializeParam(
          data['mirror_damage'],
          ParamType.String,
          false,
        ),
        tppd: deserializeParam(
          data['tppd'],
          ParamType.String,
          false,
        ),
        dieFire: deserializeParam(
          data['die_fire'],
          ParamType.String,
          false,
        ),
        medicalTreat: deserializeParam(
          data['medical_treat'],
          ParamType.String,
          false,
        ),
        netPremium: deserializeParam(
          data['net_premium'],
          ParamType.String,
          false,
        ),
        vat: deserializeParam(
          data['vat'],
          ParamType.String,
          false,
        ),
        stamp: deserializeParam(
          data['stamp'],
          ParamType.String,
          false,
        ),
        grossTotal: deserializeParam(
          data['gross_total'],
          ParamType.String,
          false,
        ),
        effectiveDate: deserializeParam(
          data['effective_date'],
          ParamType.String,
          false,
        ),
        expiryDate: deserializeParam(
          data['expiry_date'],
          ParamType.String,
          false,
        ),
        serialName: deserializeParam(
          data['serial_name'],
          ParamType.String,
          false,
        ),
        shortName: deserializeParam(
          data['short_name'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['productId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GetPackageFireInsurerDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GetPackageFireInsurerDataTypeStruct &&
        id == other.id &&
        companyId == other.companyId &&
        packageId == other.packageId &&
        packageName == other.packageName &&
        sumInsured == other.sumInsured &&
        yearCover == other.yearCover &&
        fireAndExplosion == other.fireAndExplosion &&
        naturalDisaster == other.naturalDisaster &&
        strikeAndRiot == other.strikeAndRiot &&
        electricalAppliance == other.electricalAppliance &&
        flood == other.flood &&
        thief == other.thief &&
        buildingRepairs == other.buildingRepairs &&
        lockRepairs == other.lockRepairs &&
        mirrorDamage == other.mirrorDamage &&
        tppd == other.tppd &&
        dieFire == other.dieFire &&
        medicalTreat == other.medicalTreat &&
        netPremium == other.netPremium &&
        vat == other.vat &&
        stamp == other.stamp &&
        grossTotal == other.grossTotal &&
        effectiveDate == other.effectiveDate &&
        expiryDate == other.expiryDate &&
        serialName == other.serialName &&
        shortName == other.shortName &&
        fullName == other.fullName &&
        logo == other.logo &&
        productId == other.productId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        companyId,
        packageId,
        packageName,
        sumInsured,
        yearCover,
        fireAndExplosion,
        naturalDisaster,
        strikeAndRiot,
        electricalAppliance,
        flood,
        thief,
        buildingRepairs,
        lockRepairs,
        mirrorDamage,
        tppd,
        dieFire,
        medicalTreat,
        netPremium,
        vat,
        stamp,
        grossTotal,
        effectiveDate,
        expiryDate,
        serialName,
        shortName,
        fullName,
        logo,
        productId
      ]);
}

GetPackageFireInsurerDataTypeStruct createGetPackageFireInsurerDataTypeStruct({
  int? id,
  String? companyId,
  String? packageId,
  String? packageName,
  String? sumInsured,
  String? yearCover,
  String? fireAndExplosion,
  String? naturalDisaster,
  String? strikeAndRiot,
  String? electricalAppliance,
  String? flood,
  String? thief,
  String? buildingRepairs,
  String? lockRepairs,
  String? mirrorDamage,
  String? tppd,
  String? dieFire,
  String? medicalTreat,
  String? netPremium,
  String? vat,
  String? stamp,
  String? grossTotal,
  String? effectiveDate,
  String? expiryDate,
  String? serialName,
  String? shortName,
  String? fullName,
  String? logo,
  String? productId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GetPackageFireInsurerDataTypeStruct(
      id: id,
      companyId: companyId,
      packageId: packageId,
      packageName: packageName,
      sumInsured: sumInsured,
      yearCover: yearCover,
      fireAndExplosion: fireAndExplosion,
      naturalDisaster: naturalDisaster,
      strikeAndRiot: strikeAndRiot,
      electricalAppliance: electricalAppliance,
      flood: flood,
      thief: thief,
      buildingRepairs: buildingRepairs,
      lockRepairs: lockRepairs,
      mirrorDamage: mirrorDamage,
      tppd: tppd,
      dieFire: dieFire,
      medicalTreat: medicalTreat,
      netPremium: netPremium,
      vat: vat,
      stamp: stamp,
      grossTotal: grossTotal,
      effectiveDate: effectiveDate,
      expiryDate: expiryDate,
      serialName: serialName,
      shortName: shortName,
      fullName: fullName,
      logo: logo,
      productId: productId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GetPackageFireInsurerDataTypeStruct? updateGetPackageFireInsurerDataTypeStruct(
  GetPackageFireInsurerDataTypeStruct? getPackageFireInsurerDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    getPackageFireInsurerDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGetPackageFireInsurerDataTypeStructData(
  Map<String, dynamic> firestoreData,
  GetPackageFireInsurerDataTypeStruct? getPackageFireInsurerDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (getPackageFireInsurerDataType == null) {
    return;
  }
  if (getPackageFireInsurerDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      getPackageFireInsurerDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final getPackageFireInsurerDataTypeData =
      getGetPackageFireInsurerDataTypeFirestoreData(
          getPackageFireInsurerDataType, forFieldValue);
  final nestedData = getPackageFireInsurerDataTypeData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      getPackageFireInsurerDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGetPackageFireInsurerDataTypeFirestoreData(
  GetPackageFireInsurerDataTypeStruct? getPackageFireInsurerDataType, [
  bool forFieldValue = false,
]) {
  if (getPackageFireInsurerDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(getPackageFireInsurerDataType.toMap());

  // Add any Firestore field values
  getPackageFireInsurerDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGetPackageFireInsurerDataTypeListFirestoreData(
  List<GetPackageFireInsurerDataTypeStruct>? getPackageFireInsurerDataTypes,
) =>
    getPackageFireInsurerDataTypes
        ?.map((e) => getGetPackageFireInsurerDataTypeFirestoreData(e, true))
        .toList() ??
    [];
