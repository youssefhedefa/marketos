import 'package:flutter/material.dart';
import 'package:marketos/features/profile/ui/widgets/profile_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProfileCard(),
      ],
    );
  }
}
