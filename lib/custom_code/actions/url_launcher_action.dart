// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent_plus/android_intent.dart';

Future urlLauncherAction(String? urlLink, String? platform) async {
  // Add your function code here!
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
  } else {
    await launchUrl(
        Uri.parse('https://apps.apple.com/us/app/google-chrome/id535886823'),
        mode: LaunchMode.externalApplication);
  }
}
