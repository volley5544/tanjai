// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminRoleMenuStruct extends FFFirebaseStruct {
  AdminRoleMenuStruct({
    String? groupName,
    List<String>? employeeId,
    List<String>? visibleMenuName,
    List<String>? level,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _groupName = groupName,
        _employeeId = employeeId,
        _visibleMenuName = visibleMenuName,
        _level = level,
        super(firestoreUtilData);

  // "group_name" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  set groupName(String? val) => _groupName = val;

  bool hasGroupName() => _groupName != null;

  // "employee_id" field.
  List<String>? _employeeId;
  List<String> get employeeId => _employeeId ?? const [];
  set employeeId(List<String>? val) => _employeeId = val;

  void updateEmployeeId(Function(List<String>) updateFn) {
    updateFn(_employeeId ??= []);
  }

  bool hasEmployeeId() => _employeeId != null;

  // "visible_menu_name" field.
  List<String>? _visibleMenuName;
  List<String> get visibleMenuName => _visibleMenuName ?? const [];
  set visibleMenuName(List<String>? val) => _visibleMenuName = val;

  void updateVisibleMenuName(Function(List<String>) updateFn) {
    updateFn(_visibleMenuName ??= []);
  }

  bool hasVisibleMenuName() => _visibleMenuName != null;

  // "level" field.
  List<String>? _level;
  List<String> get level => _level ?? const [];
  set level(List<String>? val) => _level = val;

  void updateLevel(Function(List<String>) updateFn) {
    updateFn(_level ??= []);
  }

  bool hasLevel() => _level != null;

  static AdminRoleMenuStruct fromMap(Map<String, dynamic> data) =>
      AdminRoleMenuStruct(
        groupName: data['group_name'] as String?,
        employeeId: getDataList(data['employee_id']),
        visibleMenuName: getDataList(data['visible_menu_name']),
        level: getDataList(data['level']),
      );

  static AdminRoleMenuStruct? maybeFromMap(dynamic data) => data is Map
      ? AdminRoleMenuStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'group_name': _groupName,
        'employee_id': _employeeId,
        'visible_menu_name': _visibleMenuName,
        'level': _level,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'group_name': serializeParam(
          _groupName,
          ParamType.String,
        ),
        'employee_id': serializeParam(
          _employeeId,
          ParamType.String,
          isList: true,
        ),
        'visible_menu_name': serializeParam(
          _visibleMenuName,
          ParamType.String,
          isList: true,
        ),
        'level': serializeParam(
          _level,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static AdminRoleMenuStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdminRoleMenuStruct(
        groupName: deserializeParam(
          data['group_name'],
          ParamType.String,
          false,
        ),
        employeeId: deserializeParam<String>(
          data['employee_id'],
          ParamType.String,
          true,
        ),
        visibleMenuName: deserializeParam<String>(
          data['visible_menu_name'],
          ParamType.String,
          true,
        ),
        level: deserializeParam<String>(
          data['level'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'AdminRoleMenuStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AdminRoleMenuStruct &&
        groupName == other.groupName &&
        listEquality.equals(employeeId, other.employeeId) &&
        listEquality.equals(visibleMenuName, other.visibleMenuName) &&
        listEquality.equals(level, other.level);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([groupName, employeeId, visibleMenuName, level]);
}

AdminRoleMenuStruct createAdminRoleMenuStruct({
  String? groupName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdminRoleMenuStruct(
      groupName: groupName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdminRoleMenuStruct? updateAdminRoleMenuStruct(
  AdminRoleMenuStruct? adminRoleMenu, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    adminRoleMenu
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdminRoleMenuStructData(
  Map<String, dynamic> firestoreData,
  AdminRoleMenuStruct? adminRoleMenu,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (adminRoleMenu == null) {
    return;
  }
  if (adminRoleMenu.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && adminRoleMenu.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final adminRoleMenuData =
      getAdminRoleMenuFirestoreData(adminRoleMenu, forFieldValue);
  final nestedData =
      adminRoleMenuData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = adminRoleMenu.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdminRoleMenuFirestoreData(
  AdminRoleMenuStruct? adminRoleMenu, [
  bool forFieldValue = false,
]) {
  if (adminRoleMenu == null) {
    return {};
  }
  final firestoreData = mapToFirestore(adminRoleMenu.toMap());

  // Add any Firestore field values
  adminRoleMenu.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdminRoleMenuListFirestoreData(
  List<AdminRoleMenuStruct>? adminRoleMenus,
) =>
    adminRoleMenus
        ?.map((e) => getAdminRoleMenuFirestoreData(e, true))
        .toList() ??
    [];
