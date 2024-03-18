import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'blank_list_com_model.dart';
export 'blank_list_com_model.dart';

class BlankListComWidget extends StatefulWidget {
  const BlankListComWidget({super.key});

  @override
  State<BlankListComWidget> createState() => _BlankListComWidgetState();
}

class _BlankListComWidgetState extends State<BlankListComWidget> {
  late BlankListComModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlankListComModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        'ไม่พบข้อมูลที่ค้นหา',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Noto Sans Thai',
              fontSize: 18.0,
            ),
      ),
    );
  }
}
