import 'package:flutter/material.dart';

class ImageStyles {
  static ImageStyles? _instance;
  ImageStyles._();

  static ImageStyles get i => _instance ??= ImageStyles._();

  String get linkContact => 'assets/images/link_contact.svg';
  String get emailContact => 'assets/images/email_contact.svg';
  String get whatsAppContact => 'assets/images/whats_app_contact.svg';
  String get logoApp => 'assets/images/logo_app.svg';
}

extension ImageStylesExtensions on BuildContext {
  ImageStyles get image => ImageStyles.i;
}
