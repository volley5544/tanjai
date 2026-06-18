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

import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent_plus/android_intent.dart';

Future<void> urlLauncherActionSafari(String? urlLink, String? platform) async {
  if (platform == 'android') {
    try {
      AndroidIntent intent = AndroidIntent(
        action: 'android.intent.action.VIEW',
        data: urlLink!,
        package: 'com.android.chrome', // Specify Chrome package
        arguments: <String, dynamic>{
          'forceChrome': true, // Force open in Chrome
        },
      );
      await intent.launch();
    } catch (e) {
      print(e.toString());
    }
  } else if (platform == 'ios') {
    // On iOS, you can specify to open in Safari directly.
    final Uri uri = Uri.parse(urlLink!);
    if (await canLaunch(uri.toString())) {
      await launch(
        uri.toString(),
        forceSafariVC:
            false, // This ensures it opens in Safari, not in a web view.
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $urlLink';
    }
  } else {
    // If the platform is neither Android nor iOS, you can define fallback behavior.
    await launchUrl(
      Uri.parse(urlLink!), // Ensure urlLink is non-null and valid
      mode: LaunchMode.externalApplication,
    );
  }
}
