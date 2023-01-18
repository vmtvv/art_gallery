import 'dart:math';

import 'package:flutter/material.dart';

class Flyout extends StatelessWidget {
  const Flyout({super.key, required this.builder});

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: 350,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 9.0,
                  offset: Offset(0, 2),
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                ),
              ],
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: builder(context),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future showModalFlyout({
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    constraints: BoxConstraints(
      maxWidth: min(MediaQuery.of(context).size.width, 500),
    ),
    builder: (context) => Flyout(builder: builder),
  );
}
