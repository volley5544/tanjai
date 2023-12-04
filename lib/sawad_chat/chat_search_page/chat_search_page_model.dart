import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/request_manager.dart';

import 'chat_search_page_widget.dart' show ChatSearchPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChatSearchPageModel extends FlutterFlowModel<ChatSearchPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SearchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxController;
  String? Function(BuildContext, String?)? searchBoxControllerValidator;
  // Stores action output result for [Backend Call - API (getAllEmployeeAPI)] action in IconButton widget.
  ApiCallResponse? getEmployee;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? queryChatsUserA;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? queryChatsUserB;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? createChatsUserA;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? createChatsUserB;

  /// Query cache managers for this widget.

  final _chatProfileImageManager =
      FutureRequestManager<List<UserCustomRecord>>();
  Future<List<UserCustomRecord>> chatProfileImage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UserCustomRecord>> Function() requestFn,
  }) =>
      _chatProfileImageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChatProfileImageCache() => _chatProfileImageManager.clear();
  void clearChatProfileImageCacheKey(String? uniqueKey) =>
      _chatProfileImageManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    searchBoxFocusNode?.dispose();
    searchBoxController?.dispose();

    /// Dispose query cache managers for this widget.

    clearChatProfileImageCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
