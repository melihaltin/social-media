import 'package:flutter/material.dart';
import '../widgets/error_succes_widgets/success_screen_widget.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    this.successMessage,
    super.key,
  });

  final String? successMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SuccessScreenWidget(
        successMessage: successMessage,
      ),
    ));
  }
}
