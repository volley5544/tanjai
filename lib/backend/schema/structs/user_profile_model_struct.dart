// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProfileModelStruct extends FFFirebaseStruct {
  UserProfileModelStruct({
    String? ownerName,
    String? ownerPhone,
    String? ownerId,
    String? branchCode,
    String? branchName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ownerName = ownerName,
        _ownerPhone = ownerPhone,
        _ownerId = ownerId,
        _branchCode = branchCode,
        _branchName = branchName,
        super(firestoreUtilData);

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

  // "owner_id" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

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

  static UserProfileModelStruct fromMap(Map<String, dynamic> data) =>
      UserProfileModelStruct(
        ownerName: data['owner_name'] as String?,
        ownerPhone: data['owner_phone'] as String?,
        ownerId: data['owner_id'] as String?,
        branchCode: data['branch_code'] as String?,
        branchName: data['branch_name'] as String?,
      );

  static UserProfileModelStruct? maybeFromMap(dynamic data) => data is Map
      ? UserProfileModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'owner_name': _ownerName,
        'owner_phone': _ownerPhone,
        'owner_id': _ownerId,
        'branch_code': _branchCode,
        'branch_name': _branchName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'owner_name': serializeParam(
          _ownerName,
          ParamType.String,
        ),
        'owner_phone': serializeParam(
          _ownerPhone,
          ParamType.String,
        ),
        'owner_id': serializeParam(
          _ownerId,
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
      }.withoutNulls;

  static UserProfileModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserProfileModelStruct(
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
        ownerId: deserializeParam(
          data['owner_id'],
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
      );

  @override
  String toString() => 'UserProfileModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserProfileModelStruct &&
        ownerName == other.ownerName &&
        ownerPhone == other.ownerPhone &&
        ownerId == other.ownerId &&
        branchCode == other.branchCode &&
        branchName == other.branchName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([ownerName, ownerPhone, ownerId, branchCode, branchName]);
}

UserProfileModelStruct createUserProfileModelStruct({
  String? ownerName,
  String? ownerPhone,
  String? ownerId,
  String? branchCode,
  String? branchName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserProfileModelStruct(
      ownerName: ownerName,
      ownerPhone: ownerPhone,
      ownerId: ownerId,
      branchCode: branchCode,
      branchName: branchName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserProfileModelStruct? updateUserProfileModelStruct(
  UserProfileModelStruct? userProfileModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userProfileModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserProfileModelStructData(
  Map<String, dynamic> firestoreData,
  UserProfileModelStruct? userProfileModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userProfileModel == null) {
    return;
  }
  if (userProfileModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userProfileModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userProfileModelData =
      getUserProfileModelFirestoreData(userProfileModel, forFieldValue);
  final nestedData =
      userProfileModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userProfileModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserProfileModelFirestoreData(
  UserProfileModelStruct? userProfileModel, [
  bool forFieldValue = false,
]) {
  if (userProfileModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userProfileModel.toMap());

  // Add any Firestore field values
  userProfileModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserProfileModelListFirestoreData(
  List<UserProfileModelStruct>? userProfileModels,
) =>
    userProfileModels
        ?.map((e) => getUserProfileModelFirestoreData(e, true))
        .toList() ??
    [];
