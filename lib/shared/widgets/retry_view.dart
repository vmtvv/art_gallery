import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RetryView extends StatelessWidget {
  final Function() onPressed;
  final String? message;
  final String? buttonText;

  const RetryView(
      {super.key, required this.onPressed, this.message, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message ?? AppLocalizations.of(context)!.retryMessage),
        const SizedBox(height: 8),
        OutlinedButton(
          onPressed: onPressed,
          child: Text(buttonText ?? AppLocalizations.of(context)!.retryButton),
        ),
      ],
    );
  }
}
