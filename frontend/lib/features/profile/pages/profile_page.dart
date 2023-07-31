import 'package:flutter/material.dart';

import '../../../widgets/card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppCard(
            child: Text('Profile Page'),
        ),
      ),
    );
  }
}