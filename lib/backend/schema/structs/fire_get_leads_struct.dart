// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FireGetLeadsStruct extends FFFirebaseStruct {
  FireGetLeadsStruct({
    String? leadId,
    String? leadNo,
    String? quotationId,
    String? subProduct,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? branchCode,
    String? branchName,
    String? groupInsuranceName,
    String? flgRenew,
    String? remark,
    String? reason,
    String? flgAct,
    String? ownerId,
    String? ownerName,
    String? ownerPhone,
    String? applicationId,
    String? quotationNo,
    String? quotationDate,
    String? quotationStatus,
    String? quotationSubStatus,
    String? remarkStatus,
    String? quotationType,
    String? quotationTypeBak,
    String? channel,
    String? expireDate,
    LeadsDetailHouseStruct? leadsDetailHouse,
    LeadsHouseStruct? leadsHouse,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _leadId = leadId,
        _leadNo = leadNo,
        _quotationId = quotationId,
        _subProduct = subProduct,
        _firstName = firstName,
        _lastName = lastName,
        _phoneNumber = phoneNumber,
        _branchCode = branchCode,
        _branchName = branchName,
        _groupInsuranceName = groupInsuranceName,
        _flgRenew = flgRenew,
        _remark = remark,
        _reason = reason,
        _flgAct = flgAct,
        _ownerId = ownerId,
        _ownerName = ownerName,
        _ownerPhone = ownerPhone,
        _applicationId = applicationId,
        _quotationNo = quotationNo,
        _quotationDate = quotationDate,
        _quotationStatus = quotationStatus,
        _quotationSubStatus = quotationSubStatus,
        _remarkStatus = remarkStatus,
        _quotationType = quotationType,
        _quotationTypeBak = quotationTypeBak,
        _channel = channel,
        _expireDate = expireDate,
        _leadsDetailHouse = leadsDetailHouse,
        _leadsHouse = leadsHouse,
        super(firestoreUtilData);

  // "lead_id" field.
  String? _leadId;
  String get leadId => _leadId ?? '';
  set leadId(String? val) => _leadId = val;

  bool hasLeadId() => _leadId != null;

  // "lead_no" field.
  String? _leadNo;
  String get leadNo => _leadNo ?? '';
  set leadNo(String? val) => _leadNo = val;

  bool hasLeadNo() => _leadNo != null;

  // "quotation_id" field.
  String? _quotationId;
  String get quotationId => _quotationId ?? '';
  set quotationId(String? val) => _quotationId = val;

  bool hasQuotationId() => _quotationId != null;

  // "sub_product" field.
  String? _subProduct;
  String get subProduct => _subProduct ?? '';
  set subProduct(String? val) => _subProduct = val;

  bool hasSubProduct() => _subProduct != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "branch_code" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  set branchCode(String? val) => _branchCode = val;

  bool hasBranchCode() => _branchCode != null;

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  set branchName(String? val) => _branchName = val;

  bool hasBranchName() => _branchName != null;

  // "group_insurance_name" field.
  String? _groupInsuranceName;
  String get groupInsuranceName => _groupInsuranceName ?? '';
  set groupInsuranceName(String? val) => _groupInsuranceName = val;

  bool hasGroupInsuranceName() => _groupInsuranceName != null;

  // "flg_renew" field.
  String? _flgRenew;
  String get flgRenew => _flgRenew ?? '';
  set flgRenew(String? val) => _flgRenew = val;

  bool hasFlgRenew() => _flgRenew != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  set remark(String? val) => _remark = val;

  bool hasRemark() => _remark != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  set reason(String? val) => _reason = val;

  bool hasReason() => _reason != null;

  // "flg_act" field.
  String? _flgAct;
  String get flgAct => _flgAct ?? '';
  set flgAct(String? val) => _flgAct = val;

  bool hasFlgAct() => _flgAct != null;

  // "owner_id" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "owner_name" field.
  String? _ownerName;
  String get ownerName => _ownerName ?? '';
  set ownerName(String? val) => _ownerName = val;

  bool hasOwnerName() => _ownerName != null;

  // "owner_phone" field.
  String? _ownerPhone;
  String get ownerPhone => _ownerPhone ?? '';
  set ownerPhone(String? val) => _ownerPhone = val;

  bool hasOwnerPhone() => _ownerPhone != null;

  // "application_id" field.
  String? _applicationId;
  String get applicationId => _applicationId ?? '';
  set applicationId(String? val) => _applicationId = val;

  bool hasApplicationId() => _applicationId != null;

  // "quotation_no" field.
  String? _quotationNo;
  String get quotationNo => _quotationNo ?? '';
  set quotationNo(String? val) => _quotationNo = val;

  bool hasQuotationNo() => _quotationNo != null;

  // "quotation_date" field.
  String? _quotationDate;
  String get quotationDate => _quotationDate ?? '';
  set quotationDate(String? val) => _quotationDate = val;

  bool hasQuotationDate() => _quotationDate != null;

  // "quotation_status" field.
  String? _quotationStatus;
  String get quotationStatus => _quotationStatus ?? '';
  set quotationStatus(String? val) => _quotationStatus = val;

  bool hasQuotationStatus() => _quotationStatus != null;

  // "quotation_sub_status" field.
  String? _quotationSubStatus;
  String get quotationSubStatus => _quotationSubStatus ?? '';
  set quotationSubStatus(String? val) => _quotationSubStatus = val;

  bool hasQuotationSubStatus() => _quotationSubStatus != null;

  // "remark_status" field.
  String? _remarkStatus;
  String get remarkStatus => _remarkStatus ?? '';
  set remarkStatus(String? val) => _remarkStatus = val;

  bool hasRemarkStatus() => _remarkStatus != null;

  // "quotation_type" field.
  String? _quotationType;
  String get quotationType => _quotationType ?? '';
  set quotationType(String? val) => _quotationType = val;

  bool hasQuotationType() => _quotationType != null;

  // "quotation_type_bak" field.
  String? _quotationTypeBak;
  String get quotationTypeBak => _quotationTypeBak ?? '';
  set quotationTypeBak(String? val) => _quotationTypeBak = val;

  bool hasQuotationTypeBak() => _quotationTypeBak != null;

  // "channel" field.
  String? _channel;
  String get channel => _channel ?? '';
  set channel(String? val) => _channel = val;

  bool hasChannel() => _channel != null;

  // "expire_date" field.
  String? _expireDate;
  String get expireDate => _expireDate ?? '';
  set expireDate(String? val) => _expireDate = val;

  bool hasExpireDate() => _expireDate != null;

  // "leads_detail_house" field.
  LeadsDetailHouseStruct? _leadsDetailHouse;
  LeadsDetailHouseStruct get leadsDetailHouse =>
      _leadsDetailHouse ?? LeadsDetailHouseStruct();
  set leadsDetailHouse(LeadsDetailHouseStruct? val) => _leadsDetailHouse = val;

  void updateLeadsDetailHouse(Function(LeadsDetailHouseStruct) updateFn) {
    updateFn(_leadsDetailHouse ??= LeadsDetailHouseStruct());
  }

  bool hasLeadsDetailHouse() => _leadsDetailHouse != null;

  // "leads_house" field.
  LeadsHouseStruct? _leadsHouse;
  LeadsHouseStruct get leadsHouse => _leadsHouse ?? LeadsHouseStruct();
  set leadsHouse(LeadsHouseStruct? val) => _leadsHouse = val;

  void updateLeadsHouse(Function(LeadsHouseStruct) updateFn) {
    updateFn(_leadsHouse ??= LeadsHouseStruct());
  }

  bool hasLeadsHouse() => _leadsHouse != null;

  static FireGetLeadsStruct fromMap(Map<String, dynamic> data) =>
      FireGetLeadsStruct(
        leadId: data['lead_id'] as String?,
        leadNo: data['lead_no'] as String?,
        quotationId: data['quotation_id'] as String?,
        subProduct: data['sub_product'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        phoneNumber: data['phone_number'] as String?,
        branchCode: data['branch_code'] as String?,
        branchName: data['branch_name'] as String?,
        groupInsuranceName: data['group_insurance_name'] as String?,
        flgRenew: data['flg_renew'] as String?,
        remark: data['remark'] as String?,
        reason: data['reason'] as String?,
        flgAct: data['flg_act'] as String?,
        ownerId: data['owner_id'] as String?,
        ownerName: data['owner_name'] as String?,
        ownerPhone: data['owner_phone'] as String?,
        applicationId: data['application_id'] as String?,
        quotationNo: data['quotation_no'] as String?,
        quotationDate: data['quotation_date'] as String?,
        quotationStatus: data['quotation_status'] as String?,
        quotationSubStatus: data['quotation_sub_status'] as String?,
        remarkStatus: data['remark_status'] as String?,
        quotationType: data['quotation_type'] as String?,
        quotationTypeBak: data['quotation_type_bak'] as String?,
        channel: data['channel'] as String?,
        expireDate: data['expire_date'] as String?,
        leadsDetailHouse: data['leads_detail_house'] is LeadsDetailHouseStruct
            ? data['leads_detail_house']
            : LeadsDetailHouseStruct.maybeFromMap(data['leads_detail_house']),
        leadsHouse: data['leads_house'] is LeadsHouseStruct
            ? data['leads_house']
            : LeadsHouseStruct.maybeFromMap(data['leads_house']),
      );

  static FireGetLeadsStruct? maybeFromMap(dynamic data) => data is Map
      ? FireGetLeadsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lead_id': _leadId,
        'lead_no': _leadNo,
        'quotation_id': _quotationId,
        'sub_product': _subProduct,
        'first_name': _firstName,
        'last_name': _lastName,
        'phone_number': _phoneNumber,
        'branch_code': _branchCode,
        'branch_name': _branchName,
        'group_insurance_name': _groupInsuranceName,
        'flg_renew': _flgRenew,
        'remark': _remark,
        'reason': _reason,
        'flg_act': _flgAct,
        'owner_id': _ownerId,
        'owner_name': _ownerName,
        'owner_phone': _ownerPhone,
        'application_id': _applicationId,
        'quotation_no': _quotationNo,
        'quotation_date': _quotationDate,
        'quotation_status': _quotationStatus,
        'quotation_sub_status': _quotationSubStatus,
        'remark_status': _remarkStatus,
        'quotation_type': _quotationType,
        'quotation_type_bak': _quotationTypeBak,
        'channel': _channel,
        'expire_date': _expireDate,
        'leads_detail_house': _leadsDetailHouse?.toMap(),
        'leads_house': _leadsHouse?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lead_id': serializeParam(
          _leadId,
          ParamType.String,
        ),
        'lead_no': serializeParam(
          _leadNo,
          ParamType.String,
        ),
        'quotation_id': serializeParam(
          _quotationId,
          ParamType.String,
        ),
        'sub_product': serializeParam(
          _subProduct,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'branch_code': serializeParam(
          _branchCode,
          ParamType.String,
        ),
        'branch_name': serializeParam(
          _branchName,
          ParamType.String,
        ),
        'group_insurance_name': serializeParam(
          _groupInsuranceName,
          ParamType.String,
        ),
        'flg_renew': serializeParam(
          _flgRenew,
          ParamType.String,
        ),
        'remark': serializeParam(
          _remark,
          ParamType.String,
        ),
        'reason': serializeParam(
          _reason,
          ParamType.String,
        ),
        'flg_act': serializeParam(
          _flgAct,
          ParamType.String,
        ),
        'owner_id': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'owner_name': serializeParam(
          _ownerName,
          ParamType.String,
        ),
        'owner_phone': serializeParam(
          _ownerPhone,
          ParamType.String,
        ),
        'application_id': serializeParam(
          _applicationId,
          ParamType.String,
        ),
        'quotation_no': serializeParam(
          _quotationNo,
          ParamType.String,
        ),
        'quotation_date': serializeParam(
          _quotationDate,
          ParamType.String,
        ),
        'quotation_status': serializeParam(
          _quotationStatus,
          ParamType.String,
        ),
        'quotation_sub_status': serializeParam(
          _quotationSubStatus,
          ParamType.String,
        ),
        'remark_status': serializeParam(
          _remarkStatus,
          ParamType.String,
        ),
        'quotation_type': serializeParam(
          _quotationType,
          ParamType.String,
        ),
        'quotation_type_bak': serializeParam(
          _quotationTypeBak,
          ParamType.String,
        ),
        'channel': serializeParam(
          _channel,
          ParamType.String,
        ),
        'expire_date': serializeParam(
          _expireDate,
          ParamType.String,
        ),
        'leads_detail_house': serializeParam(
          _leadsDetailHouse,
          ParamType.DataStruct,
        ),
        'leads_house': serializeParam(
          _leadsHouse,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static FireGetLeadsStruct fromSerializableMap(Map<String, dynamic> data) =>
      FireGetLeadsStruct(
        leadId: deserializeParam(
          data['lead_id'],
          ParamType.String,
          false,
        ),
        leadNo: deserializeParam(
          data['lead_no'],
          ParamType.String,
          false,
        ),
        quotationId: deserializeParam(
          data['quotation_id'],
          ParamType.String,
          false,
        ),
        subProduct: deserializeParam(
          data['sub_product'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        branchCode: deserializeParam(
          data['branch_code'],
          ParamType.String,
          false,
        ),
        branchName: deserializeParam(
          data['branch_name'],
          ParamType.String,
          false,
        ),
        groupInsuranceName: deserializeParam(
          data['group_insurance_name'],
          ParamType.String,
          false,
        ),
        flgRenew: deserializeParam(
          data['flg_renew'],
          ParamType.String,
          false,
        ),
        remark: deserializeParam(
          data['remark'],
          ParamType.String,
          false,
        ),
        reason: deserializeParam(
          data['reason'],
          ParamType.String,
          false,
        ),
        flgAct: deserializeParam(
          data['flg_act'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['owner_id'],
          ParamType.String,
          false,
        ),
        ownerName: deserializeParam(
          data['owner_name'],
          ParamType.String,
          false,
        ),
        ownerPhone: deserializeParam(
          data['owner_phone'],
          ParamType.String,
          false,
        ),
        applicationId: deserializeParam(
          data['application_id'],
          ParamType.String,
          false,
        ),
        quotationNo: deserializeParam(
          data['quotation_no'],
          ParamType.String,
          false,
        ),
        quotationDate: deserializeParam(
          data['quotation_date'],
          ParamType.String,
          false,
        ),
        quotationStatus: deserializeParam(
          data['quotation_status'],
          ParamType.String,
          false,
        ),
        quotationSubStatus: deserializeParam(
          data['quotation_sub_status'],
          ParamType.String,
          false,
        ),
        remarkStatus: deserializeParam(
          data['remark_status'],
          ParamType.String,
          false,
        ),
        quotationType: deserializeParam(
          data['quotation_type'],
          ParamType.String,
          false,
        ),
        quotationTypeBak: deserializeParam(
          data['quotation_type_bak'],
          ParamType.String,
          false,
        ),
        channel: deserializeParam(
          data['channel'],
          ParamType.String,
          false,
        ),
        expireDate: deserializeParam(
          data['expire_date'],
          ParamType.String,
          false,
        ),
        leadsDetailHouse: deserializeStructParam(
          data['leads_detail_house'],
          ParamType.DataStruct,
          false,
          structBuilder: LeadsDetailHouseStruct.fromSerializableMap,
        ),
        leadsHouse: deserializeStructParam(
          data['leads_house'],
          ParamType.DataStruct,
          false,
          structBuilder: LeadsHouseStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FireGetLeadsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FireGetLeadsStruct &&
        leadId == other.leadId &&
        leadNo == other.leadNo &&
        quotationId == other.quotationId &&
        subProduct == other.subProduct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phoneNumber == other.phoneNumber &&
        branchCode == other.branchCode &&
        branchName == other.branchName &&
        groupInsuranceName == other.groupInsuranceName &&
        flgRenew == other.flgRenew &&
        remark == other.remark &&
        reason == other.reason &&
        flgAct == other.flgAct &&
        ownerId == other.ownerId &&
        ownerName == other.ownerName &&
        ownerPhone == other.ownerPhone &&
        applicationId == other.applicationId &&
        quotationNo == other.quotationNo &&
        quotationDate == other.quotationDate &&
        quotationStatus == other.quotationStatus &&
        quotationSubStatus == other.quotationSubStatus &&
        remarkStatus == other.remarkStatus &&
        quotationType == other.quotationType &&
        quotationTypeBak == other.quotationTypeBak &&
        channel == other.channel &&
        expireDate == other.expireDate &&
        leadsDetailHouse == other.leadsDetailHouse &&
        leadsHouse == other.leadsHouse;
  }

  @override
  int get hashCode => const ListEquality().hash([
        leadId,
        leadNo,
        quotationId,
        subProduct,
        firstName,
        lastName,
        phoneNumber,
        branchCode,
        branchName,
        groupInsuranceName,
        flgRenew,
        remark,
        reason,
        flgAct,
        ownerId,
        ownerName,
        ownerPhone,
        applicationId,
        quotationNo,
        quotationDate,
        quotationStatus,
        quotationSubStatus,
        remarkStatus,
        quotationType,
        quotationTypeBak,
        channel,
        expireDate,
        leadsDetailHouse,
        leadsHouse
      ]);
}

FireGetLeadsStruct createFireGetLeadsStruct({
  String? leadId,
  String? leadNo,
  String? quotationId,
  String? subProduct,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? branchCode,
  String? branchName,
  String? groupInsuranceName,
  String? flgRenew,
  String? remark,
  String? reason,
  String? flgAct,
  String? ownerId,
  String? ownerName,
  String? ownerPhone,
  String? applicationId,
  String? quotationNo,
  String? quotationDate,
  String? quotationStatus,
  String? quotationSubStatus,
  String? remarkStatus,
  String? quotationType,
  String? quotationTypeBak,
  String? channel,
  String? expireDate,
  LeadsDetailHouseStruct? leadsDetailHouse,
  LeadsHouseStruct? leadsHouse,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FireGetLeadsStruct(
      leadId: leadId,
      leadNo: leadNo,
      quotationId: quotationId,
      subProduct: subProduct,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      branchCode: branchCode,
      branchName: branchName,
      groupInsuranceName: groupInsuranceName,
      flgRenew: flgRenew,
      remark: remark,
      reason: reason,
      flgAct: flgAct,
      ownerId: ownerId,
      ownerName: ownerName,
      ownerPhone: ownerPhone,
      applicationId: applicationId,
      quotationNo: quotationNo,
      quotationDate: quotationDate,
      quotationStatus: quotationStatus,
      quotationSubStatus: quotationSubStatus,
      remarkStatus: remarkStatus,
      quotationType: quotationType,
      quotationTypeBak: quotationTypeBak,
      channel: channel,
      expireDate: expireDate,
      leadsDetailHouse: leadsDetailHouse ??
          (clearUnsetFields ? LeadsDetailHouseStruct() : null),
      leadsHouse: leadsHouse ?? (clearUnsetFields ? LeadsHouseStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FireGetLeadsStruct? updateFireGetLeadsStruct(
  FireGetLeadsStruct? fireGetLeads, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fireGetLeads
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFireGetLeadsStructData(
  Map<String, dynamic> firestoreData,
  FireGetLeadsStruct? fireGetLeads,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fireGetLeads == null) {
    return;
  }
  if (fireGetLeads.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fireGetLeads.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fireGetLeadsData =
      getFireGetLeadsFirestoreData(fireGetLeads, forFieldValue);
  final nestedData =
      fireGetLeadsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fireGetLeads.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFireGetLeadsFirestoreData(
  FireGetLeadsStruct? fireGetLeads, [
  bool forFieldValue = false,
]) {
  if (fireGetLeads == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fireGetLeads.toMap());

  // Handle nested data for "leads_detail_house" field.
  addLeadsDetailHouseStructData(
    firestoreData,
    fireGetLeads.hasLeadsDetailHouse() ? fireGetLeads.leadsDetailHouse : null,
    'leads_detail_house',
    forFieldValue,
  );

  // Handle nested data for "leads_house" field.
  addLeadsHouseStructData(
    firestoreData,
    fireGetLeads.hasLeadsHouse() ? fireGetLeads.leadsHouse : null,
    'leads_house',
    forFieldValue,
  );

  // Add any Firestore field values
  fireGetLeads.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFireGetLeadsListFirestoreData(
  List<FireGetLeadsStruct>? fireGetLeadss,
) =>
    fireGetLeadss?.map((e) => getFireGetLeadsFirestoreData(e, true)).toList() ??
    [];
