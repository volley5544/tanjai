// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BenefitorModelStruct extends FFFirebaseStruct {
  BenefitorModelStruct({
    String? insuredPersonId,
    String? insuredPersonNo,
    String? insuredPersonType,
    String? applicationId,
    String? gender,
    String? titleThId,
    String? titleTh,
    String? firstNameTh,
    String? lastNameTh,
    String? birthDay,
    String? beneficiaryName,
    String? relationName,
    String? insuredPersonTypeName,
    String? age,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _insuredPersonId = insuredPersonId,
        _insuredPersonNo = insuredPersonNo,
        _insuredPersonType = insuredPersonType,
        _applicationId = applicationId,
        _gender = gender,
        _titleThId = titleThId,
        _titleTh = titleTh,
        _firstNameTh = firstNameTh,
        _lastNameTh = lastNameTh,
        _birthDay = birthDay,
        _beneficiaryName = beneficiaryName,
        _relationName = relationName,
        _insuredPersonTypeName = insuredPersonTypeName,
        _age = age,
        super(firestoreUtilData);

  // "insured_person_id" field.
  String? _insuredPersonId;
  String get insuredPersonId => _insuredPersonId ?? '';
  set insuredPersonId(String? val) => _insuredPersonId = val;

  bool hasInsuredPersonId() => _insuredPersonId != null;

  // "insured_person_no" field.
  String? _insuredPersonNo;
  String get insuredPersonNo => _insuredPersonNo ?? '';
  set insuredPersonNo(String? val) => _insuredPersonNo = val;

  bool hasInsuredPersonNo() => _insuredPersonNo != null;

  // "insured_person_type" field.
  String? _insuredPersonType;
  String get insuredPersonType => _insuredPersonType ?? '';
  set insuredPersonType(String? val) => _insuredPersonType = val;

  bool hasInsuredPersonType() => _insuredPersonType != null;

  // "application_id" field.
  String? _applicationId;
  String get applicationId => _applicationId ?? '';
  set applicationId(String? val) => _applicationId = val;

  bool hasApplicationId() => _applicationId != null;

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

  // "beneficiary_name" field.
  String? _beneficiaryName;
  String get beneficiaryName => _beneficiaryName ?? '';
  set beneficiaryName(String? val) => _beneficiaryName = val;

  bool hasBeneficiaryName() => _beneficiaryName != null;

  // "relation_name" field.
  String? _relationName;
  String get relationName => _relationName ?? '';
  set relationName(String? val) => _relationName = val;

  bool hasRelationName() => _relationName != null;

  // "insured_person_type_name" field.
  String? _insuredPersonTypeName;
  String get insuredPersonTypeName => _insuredPersonTypeName ?? '';
  set insuredPersonTypeName(String? val) => _insuredPersonTypeName = val;

  bool hasInsuredPersonTypeName() => _insuredPersonTypeName != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  set age(String? val) => _age = val;

  bool hasAge() => _age != null;

  static BenefitorModelStruct fromMap(Map<String, dynamic> data) =>
      BenefitorModelStruct(
        insuredPersonId: data['insured_person_id'] as String?,
        insuredPersonNo: data['insured_person_no'] as String?,
        insuredPersonType: data['insured_person_type'] as String?,
        applicationId: data['application_id'] as String?,
        gender: data['gender'] as String?,
        titleThId: data['title_th_id'] as String?,
        titleTh: data['title_th'] as String?,
        firstNameTh: data['first_name_th'] as String?,
        lastNameTh: data['last_name_th'] as String?,
        birthDay: data['birth_day'] as String?,
        beneficiaryName: data['beneficiary_name'] as String?,
        relationName: data['relation_name'] as String?,
        insuredPersonTypeName: data['insured_person_type_name'] as String?,
        age: data['age'] as String?,
      );

  static BenefitorModelStruct? maybeFromMap(dynamic data) => data is Map
      ? BenefitorModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'insured_person_id': _insuredPersonId,
        'insured_person_no': _insuredPersonNo,
        'insured_person_type': _insuredPersonType,
        'application_id': _applicationId,
        'gender': _gender,
        'title_th_id': _titleThId,
        'title_th': _titleTh,
        'first_name_th': _firstNameTh,
        'last_name_th': _lastNameTh,
        'birth_day': _birthDay,
        'beneficiary_name': _beneficiaryName,
        'relation_name': _relationName,
        'insured_person_type_name': _insuredPersonTypeName,
        'age': _age,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'insured_person_id': serializeParam(
          _insuredPersonId,
          ParamType.String,
        ),
        'insured_person_no': serializeParam(
          _insuredPersonNo,
          ParamType.String,
        ),
        'insured_person_type': serializeParam(
          _insuredPersonType,
          ParamType.String,
        ),
        'application_id': serializeParam(
          _applicationId,
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
        'beneficiary_name': serializeParam(
          _beneficiaryName,
          ParamType.String,
        ),
        'relation_name': serializeParam(
          _relationName,
          ParamType.String,
        ),
        'insured_person_type_name': serializeParam(
          _insuredPersonTypeName,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.String,
        ),
      }.withoutNulls;

  static BenefitorModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      BenefitorModelStruct(
        insuredPersonId: deserializeParam(
          data['insured_person_id'],
          ParamType.String,
          false,
        ),
        insuredPersonNo: deserializeParam(
          data['insured_person_no'],
          ParamType.String,
          false,
        ),
        insuredPersonType: deserializeParam(
          data['insured_person_type'],
          ParamType.String,
          false,
        ),
        applicationId: deserializeParam(
          data['application_id'],
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
        beneficiaryName: deserializeParam(
          data['beneficiary_name'],
          ParamType.String,
          false,
        ),
        relationName: deserializeParam(
          data['relation_name'],
          ParamType.String,
          false,
        ),
        insuredPersonTypeName: deserializeParam(
          data['insured_person_type_name'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BenefitorModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BenefitorModelStruct &&
        insuredPersonId == other.insuredPersonId &&
        insuredPersonNo == other.insuredPersonNo &&
        insuredPersonType == other.insuredPersonType &&
        applicationId == other.applicationId &&
        gender == other.gender &&
        titleThId == other.titleThId &&
        titleTh == other.titleTh &&
        firstNameTh == other.firstNameTh &&
        lastNameTh == other.lastNameTh &&
        birthDay == other.birthDay &&
        beneficiaryName == other.beneficiaryName &&
        relationName == other.relationName &&
        insuredPersonTypeName == other.insuredPersonTypeName &&
        age == other.age;
  }

  @override
  int get hashCode => const ListEquality().hash([
        insuredPersonId,
        insuredPersonNo,
        insuredPersonType,
        applicationId,
        gender,
        titleThId,
        titleTh,
        firstNameTh,
        lastNameTh,
        birthDay,
        beneficiaryName,
        relationName,
        insuredPersonTypeName,
        age
      ]);
}

BenefitorModelStruct createBenefitorModelStruct({
  String? insuredPersonId,
  String? insuredPersonNo,
  String? insuredPersonType,
  String? applicationId,
  String? gender,
  String? titleThId,
  String? titleTh,
  String? firstNameTh,
  String? lastNameTh,
  String? birthDay,
  String? beneficiaryName,
  String? relationName,
  String? insuredPersonTypeName,
  String? age,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BenefitorModelStruct(
      insuredPersonId: insuredPersonId,
      insuredPersonNo: insuredPersonNo,
      insuredPersonType: insuredPersonType,
      applicationId: applicationId,
      gender: gender,
      titleThId: titleThId,
      titleTh: titleTh,
      firstNameTh: firstNameTh,
      lastNameTh: lastNameTh,
      birthDay: birthDay,
      beneficiaryName: beneficiaryName,
      relationName: relationName,
      insuredPersonTypeName: insuredPersonTypeName,
      age: age,
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
  mapToFirestore(benefitorModel.firestoreUtilData.fieldValues)
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
