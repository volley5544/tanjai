import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'login_screen1_widget.dart' show LoginScreen1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LoginScreen1Model extends FlutterFlowModel<LoginScreen1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'password อย่างน้อย 8 ตัว';
    }
    if (val.length > 20) {
      return 'password ไม่เกิน 20 ตัว';
    }

    return null;
  }

  // State field(s) for confirmpassword widget.
  FocusNode? confirmpasswordFocusNode;
  TextEditingController? confirmpasswordController;
  late bool confirmpasswordVisibility;
  String? Function(BuildContext, String?)? confirmpasswordControllerValidator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for idCard widget.
  FocusNode? idCardFocusNode;
  TextEditingController? idCardController;
  final idCardMask = MaskTextInputFormatter(mask: '#-####-#####-##-#');
  String? Function(BuildContext, String?)? idCardControllerValidator;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberController;
  String? Function(BuildContext, String?)? phonenumberControllerValidator;
  // State field(s) for licenseId widget.
  FocusNode? licenseIdFocusNode;
  TextEditingController? licenseIdController;
  String? Function(BuildContext, String?)? licenseIdControllerValidator;
  // Stores action output result for [Custom Action - createFirebase] action in Button widget.
  String? createFirebaseOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    confirmpasswordVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    confirmpasswordFocusNode?.dispose();
    confirmpasswordController?.dispose();

    nameFocusNode?.dispose();
    nameController?.dispose();

    idCardFocusNode?.dispose();
    idCardController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberController?.dispose();

    licenseIdFocusNode?.dispose();
    licenseIdController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
