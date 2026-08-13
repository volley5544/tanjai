// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PackageStruct extends FFFirebaseStruct {
  PackageStruct({
    int? id,
    String? companyId,
    String? packageId,
    String? packageName,
    String? coverType,
    String? brandCode,
    String? brandName,
    String? modelCode,
    String? modelName,
    String? vehicleUsage,
    String? regionType,
    String? garageType,
    String? sumInsured,
    String? deductible,
    String? flood,
    String? tpbiPerson,
    String? tpbiAccident,
    String? tppd,
    String? pa,
    String? me,
    String? bb,
    String? roadsideAssistance,
    String? seat,
    String? netPremium,
    String? vat,
    String? stamp,
    String? grossTotal,
    String? effectiveDate,
    String? expiryDate,
    String? contractprocessstate,
    String? registrationYear,
    String? minAge,
    String? maxAge,
    String? assessory,
    String? serialName,
    String? shortName,
    String? fullName,
    String? productId,
    String? actAmount,
    String? logo,
    String? cc,
    String? carLost,
    String? motorAddOn,
    String? driverBehavior,
    String? inspectionExcept,
    String? canInstallmentFlg,
    String? insurerCondition,
    String? grossTotalDiscount,
    String? discountFlg,
    String? discountOther,
    String? discountPercent,
    String? grossTotalNet,
    String? insurerLogo,
    String? netPremiumTotal,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _companyId = companyId,
        _packageId = packageId,
        _packageName = packageName,
        _coverType = coverType,
        _brandCode = brandCode,
        _brandName = brandName,
        _modelCode = modelCode,
        _modelName = modelName,
        _vehicleUsage = vehicleUsage,
        _regionType = regionType,
        _garageType = garageType,
        _sumInsured = sumInsured,
        _deductible = deductible,
        _flood = flood,
        _tpbiPerson = tpbiPerson,
        _tpbiAccident = tpbiAccident,
        _tppd = tppd,
        _pa = pa,
        _me = me,
        _bb = bb,
        _roadsideAssistance = roadsideAssistance,
        _seat = seat,
        _netPremium = netPremium,
        _vat = vat,
        _stamp = stamp,
        _grossTotal = grossTotal,
        _effectiveDate = effectiveDate,
        _expiryDate = expiryDate,
        _contractprocessstate = contractprocessstate,
        _registrationYear = registrationYear,
        _minAge = minAge,
        _maxAge = maxAge,
        _assessory = assessory,
        _serialName = serialName,
        _shortName = shortName,
        _fullName = fullName,
        _productId = productId,
        _actAmount = actAmount,
        _logo = logo,
        _cc = cc,
        _carLost = carLost,
        _motorAddOn = motorAddOn,
        _driverBehavior = driverBehavior,
        _inspectionExcept = inspectionExcept,
        _canInstallmentFlg = canInstallmentFlg,
        _insurerCondition = insurerCondition,
        _grossTotalDiscount = grossTotalDiscount,
        _discountFlg = discountFlg,
        _discountOther = discountOther,
        _discountPercent = discountPercent,
        _grossTotalNet = grossTotalNet,
        _insurerLogo = insurerLogo,
        _netPremiumTotal = netPremiumTotal,
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

  // "cover_type" field.
  String? _coverType;
  String get coverType => _coverType ?? '';
  set coverType(String? val) => _coverType = val;

  bool hasCoverType() => _coverType != null;

  // "brand_code" field.
  String? _brandCode;
  String get brandCode => _brandCode ?? '';
  set brandCode(String? val) => _brandCode = val;

  bool hasBrandCode() => _brandCode != null;

  // "brand_name" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  set brandName(String? val) => _brandName = val;

  bool hasBrandName() => _brandName != null;

  // "model_code" field.
  String? _modelCode;
  String get modelCode => _modelCode ?? '';
  set modelCode(String? val) => _modelCode = val;

  bool hasModelCode() => _modelCode != null;

  // "model_name" field.
  String? _modelName;
  String get modelName => _modelName ?? '';
  set modelName(String? val) => _modelName = val;

  bool hasModelName() => _modelName != null;

  // "vehicle_usage" field.
  String? _vehicleUsage;
  String get vehicleUsage => _vehicleUsage ?? '';
  set vehicleUsage(String? val) => _vehicleUsage = val;

  bool hasVehicleUsage() => _vehicleUsage != null;

  // "region_type" field.
  String? _regionType;
  String get regionType => _regionType ?? '';
  set regionType(String? val) => _regionType = val;

  bool hasRegionType() => _regionType != null;

  // "garage_type" field.
  String? _garageType;
  String get garageType => _garageType ?? '';
  set garageType(String? val) => _garageType = val;

  bool hasGarageType() => _garageType != null;

  // "sum_insured" field.
  String? _sumInsured;
  String get sumInsured => _sumInsured ?? '';
  set sumInsured(String? val) => _sumInsured = val;

  bool hasSumInsured() => _sumInsured != null;

  // "deductible" field.
  String? _deductible;
  String get deductible => _deductible ?? '';
  set deductible(String? val) => _deductible = val;

  bool hasDeductible() => _deductible != null;

  // "flood" field.
  String? _flood;
  String get flood => _flood ?? '';
  set flood(String? val) => _flood = val;

  bool hasFlood() => _flood != null;

  // "tpbi_person" field.
  String? _tpbiPerson;
  String get tpbiPerson => _tpbiPerson ?? '';
  set tpbiPerson(String? val) => _tpbiPerson = val;

  bool hasTpbiPerson() => _tpbiPerson != null;

  // "tpbi_accident" field.
  String? _tpbiAccident;
  String get tpbiAccident => _tpbiAccident ?? '';
  set tpbiAccident(String? val) => _tpbiAccident = val;

  bool hasTpbiAccident() => _tpbiAccident != null;

  // "tppd" field.
  String? _tppd;
  String get tppd => _tppd ?? '';
  set tppd(String? val) => _tppd = val;

  bool hasTppd() => _tppd != null;

  // "pa" field.
  String? _pa;
  String get pa => _pa ?? '';
  set pa(String? val) => _pa = val;

  bool hasPa() => _pa != null;

  // "me" field.
  String? _me;
  String get me => _me ?? '';
  set me(String? val) => _me = val;

  bool hasMe() => _me != null;

  // "bb" field.
  String? _bb;
  String get bb => _bb ?? '';
  set bb(String? val) => _bb = val;

  bool hasBb() => _bb != null;

  // "roadside_assistance" field.
  String? _roadsideAssistance;
  String get roadsideAssistance => _roadsideAssistance ?? '';
  set roadsideAssistance(String? val) => _roadsideAssistance = val;

  bool hasRoadsideAssistance() => _roadsideAssistance != null;

  // "seat" field.
  String? _seat;
  String get seat => _seat ?? '';
  set seat(String? val) => _seat = val;

  bool hasSeat() => _seat != null;

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

  // "contractprocessstate" field.
  String? _contractprocessstate;
  String get contractprocessstate => _contractprocessstate ?? '';
  set contractprocessstate(String? val) => _contractprocessstate = val;

  bool hasContractprocessstate() => _contractprocessstate != null;

  // "registration_year" field.
  String? _registrationYear;
  String get registrationYear => _registrationYear ?? '';
  set registrationYear(String? val) => _registrationYear = val;

  bool hasRegistrationYear() => _registrationYear != null;

  // "min_age" field.
  String? _minAge;
  String get minAge => _minAge ?? '';
  set minAge(String? val) => _minAge = val;

  bool hasMinAge() => _minAge != null;

  // "max_age" field.
  String? _maxAge;
  String get maxAge => _maxAge ?? '';
  set maxAge(String? val) => _maxAge = val;

  bool hasMaxAge() => _maxAge != null;

  // "assessory" field.
  String? _assessory;
  String get assessory => _assessory ?? '';
  set assessory(String? val) => _assessory = val;

  bool hasAssessory() => _assessory != null;

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

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "act_amount" field.
  String? _actAmount;
  String get actAmount => _actAmount ?? '';
  set actAmount(String? val) => _actAmount = val;

  bool hasActAmount() => _actAmount != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "cc" field.
  String? _cc;
  String get cc => _cc ?? '';
  set cc(String? val) => _cc = val;

  bool hasCc() => _cc != null;

  // "car_lost" field.
  String? _carLost;
  String get carLost => _carLost ?? '';
  set carLost(String? val) => _carLost = val;

  bool hasCarLost() => _carLost != null;

  // "motor_add_on" field.
  String? _motorAddOn;
  String get motorAddOn => _motorAddOn ?? '';
  set motorAddOn(String? val) => _motorAddOn = val;

  bool hasMotorAddOn() => _motorAddOn != null;

  // "driver_behavior" field.
  String? _driverBehavior;
  String get driverBehavior => _driverBehavior ?? '';
  set driverBehavior(String? val) => _driverBehavior = val;

  bool hasDriverBehavior() => _driverBehavior != null;

  // "inspection_except" field.
  String? _inspectionExcept;
  String get inspectionExcept => _inspectionExcept ?? '';
  set inspectionExcept(String? val) => _inspectionExcept = val;

  bool hasInspectionExcept() => _inspectionExcept != null;

  // "can_installment_flg" field.
  String? _canInstallmentFlg;
  String get canInstallmentFlg => _canInstallmentFlg ?? '';
  set canInstallmentFlg(String? val) => _canInstallmentFlg = val;

  bool hasCanInstallmentFlg() => _canInstallmentFlg != null;

  // "insurer_condition" field.
  String? _insurerCondition;
  String get insurerCondition => _insurerCondition ?? '';
  set insurerCondition(String? val) => _insurerCondition = val;

  bool hasInsurerCondition() => _insurerCondition != null;

  // "gross_total_discount" field.
  String? _grossTotalDiscount;
  String get grossTotalDiscount => _grossTotalDiscount ?? '';
  set grossTotalDiscount(String? val) => _grossTotalDiscount = val;

  bool hasGrossTotalDiscount() => _grossTotalDiscount != null;

  // "discount_flg" field.
  String? _discountFlg;
  String get discountFlg => _discountFlg ?? '';
  set discountFlg(String? val) => _discountFlg = val;

  bool hasDiscountFlg() => _discountFlg != null;

  // "discount_other" field.
  String? _discountOther;
  String get discountOther => _discountOther ?? '';
  set discountOther(String? val) => _discountOther = val;

  bool hasDiscountOther() => _discountOther != null;

  // "discount_percent" field.
  String? _discountPercent;
  String get discountPercent => _discountPercent ?? '';
  set discountPercent(String? val) => _discountPercent = val;

  bool hasDiscountPercent() => _discountPercent != null;

  // "gross_total_net" field.
  String? _grossTotalNet;
  String get grossTotalNet => _grossTotalNet ?? '';
  set grossTotalNet(String? val) => _grossTotalNet = val;

  bool hasGrossTotalNet() => _grossTotalNet != null;

  // "insurer_logo" field.
  String? _insurerLogo;
  String get insurerLogo => _insurerLogo ?? '';
  set insurerLogo(String? val) => _insurerLogo = val;

  bool hasInsurerLogo() => _insurerLogo != null;

  // "net_premium_total" field.
  String? _netPremiumTotal;
  String get netPremiumTotal => _netPremiumTotal ?? '';
  set netPremiumTotal(String? val) => _netPremiumTotal = val;

  bool hasNetPremiumTotal() => _netPremiumTotal != null;

  static PackageStruct fromMap(Map<String, dynamic> data) => PackageStruct(
        id: castToType<int>(data['id']),
        companyId: data['company_id'] as String?,
        packageId: data['package_id'] as String?,
        packageName: data['package_name'] as String?,
        coverType: data['cover_type'] as String?,
        brandCode: data['brand_code'] as String?,
        brandName: data['brand_name'] as String?,
        modelCode: data['model_code'] as String?,
        modelName: data['model_name'] as String?,
        vehicleUsage: data['vehicle_usage'] as String?,
        regionType: data['region_type'] as String?,
        garageType: data['garage_type'] as String?,
        sumInsured: data['sum_insured'] as String?,
        deductible: data['deductible'] as String?,
        flood: data['flood'] as String?,
        tpbiPerson: data['tpbi_person'] as String?,
        tpbiAccident: data['tpbi_accident'] as String?,
        tppd: data['tppd'] as String?,
        pa: data['pa'] as String?,
        me: data['me'] as String?,
        bb: data['bb'] as String?,
        roadsideAssistance: data['roadside_assistance'] as String?,
        seat: data['seat'] as String?,
        netPremium: data['net_premium'] as String?,
        vat: data['vat'] as String?,
        stamp: data['stamp'] as String?,
        grossTotal: data['gross_total'] as String?,
        effectiveDate: data['effective_date'] as String?,
        expiryDate: data['expiry_date'] as String?,
        contractprocessstate: data['contractprocessstate'] as String?,
        registrationYear: data['registration_year'] as String?,
        minAge: data['min_age'] as String?,
        maxAge: data['max_age'] as String?,
        assessory: data['assessory'] as String?,
        serialName: data['serial_name'] as String?,
        shortName: data['short_name'] as String?,
        fullName: data['full_name'] as String?,
        productId: data['productId'] as String?,
        actAmount: data['act_amount'] as String?,
        logo: data['logo'] as String?,
        cc: data['cc'] as String?,
        carLost: data['car_lost'] as String?,
        motorAddOn: data['motor_add_on'] as String?,
        driverBehavior: data['driver_behavior'] as String?,
        inspectionExcept: data['inspection_except'] as String?,
        canInstallmentFlg: data['can_installment_flg'] as String?,
        insurerCondition: data['insurer_condition'] as String?,
        grossTotalDiscount: data['gross_total_discount'] as String?,
        discountFlg: data['discount_flg'] as String?,
        discountOther: data['discount_other'] as String?,
        discountPercent: data['discount_percent'] as String?,
        grossTotalNet: data['gross_total_net'] as String?,
        insurerLogo: data['insurer_logo'] as String?,
        netPremiumTotal: data['net_premium_total'] as String?,
      );

  static PackageStruct? maybeFromMap(dynamic data) =>
      data is Map ? PackageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'company_id': _companyId,
        'package_id': _packageId,
        'package_name': _packageName,
        'cover_type': _coverType,
        'brand_code': _brandCode,
        'brand_name': _brandName,
        'model_code': _modelCode,
        'model_name': _modelName,
        'vehicle_usage': _vehicleUsage,
        'region_type': _regionType,
        'garage_type': _garageType,
        'sum_insured': _sumInsured,
        'deductible': _deductible,
        'flood': _flood,
        'tpbi_person': _tpbiPerson,
        'tpbi_accident': _tpbiAccident,
        'tppd': _tppd,
        'pa': _pa,
        'me': _me,
        'bb': _bb,
        'roadside_assistance': _roadsideAssistance,
        'seat': _seat,
        'net_premium': _netPremium,
        'vat': _vat,
        'stamp': _stamp,
        'gross_total': _grossTotal,
        'effective_date': _effectiveDate,
        'expiry_date': _expiryDate,
        'contractprocessstate': _contractprocessstate,
        'registration_year': _registrationYear,
        'min_age': _minAge,
        'max_age': _maxAge,
        'assessory': _assessory,
        'serial_name': _serialName,
        'short_name': _shortName,
        'full_name': _fullName,
        'productId': _productId,
        'act_amount': _actAmount,
        'logo': _logo,
        'cc': _cc,
        'car_lost': _carLost,
        'motor_add_on': _motorAddOn,
        'driver_behavior': _driverBehavior,
        'inspection_except': _inspectionExcept,
        'can_installment_flg': _canInstallmentFlg,
        'insurer_condition': _insurerCondition,
        'gross_total_discount': _grossTotalDiscount,
        'discount_flg': _discountFlg,
        'discount_other': _discountOther,
        'discount_percent': _discountPercent,
        'gross_total_net': _grossTotalNet,
        'insurer_logo': _insurerLogo,
        'net_premium_total': _netPremiumTotal,
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
        'cover_type': serializeParam(
          _coverType,
          ParamType.String,
        ),
        'brand_code': serializeParam(
          _brandCode,
          ParamType.String,
        ),
        'brand_name': serializeParam(
          _brandName,
          ParamType.String,
        ),
        'model_code': serializeParam(
          _modelCode,
          ParamType.String,
        ),
        'model_name': serializeParam(
          _modelName,
          ParamType.String,
        ),
        'vehicle_usage': serializeParam(
          _vehicleUsage,
          ParamType.String,
        ),
        'region_type': serializeParam(
          _regionType,
          ParamType.String,
        ),
        'garage_type': serializeParam(
          _garageType,
          ParamType.String,
        ),
        'sum_insured': serializeParam(
          _sumInsured,
          ParamType.String,
        ),
        'deductible': serializeParam(
          _deductible,
          ParamType.String,
        ),
        'flood': serializeParam(
          _flood,
          ParamType.String,
        ),
        'tpbi_person': serializeParam(
          _tpbiPerson,
          ParamType.String,
        ),
        'tpbi_accident': serializeParam(
          _tpbiAccident,
          ParamType.String,
        ),
        'tppd': serializeParam(
          _tppd,
          ParamType.String,
        ),
        'pa': serializeParam(
          _pa,
          ParamType.String,
        ),
        'me': serializeParam(
          _me,
          ParamType.String,
        ),
        'bb': serializeParam(
          _bb,
          ParamType.String,
        ),
        'roadside_assistance': serializeParam(
          _roadsideAssistance,
          ParamType.String,
        ),
        'seat': serializeParam(
          _seat,
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
        'contractprocessstate': serializeParam(
          _contractprocessstate,
          ParamType.String,
        ),
        'registration_year': serializeParam(
          _registrationYear,
          ParamType.String,
        ),
        'min_age': serializeParam(
          _minAge,
          ParamType.String,
        ),
        'max_age': serializeParam(
          _maxAge,
          ParamType.String,
        ),
        'assessory': serializeParam(
          _assessory,
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
        'productId': serializeParam(
          _productId,
          ParamType.String,
        ),
        'act_amount': serializeParam(
          _actAmount,
          ParamType.String,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'cc': serializeParam(
          _cc,
          ParamType.String,
        ),
        'car_lost': serializeParam(
          _carLost,
          ParamType.String,
        ),
        'motor_add_on': serializeParam(
          _motorAddOn,
          ParamType.String,
        ),
        'driver_behavior': serializeParam(
          _driverBehavior,
          ParamType.String,
        ),
        'inspection_except': serializeParam(
          _inspectionExcept,
          ParamType.String,
        ),
        'can_installment_flg': serializeParam(
          _canInstallmentFlg,
          ParamType.String,
        ),
        'insurer_condition': serializeParam(
          _insurerCondition,
          ParamType.String,
        ),
        'gross_total_discount': serializeParam(
          _grossTotalDiscount,
          ParamType.String,
        ),
        'discount_flg': serializeParam(
          _discountFlg,
          ParamType.String,
        ),
        'discount_other': serializeParam(
          _discountOther,
          ParamType.String,
        ),
        'discount_percent': serializeParam(
          _discountPercent,
          ParamType.String,
        ),
        'gross_total_net': serializeParam(
          _grossTotalNet,
          ParamType.String,
        ),
        'insurer_logo': serializeParam(
          _insurerLogo,
          ParamType.String,
        ),
        'net_premium_total': serializeParam(
          _netPremiumTotal,
          ParamType.String,
        ),
      }.withoutNulls;

  static PackageStruct fromSerializableMap(Map<String, dynamic> data) =>
      PackageStruct(
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
        coverType: deserializeParam(
          data['cover_type'],
          ParamType.String,
          false,
        ),
        brandCode: deserializeParam(
          data['brand_code'],
          ParamType.String,
          false,
        ),
        brandName: deserializeParam(
          data['brand_name'],
          ParamType.String,
          false,
        ),
        modelCode: deserializeParam(
          data['model_code'],
          ParamType.String,
          false,
        ),
        modelName: deserializeParam(
          data['model_name'],
          ParamType.String,
          false,
        ),
        vehicleUsage: deserializeParam(
          data['vehicle_usage'],
          ParamType.String,
          false,
        ),
        regionType: deserializeParam(
          data['region_type'],
          ParamType.String,
          false,
        ),
        garageType: deserializeParam(
          data['garage_type'],
          ParamType.String,
          false,
        ),
        sumInsured: deserializeParam(
          data['sum_insured'],
          ParamType.String,
          false,
        ),
        deductible: deserializeParam(
          data['deductible'],
          ParamType.String,
          false,
        ),
        flood: deserializeParam(
          data['flood'],
          ParamType.String,
          false,
        ),
        tpbiPerson: deserializeParam(
          data['tpbi_person'],
          ParamType.String,
          false,
        ),
        tpbiAccident: deserializeParam(
          data['tpbi_accident'],
          ParamType.String,
          false,
        ),
        tppd: deserializeParam(
          data['tppd'],
          ParamType.String,
          false,
        ),
        pa: deserializeParam(
          data['pa'],
          ParamType.String,
          false,
        ),
        me: deserializeParam(
          data['me'],
          ParamType.String,
          false,
        ),
        bb: deserializeParam(
          data['bb'],
          ParamType.String,
          false,
        ),
        roadsideAssistance: deserializeParam(
          data['roadside_assistance'],
          ParamType.String,
          false,
        ),
        seat: deserializeParam(
          data['seat'],
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
        contractprocessstate: deserializeParam(
          data['contractprocessstate'],
          ParamType.String,
          false,
        ),
        registrationYear: deserializeParam(
          data['registration_year'],
          ParamType.String,
          false,
        ),
        minAge: deserializeParam(
          data['min_age'],
          ParamType.String,
          false,
        ),
        maxAge: deserializeParam(
          data['max_age'],
          ParamType.String,
          false,
        ),
        assessory: deserializeParam(
          data['assessory'],
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
        productId: deserializeParam(
          data['productId'],
          ParamType.String,
          false,
        ),
        actAmount: deserializeParam(
          data['act_amount'],
          ParamType.String,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        cc: deserializeParam(
          data['cc'],
          ParamType.String,
          false,
        ),
        carLost: deserializeParam(
          data['car_lost'],
          ParamType.String,
          false,
        ),
        motorAddOn: deserializeParam(
          data['motor_add_on'],
          ParamType.String,
          false,
        ),
        driverBehavior: deserializeParam(
          data['driver_behavior'],
          ParamType.String,
          false,
        ),
        inspectionExcept: deserializeParam(
          data['inspection_except'],
          ParamType.String,
          false,
        ),
        canInstallmentFlg: deserializeParam(
          data['can_installment_flg'],
          ParamType.String,
          false,
        ),
        insurerCondition: deserializeParam(
          data['insurer_condition'],
          ParamType.String,
          false,
        ),
        grossTotalDiscount: deserializeParam(
          data['gross_total_discount'],
          ParamType.String,
          false,
        ),
        discountFlg: deserializeParam(
          data['discount_flg'],
          ParamType.String,
          false,
        ),
        discountOther: deserializeParam(
          data['discount_other'],
          ParamType.String,
          false,
        ),
        discountPercent: deserializeParam(
          data['discount_percent'],
          ParamType.String,
          false,
        ),
        grossTotalNet: deserializeParam(
          data['gross_total_net'],
          ParamType.String,
          false,
        ),
        insurerLogo: deserializeParam(
          data['insurer_logo'],
          ParamType.String,
          false,
        ),
        netPremiumTotal: deserializeParam(
          data['net_premium_total'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PackageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PackageStruct &&
        id == other.id &&
        companyId == other.companyId &&
        packageId == other.packageId &&
        packageName == other.packageName &&
        coverType == other.coverType &&
        brandCode == other.brandCode &&
        brandName == other.brandName &&
        modelCode == other.modelCode &&
        modelName == other.modelName &&
        vehicleUsage == other.vehicleUsage &&
        regionType == other.regionType &&
        garageType == other.garageType &&
        sumInsured == other.sumInsured &&
        deductible == other.deductible &&
        flood == other.flood &&
        tpbiPerson == other.tpbiPerson &&
        tpbiAccident == other.tpbiAccident &&
        tppd == other.tppd &&
        pa == other.pa &&
        me == other.me &&
        bb == other.bb &&
        roadsideAssistance == other.roadsideAssistance &&
        seat == other.seat &&
        netPremium == other.netPremium &&
        vat == other.vat &&
        stamp == other.stamp &&
        grossTotal == other.grossTotal &&
        effectiveDate == other.effectiveDate &&
        expiryDate == other.expiryDate &&
        contractprocessstate == other.contractprocessstate &&
        registrationYear == other.registrationYear &&
        minAge == other.minAge &&
        maxAge == other.maxAge &&
        assessory == other.assessory &&
        serialName == other.serialName &&
        shortName == other.shortName &&
        fullName == other.fullName &&
        productId == other.productId &&
        actAmount == other.actAmount &&
        logo == other.logo &&
        cc == other.cc &&
        carLost == other.carLost &&
        motorAddOn == other.motorAddOn &&
        driverBehavior == other.driverBehavior &&
        inspectionExcept == other.inspectionExcept &&
        canInstallmentFlg == other.canInstallmentFlg &&
        insurerCondition == other.insurerCondition &&
        grossTotalDiscount == other.grossTotalDiscount &&
        discountFlg == other.discountFlg &&
        discountOther == other.discountOther &&
        discountPercent == other.discountPercent &&
        grossTotalNet == other.grossTotalNet &&
        insurerLogo == other.insurerLogo &&
        netPremiumTotal == other.netPremiumTotal;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        companyId,
        packageId,
        packageName,
        coverType,
        brandCode,
        brandName,
        modelCode,
        modelName,
        vehicleUsage,
        regionType,
        garageType,
        sumInsured,
        deductible,
        flood,
        tpbiPerson,
        tpbiAccident,
        tppd,
        pa,
        me,
        bb,
        roadsideAssistance,
        seat,
        netPremium,
        vat,
        stamp,
        grossTotal,
        effectiveDate,
        expiryDate,
        contractprocessstate,
        registrationYear,
        minAge,
        maxAge,
        assessory,
        serialName,
        shortName,
        fullName,
        productId,
        actAmount,
        logo,
        cc,
        carLost,
        motorAddOn,
        driverBehavior,
        inspectionExcept,
        canInstallmentFlg,
        insurerCondition,
        grossTotalDiscount,
        discountFlg,
        discountOther,
        discountPercent,
        grossTotalNet,
        insurerLogo,
        netPremiumTotal
      ]);
}

PackageStruct createPackageStruct({
  int? id,
  String? companyId,
  String? packageId,
  String? packageName,
  String? coverType,
  String? brandCode,
  String? brandName,
  String? modelCode,
  String? modelName,
  String? vehicleUsage,
  String? regionType,
  String? garageType,
  String? sumInsured,
  String? deductible,
  String? flood,
  String? tpbiPerson,
  String? tpbiAccident,
  String? tppd,
  String? pa,
  String? me,
  String? bb,
  String? roadsideAssistance,
  String? seat,
  String? netPremium,
  String? vat,
  String? stamp,
  String? grossTotal,
  String? effectiveDate,
  String? expiryDate,
  String? contractprocessstate,
  String? registrationYear,
  String? minAge,
  String? maxAge,
  String? assessory,
  String? serialName,
  String? shortName,
  String? fullName,
  String? productId,
  String? actAmount,
  String? logo,
  String? cc,
  String? carLost,
  String? motorAddOn,
  String? driverBehavior,
  String? inspectionExcept,
  String? canInstallmentFlg,
  String? insurerCondition,
  String? grossTotalDiscount,
  String? discountFlg,
  String? discountOther,
  String? discountPercent,
  String? grossTotalNet,
  String? insurerLogo,
  String? netPremiumTotal,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PackageStruct(
      id: id,
      companyId: companyId,
      packageId: packageId,
      packageName: packageName,
      coverType: coverType,
      brandCode: brandCode,
      brandName: brandName,
      modelCode: modelCode,
      modelName: modelName,
      vehicleUsage: vehicleUsage,
      regionType: regionType,
      garageType: garageType,
      sumInsured: sumInsured,
      deductible: deductible,
      flood: flood,
      tpbiPerson: tpbiPerson,
      tpbiAccident: tpbiAccident,
      tppd: tppd,
      pa: pa,
      me: me,
      bb: bb,
      roadsideAssistance: roadsideAssistance,
      seat: seat,
      netPremium: netPremium,
      vat: vat,
      stamp: stamp,
      grossTotal: grossTotal,
      effectiveDate: effectiveDate,
      expiryDate: expiryDate,
      contractprocessstate: contractprocessstate,
      registrationYear: registrationYear,
      minAge: minAge,
      maxAge: maxAge,
      assessory: assessory,
      serialName: serialName,
      shortName: shortName,
      fullName: fullName,
      productId: productId,
      actAmount: actAmount,
      logo: logo,
      cc: cc,
      carLost: carLost,
      motorAddOn: motorAddOn,
      driverBehavior: driverBehavior,
      inspectionExcept: inspectionExcept,
      canInstallmentFlg: canInstallmentFlg,
      insurerCondition: insurerCondition,
      grossTotalDiscount: grossTotalDiscount,
      discountFlg: discountFlg,
      discountOther: discountOther,
      discountPercent: discountPercent,
      grossTotalNet: grossTotalNet,
      insurerLogo: insurerLogo,
      netPremiumTotal: netPremiumTotal,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PackageStruct? updatePackageStruct(
  PackageStruct? package, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    package
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPackageStructData(
  Map<String, dynamic> firestoreData,
  PackageStruct? package,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (package == null) {
    return;
  }
  if (package.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && package.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final packageData = getPackageFirestoreData(package, forFieldValue);
  final nestedData = packageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = package.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPackageFirestoreData(
  PackageStruct? package, [
  bool forFieldValue = false,
]) {
  if (package == null) {
    return {};
  }
  final firestoreData = mapToFirestore(package.toMap());

  // Add any Firestore field values
  mapToFirestore(package.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPackageListFirestoreData(
  List<PackageStruct>? packages,
) =>
    packages?.map((e) => getPackageFirestoreData(e, true)).toList() ?? [];
