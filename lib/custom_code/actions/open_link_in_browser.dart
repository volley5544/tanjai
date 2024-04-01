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

Future openLinkInBrowser(String? url) async {
  // Add your function code here!

  if (url == null) {
    throw 'URL is null';
  }

  final encodedUrl = Uri.encodeComponent(url);

  try {
    // Launch the URL and prompt the user to choose a browser or WebView
    await launch(
      encodedUrl,
      forceWebView: true,
      enableJavaScript: true,
    );
  } catch (e) {
    print('Error opening URL: $e');
    // Handle error if unable to open the URL
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
