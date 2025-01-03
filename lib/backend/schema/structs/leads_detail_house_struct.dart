// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadsDetailHouseStruct extends FFFirebaseStruct {
  LeadsDetailHouseStruct({
    int? dtlId,
    int? leadId,
    String? leadStatus,
    String? insurerId,
    String? insurerCode,
    String? insurerShortName,
    String? insurerName,
    String? productId,
    String? packageId,
    String? packageName,
    String? sumInsured,
    String? netPremiumTotal,
    String? discountOther,
    String? netPremium,
    String? stamp,
    String? vat,
    String? vatAmount,
    String? grossTotal,
    String? grossTotalNet,
    String? effectiveDate,
    String? expiryDate,
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
    String? imageIdcard,
    String? imageHouse,
    String? pdfQuotation,
    String? deleted,
    String? createdUserid,
    String? createdAt,
    String? updatedUserid,
    String? updatedAt,
    String? insurerLogo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dtlId = dtlId,
        _leadId = leadId,
        _leadStatus = leadStatus,
        _insurerId = insurerId,
        _insurerCode = insurerCode,
        _insurerShortName = insurerShortName,
        _insurerName = insurerName,
        _productId = productId,
        _packageId = packageId,
        _packageName = packageName,
        _sumInsured = sumInsured,
        _netPremiumTotal = netPremiumTotal,
        _discountOther = discountOther,
        _netPremium = netPremium,
        _stamp = stamp,
        _vat = vat,
        _vatAmount = vatAmount,
        _grossTotal = grossTotal,
        _grossTotalNet = grossTotalNet,
        _effectiveDate = effectiveDate,
        _expiryDate = expiryDate,
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
        _imageIdcard = imageIdcard,
        _imageHouse = imageHouse,
        _pdfQuotation = pdfQuotation,
        _deleted = deleted,
        _createdUserid = createdUserid,
        _createdAt = createdAt,
        _updatedUserid = updatedUserid,
        _updatedAt = updatedAt,
        _insurerLogo = insurerLogo,
        super(firestoreUtilData);

  // "dtl_id" field.
  int? _dtlId;
  int get dtlId => _dtlId ?? 0;
  set dtlId(int? val) => _dtlId = val;

  void incrementDtlId(int amount) => dtlId = dtlId + amount;

  bool hasDtlId() => _dtlId != null;

  // "lead_id" field.
  int? _leadId;
  int get leadId => _leadId ?? 0;
  set leadId(int? val) => _leadId = val;

  void incrementLeadId(int amount) => leadId = leadId + amount;

  bool hasLeadId() => _leadId != null;

  // "lead_status" field.
  String? _leadStatus;
  String get leadStatus => _leadStatus ?? '';
  set leadStatus(String? val) => _leadStatus = val;

  bool hasLeadStatus() => _leadStatus != null;

  // "insurer_id" field.
  String? _insurerId;
  String get insurerId => _insurerId ?? '';
  set insurerId(String? val) => _insurerId = val;

  bool hasInsurerId() => _insurerId != null;

  // "insurer_code" field.
  String? _insurerCode;
  String get insurerCode => _insurerCode ?? '';
  set insurerCode(String? val) => _insurerCode = val;

  bool hasInsurerCode() => _insurerCode != null;

  // "insurer_short_name" field.
  String? _insurerShortName;
  String get insurerShortName => _insurerShortName ?? '';
  set insurerShortName(String? val) => _insurerShortName = val;

  bool hasInsurerShortName() => _insurerShortName != null;

  // "insurer_name" field.
  String? _insurerName;
  String get insurerName => _insurerName ?? '';
  set insurerName(String? val) => _insurerName = val;

  bool hasInsurerName() => _insurerName != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

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

  // "net_premium_total" field.
  String? _netPremiumTotal;
  String get netPremiumTotal => _netPremiumTotal ?? '';
  set netPremiumTotal(String? val) => _netPremiumTotal = val;

  bool hasNetPremiumTotal() => _netPremiumTotal != null;

  // "discount_other" field.
  String? _discountOther;
  String get discountOther => _discountOther ?? '';
  set discountOther(String? val) => _discountOther = val;

  bool hasDiscountOther() => _discountOther != null;

  // "net_premium" field.
  String? _netPremium;
  String get netPremium => _netPremium ?? '';
  set netPremium(String? val) => _netPremium = val;

  bool hasNetPremium() => _netPremium != null;

  // "stamp" field.
  String? _stamp;
  String get stamp => _stamp ?? '';
  set stamp(String? val) => _stamp = val;

  bool hasStamp() => _stamp != null;

  // "vat" field.
  String? _vat;
  String get vat => _vat ?? '';
  set vat(String? val) => _vat = val;

  bool hasVat() => _vat != null;

  // "vat_amount" field.
  String? _vatAmount;
  String get vatAmount => _vatAmount ?? '';
  set vatAmount(String? val) => _vatAmount = val;

  bool hasVatAmount() => _vatAmount != null;

  // "gross_total" field.
  String? _grossTotal;
  String get grossTotal => _grossTotal ?? '';
  set grossTotal(String? val) => _grossTotal = val;

  bool hasGrossTotal() => _grossTotal != null;

  // "gross_total_net" field.
  String? _grossTotalNet;
  String get grossTotalNet => _grossTotalNet ?? '';
  set grossTotalNet(String? val) => _grossTotalNet = val;

  bool hasGrossTotalNet() => _grossTotalNet != null;

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

  // "image_idcard" field.
  String? _imageIdcard;
  String get imageIdcard => _imageIdcard ?? '';
  set imageIdcard(String? val) => _imageIdcard = val;

  bool hasImageIdcard() => _imageIdcard != null;

  // "image_house" field.
  String? _imageHouse;
  String get imageHouse => _imageHouse ?? '';
  set imageHouse(String? val) => _imageHouse = val;

  bool hasImageHouse() => _imageHouse != null;

  // "pdf_quotation" field.
  String? _pdfQuotation;
  String get pdfQuotation => _pdfQuotation ?? '';
  set pdfQuotation(String? val) => _pdfQuotation = val;

  bool hasPdfQuotation() => _pdfQuotation != null;

  // "deleted" field.
  String? _deleted;
  String get deleted => _deleted ?? '';
  set deleted(String? val) => _deleted = val;

  bool hasDeleted() => _deleted != null;

  // "created_userid" field.
  String? _createdUserid;
  String get createdUserid => _createdUserid ?? '';
  set createdUserid(String? val) => _createdUserid = val;

  bool hasCreatedUserid() => _createdUserid != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_userid" field.
  String? _updatedUserid;
  String get updatedUserid => _updatedUserid ?? '';
  set updatedUserid(String? val) => _updatedUserid = val;

  bool hasUpdatedUserid() => _updatedUserid != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "insurer_logo" field.
  String? _insurerLogo;
  String get insurerLogo => _insurerLogo ?? '';
  set insurerLogo(String? val) => _insurerLogo = val;

  bool hasInsurerLogo() => _insurerLogo != null;

  static LeadsDetailHouseStruct fromMap(Map<String, dynamic> data) =>
      LeadsDetailHouseStruct(
        dtlId: castToType<int>(data['dtl_id']),
        leadId: castToType<int>(data['lead_id']),
        leadStatus: data['lead_status'] as String?,
        insurerId: data['insurer_id'] as String?,
        insurerCode: data['insurer_code'] as String?,
        insurerShortName: data['insurer_short_name'] as String?,
        insurerName: data['insurer_name'] as String?,
        productId: data['product_id'] as String?,
        packageId: data['package_id'] as String?,
        packageName: data['package_name'] as String?,
        sumInsured: data['sum_insured'] as String?,
        netPremiumTotal: data['net_premium_total'] as String?,
        discountOther: data['discount_other'] as String?,
        netPremium: data['net_premium'] as String?,
        stamp: data['stamp'] as String?,
        vat: data['vat'] as String?,
        vatAmount: data['vat_amount'] as String?,
        grossTotal: data['gross_total'] as String?,
        grossTotalNet: data['gross_total_net'] as String?,
        effectiveDate: data['effective_date'] as String?,
        expiryDate: data['expiry_date'] as String?,
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
        imageIdcard: data['image_idcard'] as String?,
        imageHouse: data['image_house'] as String?,
        pdfQuotation: data['pdf_quotation'] as String?,
        deleted: data['deleted'] as String?,
        createdUserid: data['created_userid'] as String?,
        createdAt: data['created_at'] as String?,
        updatedUserid: data['updated_userid'] as String?,
        updatedAt: data['updated_at'] as String?,
        insurerLogo: data['insurer_logo'] as String?,
      );

  static LeadsDetailHouseStruct? maybeFromMap(dynamic data) => data is Map
      ? LeadsDetailHouseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dtl_id': _dtlId,
        'lead_id': _leadId,
        'lead_status': _leadStatus,
        'insurer_id': _insurerId,
        'insurer_code': _insurerCode,
        'insurer_short_name': _insurerShortName,
        'insurer_name': _insurerName,
        'product_id': _productId,
        'package_id': _packageId,
        'package_name': _packageName,
        'sum_insured': _sumInsured,
        'net_premium_total': _netPremiumTotal,
        'discount_other': _discountOther,
        'net_premium': _netPremium,
        'stamp': _stamp,
        'vat': _vat,
        'vat_amount': _vatAmount,
        'gross_total': _grossTotal,
        'gross_total_net': _grossTotalNet,
        'effective_date': _effectiveDate,
        'expiry_date': _expiryDate,
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
        'image_idcard': _imageIdcard,
        'image_house': _imageHouse,
        'pdf_quotation': _pdfQuotation,
        'deleted': _deleted,
        'created_userid': _createdUserid,
        'created_at': _createdAt,
        'updated_userid': _updatedUserid,
        'updated_at': _updatedAt,
        'insurer_logo': _insurerLogo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dtl_id': serializeParam(
          _dtlId,
          ParamType.int,
        ),
        'lead_id': serializeParam(
          _leadId,
          ParamType.int,
        ),
        'lead_status': serializeParam(
          _leadStatus,
          ParamType.String,
        ),
        'insurer_id': serializeParam(
          _insurerId,
          ParamType.String,
        ),
        'insurer_code': serializeParam(
          _insurerCode,
          ParamType.String,
        ),
        'insurer_short_name': serializeParam(
          _insurerShortName,
          ParamType.String,
        ),
        'insurer_name': serializeParam(
          _insurerName,
          ParamType.String,
        ),
        'product_id': serializeParam(
          _productId,
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
        'net_premium_total': serializeParam(
          _netPremiumTotal,
          ParamType.String,
        ),
        'discount_other': serializeParam(
          _discountOther,
          ParamType.String,
        ),
        'net_premium': serializeParam(
          _netPremium,
          ParamType.String,
        ),
        'stamp': serializeParam(
          _stamp,
          ParamType.String,
        ),
        'vat': serializeParam(
          _vat,
          ParamType.String,
        ),
        'vat_amount': serializeParam(
          _vatAmount,
          ParamType.String,
        ),
        'gross_total': serializeParam(
          _grossTotal,
          ParamType.String,
        ),
        'gross_total_net': serializeParam(
          _grossTotalNet,
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
        'image_idcard': serializeParam(
          _imageIdcard,
          ParamType.String,
        ),
        'image_house': serializeParam(
          _imageHouse,
          ParamType.String,
        ),
        'pdf_quotation': serializeParam(
          _pdfQuotation,
          ParamType.String,
        ),
        'deleted': serializeParam(
          _deleted,
          ParamType.String,
        ),
        'created_userid': serializeParam(
          _createdUserid,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_userid': serializeParam(
          _updatedUserid,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'insurer_logo': serializeParam(
          _insurerLogo,
          ParamType.String,
        ),
      }.withoutNulls;

  static LeadsDetailHouseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LeadsDetailHouseStruct(
        dtlId: deserializeParam(
          data['dtl_id'],
          ParamType.int,
          false,
        ),
        leadId: deserializeParam(
          data['lead_id'],
          ParamType.int,
          false,
        ),
        leadStatus: deserializeParam(
          data['lead_status'],
          ParamType.String,
          false,
        ),
        insurerId: deserializeParam(
          data['insurer_id'],
          ParamType.String,
          false,
        ),
        insurerCode: deserializeParam(
          data['insurer_code'],
          ParamType.String,
          false,
        ),
        insurerShortName: deserializeParam(
          data['insurer_short_name'],
          ParamType.String,
          false,
        ),
        insurerName: deserializeParam(
          data['insurer_name'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['product_id'],
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
        netPremiumTotal: deserializeParam(
          data['net_premium_total'],
          ParamType.String,
          false,
        ),
        discountOther: deserializeParam(
          data['discount_other'],
          ParamType.String,
          false,
        ),
        netPremium: deserializeParam(
          data['net_premium'],
          ParamType.String,
          false,
        ),
        stamp: deserializeParam(
          data['stamp'],
          ParamType.String,
          false,
        ),
        vat: deserializeParam(
          data['vat'],
          ParamType.String,
          false,
        ),
        vatAmount: deserializeParam(
          data['vat_amount'],
          ParamType.String,
          false,
        ),
        grossTotal: deserializeParam(
          data['gross_total'],
          ParamType.String,
          false,
        ),
        grossTotalNet: deserializeParam(
          data['gross_total_net'],
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
        imageIdcard: deserializeParam(
          data['image_idcard'],
          ParamType.String,
          false,
        ),
        imageHouse: deserializeParam(
          data['image_house'],
          ParamType.String,
          false,
        ),
        pdfQuotation: deserializeParam(
          data['pdf_quotation'],
          ParamType.String,
          false,
        ),
        deleted: deserializeParam(
          data['deleted'],
          ParamType.String,
          false,
        ),
        createdUserid: deserializeParam(
          data['created_userid'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedUserid: deserializeParam(
          data['updated_userid'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        insurerLogo: deserializeParam(
          data['insurer_logo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LeadsDetailHouseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeadsDetailHouseStruct &&
        dtlId == other.dtlId &&
        leadId == other.leadId &&
        leadStatus == other.leadStatus &&
        insurerId == other.insurerId &&
        insurerCode == other.insurerCode &&
        insurerShortName == other.insurerShortName &&
        insurerName == other.insurerName &&
        productId == other.productId &&
        packageId == other.packageId &&
        packageName == other.packageName &&
        sumInsured == other.sumInsured &&
        netPremiumTotal == other.netPremiumTotal &&
        discountOther == other.discountOther &&
        netPremium == other.netPremium &&
        stamp == other.stamp &&
        vat == other.vat &&
        vatAmount == other.vatAmount &&
        grossTotal == other.grossTotal &&
        grossTotalNet == other.grossTotalNet &&
        effectiveDate == other.effectiveDate &&
        expiryDate == other.expiryDate &&
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
        imageIdcard == other.imageIdcard &&
        imageHouse == other.imageHouse &&
        pdfQuotation == other.pdfQuotation &&
        deleted == other.deleted &&
        createdUserid == other.createdUserid &&
        createdAt == other.createdAt &&
        updatedUserid == other.updatedUserid &&
        updatedAt == other.updatedAt &&
        insurerLogo == other.insurerLogo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        dtlId,
        leadId,
        leadStatus,
        insurerId,
        insurerCode,
        insurerShortName,
        insurerName,
        productId,
        packageId,
        packageName,
        sumInsured,
        netPremiumTotal,
        discountOther,
        netPremium,
        stamp,
        vat,
        vatAmount,
        grossTotal,
        grossTotalNet,
        effectiveDate,
        expiryDate,
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
        imageIdcard,
        imageHouse,
        pdfQuotation,
        deleted,
        createdUserid,
        createdAt,
        updatedUserid,
        updatedAt,
        insurerLogo
      ]);
}

LeadsDetailHouseStruct createLeadsDetailHouseStruct({
  int? dtlId,
  int? leadId,
  String? leadStatus,
  String? insurerId,
  String? insurerCode,
  String? insurerShortName,
  String? insurerName,
  String? productId,
  String? packageId,
  String? packageName,
  String? sumInsured,
  String? netPremiumTotal,
  String? discountOther,
  String? netPremium,
  String? stamp,
  String? vat,
  String? vatAmount,
  String? grossTotal,
  String? grossTotalNet,
  String? effectiveDate,
  String? expiryDate,
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
  String? imageIdcard,
  String? imageHouse,
  String? pdfQuotation,
  String? deleted,
  String? createdUserid,
  String? createdAt,
  String? updatedUserid,
  String? updatedAt,
  String? insurerLogo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadsDetailHouseStruct(
      dtlId: dtlId,
      leadId: leadId,
      leadStatus: leadStatus,
      insurerId: insurerId,
      insurerCode: insurerCode,
      insurerShortName: insurerShortName,
      insurerName: insurerName,
      productId: productId,
      packageId: packageId,
      packageName: packageName,
      sumInsured: sumInsured,
      netPremiumTotal: netPremiumTotal,
      discountOther: discountOther,
      netPremium: netPremium,
      stamp: stamp,
      vat: vat,
      vatAmount: vatAmount,
      grossTotal: grossTotal,
      grossTotalNet: grossTotalNet,
      effectiveDate: effectiveDate,
      expiryDate: expiryDate,
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
      imageIdcard: imageIdcard,
      imageHouse: imageHouse,
      pdfQuotation: pdfQuotation,
      deleted: deleted,
      createdUserid: createdUserid,
      createdAt: createdAt,
      updatedUserid: updatedUserid,
      updatedAt: updatedAt,
      insurerLogo: insurerLogo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadsDetailHouseStruct? updateLeadsDetailHouseStruct(
  LeadsDetailHouseStruct? leadsDetailHouse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadsDetailHouse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadsDetailHouseStructData(
  Map<String, dynamic> firestoreData,
  LeadsDetailHouseStruct? leadsDetailHouse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadsDetailHouse == null) {
    return;
  }
  if (leadsDetailHouse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leadsDetailHouse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadsDetailHouseData =
      getLeadsDetailHouseFirestoreData(leadsDetailHouse, forFieldValue);
  final nestedData =
      leadsDetailHouseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = leadsDetailHouse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadsDetailHouseFirestoreData(
  LeadsDetailHouseStruct? leadsDetailHouse, [
  bool forFieldValue = false,
]) {
  if (leadsDetailHouse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadsDetailHouse.toMap());

  // Add any Firestore field values
  leadsDetailHouse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadsDetailHouseListFirestoreData(
  List<LeadsDetailHouseStruct>? leadsDetailHouses,
) =>
    leadsDetailHouses
        ?.map((e) => getLeadsDetailHouseFirestoreData(e, true))
        .toList() ??
    [];
