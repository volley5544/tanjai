import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'chat_search_page_model.dart';
export 'chat_search_page_model.dart';

class ChatSearchPageWidget extends StatefulWidget {
  const ChatSearchPageWidget({Key? key}) : super(key: key);

  @override
  _ChatSearchPageWidgetState createState() => _ChatSearchPageWidgetState();
}

class _ChatSearchPageWidgetState extends State<ChatSearchPageWidget> {
  late ChatSearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatSearchPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChatSearchPage'});
    _model.searchBoxController ??= TextEditingController();
    _model.searchBoxFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFFF6500),
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          title: Text(
            'ค้นหาคู่แชท',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Noto Sans Thai',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.searchBoxController,
                              focusNode: _model.searchBoxFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: 'ชื่อ,รหัสพนักงาน...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.searchBoxControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.white,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 45.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: FaIcon(
                        FontAwesomeIcons.search,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        var _shouldSetState = false;
                        HapticFeedback.mediumImpact();
                        if (!(_model.searchBoxController.text != null &&
                            _model.searchBoxController.text != '')) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                  child: AlertDialog(
                                content: Text(
                                    'กรุณาใส่ชื่อหรือรหัสพนักงานเพื่อค้นหา'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              ));
                            },
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        }
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                                child: GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height: double.infinity,
                                  child: LoadingSceneWidget(),
                                ),
                              ),
                            ));
                          },
                        ).then((value) => safeSetState(() {}));

                        _model.getEmployee = await GetAllEmployeeAPICall.call(
                          token: FFAppState().accessToken,
                          apiUrl: FFAppState().apiURLLocalState,
                          searchKeyname: _model.searchBoxController.text,
                        );
                        _shouldSetState = true;
                        if ((_model.getEmployee?.statusCode ?? 200) != 200) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                  child: AlertDialog(
                                content: Text(
                                    'พบข้อผิดพลาดConnection (${(_model.getEmployee?.statusCode ?? 200).toString()})'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              ));
                            },
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        }
                        if (GetAllEmployeeAPICall.statusLayer2(
                              (_model.getEmployee?.jsonBody ?? ''),
                            ) !=
                            200) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                  child: AlertDialog(
                                content: Text(
                                    'พบข้อผิดพลาด (${GetAllEmployeeAPICall.statusLayer2(
                                  (_model.getEmployee?.jsonBody ?? ''),
                                ).toString()})'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              ));
                            },
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        }
                        Navigator.pop(context);
                        if (_shouldSetState) setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              if (((_model.getEmployee?.statusCode ?? 200) == 200) &&
                  (GetAllEmployeeAPICall.statusLayer2(
                        (_model.getEmployee?.jsonBody ?? ''),
                      ) ==
                      200))
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final employeeListItem =
                          (GetAllEmployeeAPICall.employeeId(
                                (_model.getEmployee?.jsonBody ?? ''),
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList()
                                  ?.toList() ??
                              [];
                      return ListView.builder(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          12.0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: employeeListItem.length,
                        itemBuilder: (context, employeeListItemIndex) {
                          final employeeListItemItem =
                              employeeListItem[employeeListItemIndex];
                          return FutureBuilder<List<UserCustomRecord>>(
                            future: _model.chatProfileImage(
                              uniqueQueryKey: (GetAllEmployeeAPICall.employeeId(
                                (_model.getEmployee?.jsonBody ?? ''),
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList()[employeeListItemIndex],
                              requestFn: () => queryUserCustomRecordOnce(
                                queryBuilder: (userCustomRecord) =>
                                    userCustomRecord.where(
                                  'employee_id',
                                  isEqualTo: (GetAllEmployeeAPICall.employeeId(
                                            (_model.getEmployee?.jsonBody ??
                                                ''),
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList()[employeeListItemIndex] !=
                                          ''
                                      ? (GetAllEmployeeAPICall.employeeId(
                                          (_model.getEmployee?.jsonBody ?? ''),
                                        ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList()[employeeListItemIndex]
                                      : null,
                                ),
                                singleRecord: true,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<UserCustomRecord>
                                  containerUserCustomRecordList =
                                  snapshot.data!;
                              final containerUserCustomRecord =
                                  containerUserCustomRecordList.isNotEmpty
                                      ? containerUserCustomRecordList.first
                                      : null;
                              return Container(
                                width: double.infinity,
                                height: 80.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 2.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var _shouldSetState = false;
                                      HapticFeedback.mediumImpact();
                                      if (!(containerUserCustomRecord !=
                                          null)) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                                child: AlertDialog(
                                              content: Text(
                                                  'ไม่พบบุคคลนี้ในระบบอรุณสวัสดิ์ ไม่สามารถเริ่มแชทได้'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ));
                                          },
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                      _model.queryChatsUserA =
                                          await queryChatsRecordOnce(
                                        queryBuilder: (chatsRecord) =>
                                            chatsRecord
                                                .where(
                                                  'user_a',
                                                  isEqualTo:
                                                      FFAppState().userRef,
                                                )
                                                .where(
                                                  'user_b',
                                                  isEqualTo:
                                                      containerUserCustomRecord
                                                          ?.reference,
                                                ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;
                                      _model.queryChatsUserB =
                                          await queryChatsRecordOnce(
                                        queryBuilder: (chatsRecord) =>
                                            chatsRecord
                                                .where(
                                                  'user_a',
                                                  isEqualTo:
                                                      containerUserCustomRecord
                                                          ?.reference,
                                                )
                                                .where(
                                                  'user_b',
                                                  isEqualTo:
                                                      FFAppState().userRef,
                                                ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;
                                      if (!(_model.queryChatsUserA != null)) {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                                child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height: double.infinity,
                                                  child: LoadingSceneWidget(),
                                                ),
                                              ),
                                            ));
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        var chatsRecordReference1 =
                                            ChatsRecord.collection.doc();
                                        await chatsRecordReference1
                                            .set(createChatsRecordData(
                                          userA: FFAppState().userRef,
                                          userB: containerUserCustomRecord
                                              ?.reference,
                                          userAName:
                                              FFAppState().profileFullName,
                                          userANickname:
                                              FFAppState().userNickname,
                                          userAProfileImage:
                                              FFAppState().profileImage,
                                          userAEmployeeId:
                                              FFAppState().employeeID,
                                          userBName: (GetAllEmployeeAPICall
                                                  .fullname(
                                            (_model.getEmployee?.jsonBody ??
                                                ''),
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList()[employeeListItemIndex],
                                          userBNickname: 'ชื่อเล่น',
                                          userBEmployeeId:
                                              (GetAllEmployeeAPICall.employeeId(
                                            (_model.getEmployee?.jsonBody ??
                                                ''),
                                          ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()[
                                                  employeeListItemIndex],
                                          userBProfileImage:
                                              containerUserCustomRecord
                                                  ?.imgProfile,
                                        ));
                                        _model.createChatsUserA =
                                            ChatsRecord.getDocumentFromData(
                                                createChatsRecordData(
                                                  userA: FFAppState().userRef,
                                                  userB:
                                                      containerUserCustomRecord
                                                          ?.reference,
                                                  userAName: FFAppState()
                                                      .profileFullName,
                                                  userANickname:
                                                      FFAppState().userNickname,
                                                  userAProfileImage:
                                                      FFAppState().profileImage,
                                                  userAEmployeeId:
                                                      FFAppState().employeeID,
                                                  userBName:
                                                      (GetAllEmployeeAPICall
                                                                  .fullname(
                                                    (_model.getEmployee
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList()[
                                                          employeeListItemIndex],
                                                  userBNickname: 'ชื่อเล่น',
                                                  userBEmployeeId:
                                                      (GetAllEmployeeAPICall
                                                                  .employeeId(
                                                    (_model.getEmployee
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList()[
                                                          employeeListItemIndex],
                                                  userBProfileImage:
                                                      containerUserCustomRecord
                                                          ?.imgProfile,
                                                ),
                                                chatsRecordReference1);
                                        _shouldSetState = true;
                                        if (!(_model.queryChatsUserB != null)) {
                                          var chatsRecordReference2 =
                                              ChatsRecord.collection.doc();
                                          await chatsRecordReference2
                                              .set(createChatsRecordData(
                                            userA: containerUserCustomRecord
                                                ?.reference,
                                            userB: FFAppState().userRef,
                                            userAName:
                                                (GetAllEmployeeAPICall.fullname(
                                              (_model.getEmployee?.jsonBody ??
                                                  ''),
                                            ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()[
                                                    employeeListItemIndex],
                                            userANickname: 'ชื่อเล่น',
                                            userAProfileImage:
                                                containerUserCustomRecord
                                                    ?.imgProfile,
                                            userAEmployeeId:
                                                (GetAllEmployeeAPICall
                                                            .employeeId(
                                              (_model.getEmployee?.jsonBody ??
                                                  ''),
                                            ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()[
                                                    employeeListItemIndex],
                                            userBName:
                                                FFAppState().profileFullName,
                                            userBNickname:
                                                FFAppState().userNickname,
                                            userBEmployeeId:
                                                FFAppState().employeeID,
                                            userBProfileImage:
                                                FFAppState().profileImage,
                                          ));
                                          _model.createChatsUserB =
                                              ChatsRecord.getDocumentFromData(
                                                  createChatsRecordData(
                                                    userA:
                                                        containerUserCustomRecord
                                                            ?.reference,
                                                    userB: FFAppState().userRef,
                                                    userAName: (GetAllEmployeeAPICall
                                                                .fullname(
                                                      (_model.getEmployee
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) as List)
                                                            .map<String>((s) =>
                                                                s.toString())
                                                            .toList()[
                                                        employeeListItemIndex],
                                                    userANickname: 'ชื่อเล่น',
                                                    userAProfileImage:
                                                        containerUserCustomRecord
                                                            ?.imgProfile,
                                                    userAEmployeeId:
                                                        (GetAllEmployeeAPICall
                                                                    .employeeId(
                                                      (_model.getEmployee
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList()[
                                                            employeeListItemIndex],
                                                    userBName: FFAppState()
                                                        .profileFullName,
                                                    userBNickname: FFAppState()
                                                        .userNickname,
                                                    userBEmployeeId:
                                                        FFAppState().employeeID,
                                                    userBProfileImage:
                                                        FFAppState()
                                                            .profileImage,
                                                  ),
                                                  chatsRecordReference2);
                                          _shouldSetState = true;
                                        }
                                        Navigator.pop(context);
                                      }

                                      context.pushNamed(
                                        'ChattingPage',
                                        queryParameters: {
                                          'userBProfileImage': serializeParam(
                                            containerUserCustomRecord
                                                ?.imgProfile,
                                            ParamType.String,
                                          ),
                                          'userBDocRef': serializeParam(
                                            containerUserCustomRecord
                                                ?.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'userBName': serializeParam(
                                            (GetAllEmployeeAPICall.fullname(
                                              (_model.getEmployee?.jsonBody ??
                                                  ''),
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()[
                                                employeeListItemIndex],
                                            ParamType.String,
                                          ),
                                          'userBNickname': serializeParam(
                                            'ชื่อเล่น',
                                            ParamType.String,
                                          ),
                                          'userBEmployeeId': serializeParam(
                                            (GetAllEmployeeAPICall.employeeId(
                                              (_model.getEmployee?.jsonBody ??
                                                  ''),
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()[
                                                employeeListItemIndex],
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );

                                      if (_shouldSetState) setState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0.0,
                                            color: Color(0xFFDBE2E7),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Container(
                                                      width: 70.0,
                                                      height: 70.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl: containerUserCustomRecord !=
                                                                null
                                                            ? containerUserCustomRecord!
                                                                .imgProfile
                                                            : 'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        '${(GetAllEmployeeAPICall.fullname(
                                                                          (_model.getEmployee?.jsonBody ??
                                                                              ''),
                                                                        ) as List).map<String>((s) => s.toString()).toList()[employeeListItemIndex]} (${(GetAllEmployeeAPICall.branchCode(
                                                                          (_model.getEmployee?.jsonBody ??
                                                                              ''),
                                                                        ) as List).map<String>((s) => s.toString()).toList()[employeeListItemIndex]})',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'รหัสพนักงาน : ${(GetAllEmployeeAPICall.employeeId(
                                                                          (_model.getEmployee?.jsonBody ??
                                                                              ''),
                                                                        ) as List).map<String>((s) => s.toString()).toList()[employeeListItemIndex]}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      (GetAllEmployeeAPICall
                                                                              .workPosition(
                                                                        (_model.getEmployee?.jsonBody ??
                                                                            ''),
                                                                      ) as List)
                                                                          .map<String>((s) => s
                                                                              .toString())
                                                                          .toList()[
                                                                              employeeListItemIndex]
                                                                          .maybeHandleOverflow(
                                                                              maxChars: 50),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans Thai',
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .arrow_forward_ios_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
