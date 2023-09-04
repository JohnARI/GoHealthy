import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    super.key,
    required this.imageWidget,
    required this.titleWidget,
    required this.formWidget,
    required this.buttonWidget,
    required this.contentWidgets,
  });

  final Widget imageWidget;
  final String titleWidget;
  final Widget formWidget;
  final Widget buttonWidget;

  final List<Widget> contentWidgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        imageWidget,
        Text(titleWidget, style: Theme.of(context).textTheme.titleLarge),
        formWidget,
        buttonWidget,
        ...contentWidgets,
      ],
    );
  }
}
