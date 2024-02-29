import 'package:flutter/material.dart';

class ControllerStorage {
  static late TextEditingController _nameController;

  static void setController(TextEditingController controller) {
    _nameController = controller;
  }

  static TextEditingController getController() {
    return _nameController;
  }
}
