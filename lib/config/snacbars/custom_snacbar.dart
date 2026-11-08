import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

showCustomSnacbar(
  context, {
  required String message,
  SnacbarType type = SnacbarType.info,
}) {
  dynamic snacbarWidget;

  switch (snacbarWidget) {
    case SnacbarType.success:
      snacbarWidget = CustomSnackBar.success(message: message);
      break;
    case SnacbarType.error:
      snacbarWidget = CustomSnackBar.error(message: message);
      break;
    default:
      snacbarWidget = CustomSnackBar.info(message: message);
      break;
  }
  showTopSnackBar(Overlay.of(context), snacbarWidget);
}

enum SnacbarType { success, error, info }
