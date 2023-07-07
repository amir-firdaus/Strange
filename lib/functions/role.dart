import 'dart:math' as math;
import 'package:flutter/material.dart';

bool visibilityByRole(
  String widgetIsFor,
  String role,
) {
  bool makeVisible = false;

  //Set widget visibility rules per user role
  switch (role) {
    case 'Admin':
      if (widgetIsFor == 'Admin') {
        makeVisible = true;
      }
      if (widgetIsFor == 'Student') {
        makeVisible = true;
      }
      break;

    case 'Student':
      if (widgetIsFor == 'Student') {
        makeVisible = true;
      }
      break;
  }

  return makeVisible;
}