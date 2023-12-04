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

import 'package:image/image.dart' as ui;
import 'dart:io';

Future<FFUploadedFile> addWatermark(
    FFUploadedFile? inputFile, String? currentTime) async {
  // Add your function code here!

  // Add your function code here!
  print(inputFile!.name);
  print(inputFile!.bytes);
  print(inputFile!.height);
  print(inputFile!.width);
  // Uint8List image = inputFile!.bytes as Uint8List;
  // print(image);
  // print('wow1');
  // File theOriginalImage = File.fromRawPath(image);
  // print('wow2');
  ui.Image originalImage = ui.decodeImage(
      inputFile!.bytes!)!; //ui.decodeImage(theOriginalImage.readAsBytesSync());
  //ui.Image? watermarkImage = ui.decodeImage(theWatermarkImage.readAsBytesSync());
  print('wow3');
  ui.drawString(originalImage!, currentTime!,
      font: ui.arial48,
      x: (originalImage!.width * 0.70).round(),
      y: (originalImage!.height * 0.85).round());
  print('wow4');

  //Uint8List finalImage = Uint8List.fromList(ui.encodePng(originalImage!));

  // if (finalImage.lengthInBytes > 1024 * 1024) {
  //  finalImage = _resizeImage(finalImage, 1024 * 1024); // 1MB
  // }
  //Uint8List modifiedImageBytes = Uint8List.fromList(img.encodePng(image));

  // List<int> wmImage = ui.encodeJpg(originalImage);
  print('wow5');
  // File _watermarkedImage = File.fromRawPath(Uint8List.fromList(wmImage));
  print('wow6');
  // FFUploadedFile watermarkedImage = new FFUploadedFile(
  //   name: "wow image",
  //   bytes: _watermarkedImage.readAsBytesSync(),
  // );
  FFUploadedFile modifiedImageBytes = new FFUploadedFile(
    bytes: Uint8List.fromList(ui.encodePng(originalImage!)),
    name: 'wow image',
  );
  print('wow7');
  print(modifiedImageBytes.name);
  print(modifiedImageBytes.bytes);
  print(modifiedImageBytes.height);
  print(modifiedImageBytes.width);
  return modifiedImageBytes;
}

//Uint8List _resizeImage(Uint8List imageBytes, int maxSize) {
// ui.Image image = ui.decodeImage(imageBytes)!;

// Calculate the scaling factor to reduce the image size
//double scaleFactor = imageBytes.lengthInBytes / maxSize;

// Resize the image
//ui.Image resizedImage =
//  ui.copyResize(image, width: (image.width / scaleFactor).round());

//return Uint8List.fromList(ui.encodePng(resizedImage));
//}
