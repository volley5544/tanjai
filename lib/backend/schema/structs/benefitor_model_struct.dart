// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BenefitorModelStruct extends FFFirebaseStruct {
  BenefitorModelStruct({
    String? driverId,
    String? driverNo,
    String? applicationId,
    String? idTypeId,
    String? nationalThaiId,
    String? licenseNo,
    String? gender,
    String? titleThId,
    String? titleTh,
    String? firstNameTh,
    String? lastNameTh,
    String? birthDay,
    String? imageIdcard,
    String? imageLicenseNo,
    String? occupationId,
    String? occupationCode,
    String? occupationName,
    String? occupationSubcode,
    String? occupationSubname,
    String? benefitorName,
    String? relationship,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _driverId = driverId,
        _driverNo = driverNo,
        _applicationId = applicationId,
        _idTypeId = idTypeId,
        _nationalThaiId = nationalThaiId,
        _licenseNo = licenseNo,
        _gender = gender,
        _titleThId = titleThId,
        _titleTh = titleTh,
        _firstNameTh = firstNameTh,
        _lastNameTh = lastNameTh,
        _birthDay = birthDay,
        _imageIdcard = imageIdcard,
        _imageLicenseNo = imageLicenseNo,
        _occupationId = occupationId,
        _occupationCode = occupationCode,
        _occupationName = occupationName,
        _occupationSubcode = occupationSubcode,
        _occupationSubname = occupationSubname,
        _benefitorName = benefitorName,
        _relationship = relationship,
        super(firestoreUtilData);

  // "driver_id" field.
  String? _driverId;
  String get driverId => _driverId ?? '';
  set driverId(String? val) => _driverId = val;

  bool hasDriverId() => _driverId != null;

  // "driver_no" field.
  String? _driverNo;
  String get driverNo => _driverNo ?? '';
  set driverNo(String? val) => _driverNo = val;

  bool hasDriverNo() => _driverNo != null;

  // "application_id" field.
  String? _applicationId;
  String get applicationId => _applicationId ?? '';
  set applicationId(String? val) => _applicationId = val;

  bool hasApplicationId() => _applicationId != null;

  // "id_type_id" field.
  String? _idTypeId;
  String get idTypeId => _idTypeId ?? '';
  set idTypeId(String? val) => _idTypeId = val;

  bool hasIdTypeId() => _idTypeId != null;

  // "national_thai_id" field.
  String? _nationalThaiId;
  String get nationalThaiId => _nationalThaiId ?? '';
  set nationalThaiId(String? val) => _nationalThaiId = val;

  bool hasNationalThaiId() => _nationalThaiId != null;

  // "license_no" field.
  String? _licenseNo;
  String get licenseNo => _licenseNo ?? '';
  set licenseNo(String? val) => _licenseNo = val;

  bool hasLicenseNo() => _licenseNo != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "title_th_id" field.
  String? _titleThId;
  String get titleThId => _titleThId ?? '';
  set titleThId(String? val) => _titleThId = val;

  bool hasTitleThId() => _titleThId != null;

  // "title_th" field.
  String? _titleTh;
  String get titleTh => _titleTh ?? '';
  set titleTh(String? val) => _titleTh = val;

  bool hasTitleTh() => _titleTh != null;

  // "first_name_th" field.
  String? _firstNameTh;
  String get firstNameTh => _firstNameTh ?? '';
  set firstNameTh(String? val) => _firstNameTh = val;

  bool hasFirstNameTh() => _firstNameTh != null;

  // "last_name_th" field.
  String? _lastNameTh;
  String get lastNameTh => _lastNameTh ?? '';
  set lastNameTh(String? val) => _lastNameTh = val;

  bool hasLastNameTh() => _lastNameTh != null;

  // "birth_day" field.
  String? _birthDay;
  String get birthDay => _birthDay ?? '';
  set birthDay(String? val) => _birthDay = val;

  bool hasBirthDay() => _birthDay != null;

  // "image_idcard" field.
  String? _imageIdcard;
  String get imageIdcard => _imageIdcard ?? '';
  set imageIdcard(String? val) => _imageIdcard = val;

  bool hasImageIdcard() => _imageIdcard != null;

  // "image_license_no" field.
  String? _imageLicenseNo;
  String get imageLicenseNo => _imageLicenseNo ?? '';
  set imageLicenseNo(String? val) => _imageLicenseNo = val;

  bool hasImageLicenseNo() => _imageLicenseNo != null;

  // "occupation_id" field.
  String? _occupationId;
  String get occupationId => _occupationId ?? '';
  set occupationId(String? val) => _occupationId = val;

  bool hasOccupationId() => _occupationId != null;

  // "occupation_code" field.
  String? _occupationCode;
  String get occupationCode => _occupationCode ?? '';
  set occupationCode(String? val) => _occupationCode = val;

  bool hasOccupationCode() => _occupationCode != null;

  // "occupation_name" field.
  String? _occupationName;
  String get occupationName => _occupationName ?? '';
  set occupationName(String? val) => _occupationName = val;

  bool hasOccupationName() => _occupationName != null;

  // "occupation_subcode" field.
  String? _occupationSubcode;
  String get occupationSubcode => _occupationSubcode ?? '';
  set occupationSubcode(String? val) => _occupationSubcode = val;

  bool hasOccupationSubcode() => _occupationSubcode != null;

  // "occupation_subname" field.
  String? _occupationSubname;
  String get occupationSubname => _occupationSubname ?? '';
  set occupationSubname(String? val) => _occupationSubname = val;

  bool hasOccupationSubname() => _occupationSubname != null;

  // "benefitorName" field.
  String? _benefitorName;
  String get benefitorName => _benefitorName ?? '';
  set benefitorName(String? val) => _benefitorName = val;

  bool hasBenefitorName() => _benefitorName != null;

  // "relationship" field.
  String? _relationship;
  String get relationship => _relationship ?? '';
  set relationship(String? val) => _relationship = val;

  bool hasRelationship() => _relationship != null;

  static BenefitorModelStruct fromMap(Map<String, dynamic> data) =>
      BenefitorModelStruct(
        driverId: data['driver_id'] as String?,
        driverNo: data['driver_no'] as String?,
        applicationId: data['application_id'] as String?,
        idTypeId: data['id_type_id'] as String?,
        nationalThaiId: data['national_thai_id'] as String?,
        licenseNo: data['license_no'] as String?,
        gender: data['gender'] as String?,
        titleThId: data['title_th_id'] as String?,
        titleTh: data['title_th'] as String?,
        firstNameTh: data['first_name_th'] as String?,
        lastNameTh: data['last_name_th'] as String?,
        birthDay: data['birth_day'] as String?,
        imageIdcard: data['image_idcard'] as String?,
        imageLicenseNo: data['image_license_no'] as String?,
        occupationId: data['occupation_id'] as String?,
        occupationCode: data['occupation_code'] as String?,
        occupationName: data['occupation_name'] as String?,
        occupationSubcode: data['occupation_subcode'] as String?,
        occupationSubname: data['occupation_subname'] as String?,
        benefitorName: data['benefitorName'] as String?,
        relationship: data['relationship'] as String?,
      );

  static BenefitorModelStruct? maybeFromMap(dynamic data) => data is Map
      ? BenefitorModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'driver_id': _driverId,
        'driver_no': _driverNo,
        'application_id': _applicationId,
        'id_type_id': _idTypeId,
        'national_thai_id': _nationalThaiId,
        'license_no': _licenseNo,
        'gender': _gender,
        'title_th_id': _titleThId,
        'title_th': _titleTh,
        'first_name_th': _firstNameTh,
        'last_name_th': _lastNameTh,
        'birth_day': _birthDay,
        'image_idcard': _imageIdcard,
        'image_license_no': _imageLicenseNo,
        'occupation_id': _occupationId,
        'occupation_code': _occupationCode,
        'occupation_name': _occupationName,
        'occupation_subcode': _occupationSubcode,
        'occupation_subname': _occupationSubname,
        'benefitorName': _benefitorName,
        'relationship': _relationship,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'driver_id': serializeParam(
          _driverId,
          ParamType.String,
        ),
        'driver_no': serializeParam(
          _driverNo,
          ParamType.String,
        ),
        'application_id': serializeParam(
          _applicationId,
          ParamType.String,
        ),
        'id_type_id': serializeParam(
          _idTypeId,
          ParamType.String,
        ),
        'national_thai_id': serializeParam(
          _nationalThaiId,
          ParamType.String,
        ),
        'license_no': serializeParam(
          _licenseNo,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'title_th_id': serializeParam(
          _titleThId,
          ParamType.String,
        ),
        'title_th': serializeParam(
          _titleTh,
          ParamType.String,
        ),
        'first_name_th': serializeParam(
          _firstNameTh,
          ParamType.String,
        ),
        'last_name_th': serializeParam(
          _lastNameTh,
          ParamType.String,
        ),
        'birth_day': serializeParam(
          _birthDay,
          ParamType.String,
        ),
        'image_idcard': serializeParam(
          _imageIdcard,
          ParamType.String,
        ),
        'image_license_no': serializeParam(
          _imageLicenseNo,
          ParamType.String,
        ),
        'occupation_id': serializeParam(
          _occupationId,
          ParamType.String,
        ),
        'occupation_code': serializeParam(
          _occupationCode,
          ParamType.String,
        ),
        'occupation_name': serializeParam(
          _occupationName,
          ParamType.String,
        ),
        'occupation_subcode': serializeParam(
          _occupationSubcode,
          ParamType.String,
        ),
        'occupation_subname': serializeParam(
          _occupationSubname,
          ParamType.String,
        ),
        'benefitorName': serializeParam(
          _benefitorName,
          ParamType.String,
        ),
        'relationship': serializeParam(
          _relationship,
          ParamType.String,
        ),
      }.withoutNulls;

  static BenefitorModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      BenefitorModelStruct(
        driverId: deserializeParam(
          data['driver_id'],
          ParamType.String,
          false,
        ),
        driverNo: deserializeParam(
          data['driver_no'],
          ParamType.String,
          false,
        ),
        applicationId: deserializeParam(
          data['application_id'],
          ParamType.String,
          false,
        ),
        idTypeId: deserializeParam(
          data['id_type_id'],
          ParamType.String,
          false,
        ),
        nationalThaiId: deserializeParam(
          data['national_thai_id'],
          ParamType.String,
          false,
        ),
        licenseNo: deserializeParam(
          data['license_no'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        titleThId: deserializeParam(
          data['title_th_id'],
          ParamType.String,
          false,
        ),
        titleTh: deserializeParam(
          data['title_th'],
          ParamType.String,
          false,
        ),
        firstNameTh: deserializeParam(
          data['first_name_th'],
          ParamType.String,
          false,
        ),
        lastNameTh: deserializeParam(
          data['last_name_th'],
          ParamType.String,
          false,
        ),
        birthDay: deserializeParam(
          data['birth_day'],
          ParamType.String,
          false,
        ),
        imageIdcard: deserializeParam(
          data['image_idcard'],
          ParamType.String,
          false,
        ),
        imageLicenseNo: deserializeParam(
          data['image_license_no'],
          ParamType.String,
          false,
        ),
        occupationId: deserializeParam(
          data['occupation_id'],
          ParamType.String,
          false,
        ),
        occupationCode: deserializeParam(
          data['occupation_code'],
          ParamType.String,
          false,
        ),
        occupationName: deserializeParam(
          data['occupation_name'],
          ParamType.String,
          false,
        ),
        occupationSubcode: deserializeParam(
          data['occupation_subcode'],
          ParamType.String,
          false,
        ),
        occupationSubname: deserializeParam(
          data['occupation_subname'],
          ParamType.String,
          false,
        ),
        benefitorName: deserializeParam(
          data['benefitorName'],
          ParamType.String,
          false,
        ),
        relationship: deserializeParam(
          data['relationship'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BenefitorModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BenefitorModelStruct &&
        driverId == other.driverId &&
        driverNo == other.driverNo &&
        applicationId == other.applicationId &&
        idTypeId == other.idTypeId &&
        nationalThaiId == other.nationalThaiId &&
        licenseNo == other.licenseNo &&
        gender == other.gender &&
        titleThId == other.titleThId &&
        titleTh == other.titleTh &&
        firstNameTh == other.firstNameTh &&
        lastNameTh == other.lastNameTh &&
        birthDay == other.birthDay &&
        imageIdcard == other.imageIdcard &&
        imageLicenseNo == other.imageLicenseNo &&
        occupationId == other.occupationId &&
        occupationCode == other.occupationCode &&
        occupationName == other.occupationName &&
        occupationSubcode == other.occupationSubcode &&
        occupationSubname == other.occupationSubname &&
        benefitorName == other.benefitorName &&
        relationship == other.relationship;
  }

  @override
  int get hashCode => const ListEquality().hash([
        driverId,
        driverNo,
        applicationId,
        idTypeId,
        nationalThaiId,
        licenseNo,
        gender,
        titleThId,
        titleTh,
        firstNameTh,
        lastNameTh,
        birthDay,
        imageIdcard,
        imageLicenseNo,
        occupationId,
        occupationCode,
        occupationName,
        occupationSubcode,
        occupationSubname,
        benefitorName,
        relationship
      ]);
}

BenefitorModelStruct createBenefitorModelStruct({
  String? driverId,
  String? driverNo,
  String? applicationId,
  String? idTypeId,
  String? nationalThaiId,
  String? licenseNo,
  String? gender,
  String? titleThId,
  String? titleTh,
  String? firstNameTh,
  String? lastNameTh,
  String? birthDay,
  String? imageIdcard,
  String? imageLicenseNo,
  String? occupationId,
  String? occupationCode,
  String? occupationName,
  String? occupationSubcode,
  String? occupationSubname,
  String? benefitorName,
  String? relationship,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BenefitorModelStruct(
      driverId: driverId,
      driverNo: driverNo,
      applicationId: applicationId,
      idTypeId: idTypeId,
      nationalThaiId: nationalThaiId,
      licenseNo: licenseNo,
      gender: gender,
      titleThId: titleThId,
      titleTh: titleTh,
      firstNameTh: firstNameTh,
      lastNameTh: lastNameTh,
      birthDay: birthDay,
      imageIdcard: imageIdcard,
      imageLicenseNo: imageLicenseNo,
      occupationId: occupationId,
      occupationCode: occupationCode,
      occupationName: occupationName,
      occupationSubcode: occupationSubcode,
      occupationSubname: occupationSubname,
      benefitorName: benefitorName,
      relationship: relationship,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BenefitorModelStruct? updateBenefitorModelStruct(
  BenefitorModelStruct? benefitorModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    benefitorModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBenefitorModelStructData(
  Map<String, dynamic> firestoreData,
  BenefitorModelStruct? benefitorModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (benefitorModel == null) {
    return;
  }
  if (benefitorModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && benefitorModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final benefitorModelData =
      getBenefitorModelFirestoreData(benefitorModel, forFieldValue);
  final nestedData =
      benefitorModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = benefitorModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBenefitorModelFirestoreData(
  BenefitorModelStruct? benefitorModel, [
  bool forFieldValue = false,
]) {
  if (benefitorModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(benefitorModel.toMap());

  // Add any Firestore field values
  benefitorModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBenefitorModelListFirestoreData(
  List<BenefitorModelStruct>? benefitorModels,
) =>
    benefitorModels
        ?.map((e) => getBenefitorModelFirestoreData(e, true))
        .toList() ??
    [];
