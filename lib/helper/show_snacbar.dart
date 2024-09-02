
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(BuildContext context, String massege) {
 return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(massege),
    ),
  );
}