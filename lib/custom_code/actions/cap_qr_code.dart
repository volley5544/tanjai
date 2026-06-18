// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:permission_handler/permission_handler.dart';

Future<String> capQrCode(BuildContext context, String? suffix, String? ref1,
    String? ref2, String? amount, String? taxId, bool? isShow) async {
  // Add your function code here!
  //var status = await Permission.manageExternalStorage.request();
  try {
    ScreenshotController screenshotController = ScreenshotController();
    await screenshotController
        .captureFromWidget(
      Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Container(
            margin: EdgeInsetsDirectional.only(top: 50, start: 12, end: 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 300.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (isShow!)
                              AutoSizeText(
                                ' *ใช้สำหรับชำระประกันครั้งแรกเท่านั้น',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Color(0xFFCC0000),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            if (isShow!)
                              AutoSizeText(
                                '**ห้ามนำ QR นี้ไปชำระค่างวดผ่อนชำระ',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Color(0xFFCC0000),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF204A77),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            'คิวอาร์โค้ด',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto Sans Thai',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 15,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    height: 230,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: BarcodeWidget(
                      data: functions.genQRCodePayment(
                          suffix!, ref1!, ref2!, amount!, taxId!)!,
                      barcode: Barcode.qrCode(),
                      width: 300,
                      height: 90,
                      color: FlutterFlowTheme.of(context).primaryText,
                      backgroundColor: Colors.transparent,
                      errorBuilder: (_context, _error) => SizedBox(
                        width: 300,
                        height: 90,
                      ),
                      drawText: false,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      '฿ ${functions.showNumberWithComma(amount!)}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Noto Sans Thai',
                            color: FlutterFlowTheme.of(context).error,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'R1: ${ref1!}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Noto Sans Thai',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    'R2: ${ref2!}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto Sans Thai',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    'คุณ ${FFAppState().insuranceInfoFirstName} ${FFAppState().insuranceInfoLastName}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto Sans Thai',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: AutoSizeText(
                    'คุณสามารถสแกนชำระค่าเบี้ยประกันผ่านโมบายแบงค์กิ้งของทุกธนาคาร',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto Sans Thai',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: AutoSizeText(
                    '***กรณีวันหยุด เสาร์-อาทิตย์ และนักขัตฤกษ์\nจะออกกรมธรรม์ในวันทำการถัดไป',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto Sans Thai',
                          color: Color(0xFFCC0000),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      delay: Duration(seconds: 1),
    )
        .then((capImage) async {
      DateTime currentDateTime = DateTime.now();
      final result1 = await ImageGallerySaverPlus.saveImage(
          Uint8List.fromList(capImage),
          quality: 100,
          name: "${currentDateTime}");
    });
    return 'บันทึกภาพ QR Code ลง Gallery สำเร็จ';
  } catch (e) {
    return e.toString();
  }
}
