import 'package:flutter/material.dart';
import 'package:marketos/features/profile/ui/widgets/profile_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.isDrawerOpened});

  final bool isDrawerOpened;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileCard(
          isDrawerOpened: isDrawerOpened,
        ),
      ],
    );
  }
}
