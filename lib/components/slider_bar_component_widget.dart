import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'slider_bar_component_model.dart';
export 'slider_bar_component_model.dart';

class SliderBarComponentWidget extends StatefulWidget {
  const SliderBarComponentWidget({super.key});

  @override
  State<SliderBarComponentWidget> createState() =>
      _SliderBarComponentWidgetState();
}

class _SliderBarComponentWidgetState extends State<SliderBarComponentWidget> {
  late SliderBarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SliderBarComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 4),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'เลือกราคาเบี้ยประกันต่ำสุด - สูงสุด',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Noto Sans Thai',
                      color: Color(0xFF424242),
                      fontSize: 15,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 120,
          child: custom_widgets.RangeSliderWidget(
            width: double.infinity,
            height: 120,
            minRange: FFAppState().sliderMinGrossTotal,
            maxRange: FFAppState().sliderMaxGrossTotal,
            activeColor: Color(0xFFDB771B),
            inactiveColors: FlutterFlowTheme.of(context).secondaryText,
            overlayColor: Color(0xFFFFBB7C),
            startValue: FFAppState().sliderMinGrossTotal,
            endValue: FFAppState().sliderMaxGrossTotal,
            step: '500',
            typeName: 'ราคาเบี้ย',
          ),
        ),
      ],
    );
  }
}
