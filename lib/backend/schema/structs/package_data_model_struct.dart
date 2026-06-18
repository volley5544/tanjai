// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PackageDataModelStruct extends FFFirebaseStruct {
  PackageDataModelStruct({
    String? insurerShortName,
    String? insurerName,
    String? insurerCode,
    String? companyId,
    String? logo,
    String? coverTypeList,
    String? garageTypeList,
    String? maxGrossTotal,
    String? minGrossTotal,
    String? maxSumInsured,
    String? minSumInsured,
    List<PackageStruct>? package,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _insurerShortName = insurerShortName,
        _insurerName = insurerName,
        _insurerCode = insurerCode,
        _companyId = companyId,
        _logo = logo,
        _coverTypeList = coverTypeList,
        _garageTypeList = garageTypeList,
        _maxGrossTotal = maxGrossTotal,
        _minGrossTotal = minGrossTotal,
        _maxSumInsured = maxSumInsured,
        _minSumInsured = minSumInsured,
        _package = package,
        super(firestoreUtilData);

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

  // "insurer_code" field.
  String? _insurerCode;
  String get insurerCode => _insurerCode ?? '';
  set insurerCode(String? val) => _insurerCode = val;

  bool hasInsurerCode() => _insurerCode != null;

  // "company_id" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  set companyId(String? val) => _companyId = val;

  bool hasCompanyId() => _companyId != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "cover_type_list" field.
  String? _coverTypeList;
  String get coverTypeList => _coverTypeList ?? '';
  set coverTypeList(String? val) => _coverTypeList = val;

  bool hasCoverTypeList() => _coverTypeList != null;

  // "garage_type_list" field.
  String? _garageTypeList;
  String get garageTypeList => _garageTypeList ?? '';
  set garageTypeList(String? val) => _garageTypeList = val;

  bool hasGarageTypeList() => _garageTypeList != null;

  // "max_gross_total" field.
  String? _maxGrossTotal;
  String get maxGrossTotal => _maxGrossTotal ?? '';
  set maxGrossTotal(String? val) => _maxGrossTotal = val;

  bool hasMaxGrossTotal() => _maxGrossTotal != null;

  // "min_gross_total" field.
  String? _minGrossTotal;
  String get minGrossTotal => _minGrossTotal ?? '';
  set minGrossTotal(String? val) => _minGrossTotal = val;

  bool hasMinGrossTotal() => _minGrossTotal != null;

  // "max_sum_insured" field.
  String? _maxSumInsured;
  String get maxSumInsured => _maxSumInsured ?? '';
  set maxSumInsured(String? val) => _maxSumInsured = val;

  bool hasMaxSumInsured() => _maxSumInsured != null;

  // "min_sum_insured" field.
  String? _minSumInsured;
  String get minSumInsured => _minSumInsured ?? '';
  set minSumInsured(String? val) => _minSumInsured = val;

  bool hasMinSumInsured() => _minSumInsured != null;

  // "package" field.
  List<PackageStruct>? _package;
  List<PackageStruct> get package => _package ?? const [];
  set package(List<PackageStruct>? val) => _package = val;

  void updatePackage(Function(List<PackageStruct>) updateFn) {
    updateFn(_package ??= []);
  }

  bool hasPackage() => _package != null;

  static PackageDataModelStruct fromMap(Map<String, dynamic> data) =>
      PackageDataModelStruct(
        insurerShortName: data['insurer_short_name'] as String?,
        insurerName: data['insurer_name'] as String?,
        insurerCode: data['insurer_code'] as String?,
        companyId: data['company_id'] as String?,
        logo: data['logo'] as String?,
        coverTypeList: data['cover_type_list'] as String?,
        garageTypeList: data['garage_type_list'] as String?,
        maxGrossTotal: data['max_gross_total'] as String?,
        minGrossTotal: data['min_gross_total'] as String?,
        maxSumInsured: data['max_sum_insured'] as String?,
        minSumInsured: data['min_sum_insured'] as String?,
        package: getStructList(
          data['package'],
          PackageStruct.fromMap,
        ),
      );

  static PackageDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PackageDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'insurer_short_name': _insurerShortName,
        'insurer_name': _insurerName,
        'insurer_code': _insurerCode,
        'company_id': _companyId,
        'logo': _logo,
        'cover_type_list': _coverTypeList,
        'garage_type_list': _garageTypeList,
        'max_gross_total': _maxGrossTotal,
        'min_gross_total': _minGrossTotal,
        'max_sum_insured': _maxSumInsured,
        'min_sum_insured': _minSumInsured,
        'package': _package?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'insurer_short_name': serializeParam(
          _insurerShortName,
          ParamType.String,
        ),
        'insurer_name': serializeParam(
          _insurerName,
          ParamType.String,
        ),
        'insurer_code': serializeParam(
          _insurerCode,
          ParamType.String,
        ),
        'company_id': serializeParam(
          _companyId,
          ParamType.String,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'cover_type_list': serializeParam(
          _coverTypeList,
          ParamType.String,
        ),
        'garage_type_list': serializeParam(
          _garageTypeList,
          ParamType.String,
        ),
        'max_gross_total': serializeParam(
          _maxGrossTotal,
          ParamType.String,
        ),
        'min_gross_total': serializeParam(
          _minGrossTotal,
          ParamType.String,
        ),
        'max_sum_insured': serializeParam(
          _maxSumInsured,
          ParamType.String,
        ),
        'min_sum_insured': serializeParam(
          _minSumInsured,
          ParamType.String,
        ),
        'package': serializeParam(
          _package,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PackageDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PackageDataModelStruct(
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
        insurerCode: deserializeParam(
          data['insurer_code'],
          ParamType.String,
          false,
        ),
        companyId: deserializeParam(
          data['company_id'],
          ParamType.String,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        coverTypeList: deserializeParam(
          data['cover_type_list'],
          ParamType.String,
          false,
        ),
        garageTypeList: deserializeParam(
          data['garage_type_list'],
          ParamType.String,
          false,
        ),
        maxGrossTotal: deserializeParam(
          data['max_gross_total'],
          ParamType.String,
          false,
        ),
        minGrossTotal: deserializeParam(
          data['min_gross_total'],
          ParamType.String,
          false,
        ),
        maxSumInsured: deserializeParam(
          data['max_sum_insured'],
          ParamType.String,
          false,
        ),
        minSumInsured: deserializeParam(
          data['min_sum_insured'],
          ParamType.String,
          false,
        ),
        package: deserializeStructParam<PackageStruct>(
          data['package'],
          ParamType.DataStruct,
          true,
          structBuilder: PackageStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PackageDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PackageDataModelStruct &&
        insurerShortName == other.insurerShortName &&
        insurerName == other.insurerName &&
        insurerCode == other.insurerCode &&
        companyId == other.companyId &&
        logo == other.logo &&
        coverTypeList == other.coverTypeList &&
        garageTypeList == other.garageTypeList &&
        maxGrossTotal == other.maxGrossTotal &&
        minGrossTotal == other.minGrossTotal &&
        maxSumInsured == other.maxSumInsured &&
        minSumInsured == other.minSumInsured &&
        listEquality.equals(package, other.package);
  }

  @override
  int get hashCode => const ListEquality().hash([
        insurerShortName,
        insurerName,
        insurerCode,
        companyId,
        logo,
        coverTypeList,
        garageTypeList,
        maxGrossTotal,
        minGrossTotal,
        maxSumInsured,
        minSumInsured,
        package
      ]);
}

PackageDataModelStruct createPackageDataModelStruct({
  String? insurerShortName,
  String? insurerName,
  String? insurerCode,
  String? companyId,
  String? logo,
  String? coverTypeList,
  String? garageTypeList,
  String? maxGrossTotal,
  String? minGrossTotal,
  String? maxSumInsured,
  String? minSumInsured,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PackageDataModelStruct(
      insurerShortName: insurerShortName,
      insurerName: insurerName,
      insurerCode: insurerCode,
      companyId: companyId,
      logo: logo,
      coverTypeList: coverTypeList,
      garageTypeList: garageTypeList,
      maxGrossTotal: maxGrossTotal,
      minGrossTotal: minGrossTotal,
      maxSumInsured: maxSumInsured,
      minSumInsured: minSumInsured,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PackageDataModelStruct? updatePackageDataModelStruct(
  PackageDataModelStruct? packageDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    packageDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPackageDataModelStructData(
  Map<String, dynamic> firestoreData,
  PackageDataModelStruct? packageDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (packageDataModel == null) {
    return;
  }
  if (packageDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && packageDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final packageDataModelData =
      getPackageDataModelFirestoreData(packageDataModel, forFieldValue);
  final nestedData =
      packageDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = packageDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPackageDataModelFirestoreData(
  PackageDataModelStruct? packageDataModel, [
  bool forFieldValue = false,
]) {
  if (packageDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(packageDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(packageDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPackageDataModelListFirestoreData(
  List<PackageDataModelStruct>? packageDataModels,
) =>
    packageDataModels
        ?.map((e) => getPackageDataModelFirestoreData(e, true))
        .toList() ??
    [];
