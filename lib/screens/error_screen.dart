import 'package:flutter/material.dart';
import '../widgets/error_succes_widgets/error_screen_widget.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    this.errorMessage,
    super.key,
  });

  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ErrorScreenWidget(
        errorMessage: errorMessage,
      ),
    ));
  }
}
