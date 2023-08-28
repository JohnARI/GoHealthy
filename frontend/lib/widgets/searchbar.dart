import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.background,
            width: 1.0,
          ),
        ),
      ),
      child: SearchBar(
        elevation: const MaterialStatePropertyAll<double>(0),
        backgroundColor: MaterialStatePropertyAll<Color>(
          Theme.of(context).colorScheme.onPrimary,
        ),
        hintText: 'Look for...',
        trailing: const <Widget>[
          Icon(
            Icons.qr_code_scanner,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.photo_camera_rounded,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.format_list_bulleted_sharp,
          ),
        ],
      ),
    );
  }
}
