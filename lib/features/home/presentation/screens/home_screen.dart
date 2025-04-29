import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/date_selector.dart';
import '../widgets/health_card.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const DateSelector(),
                  const SizedBox(height: 24),
                  HealthCard(
                    title: 'Lung test',
                    value: '0%',
                    color: const Color(0xFFF3EBFF),
                    iconPath: 'assets/icons/lungs.png',
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  HealthCard(
                    title: 'Sleep score',
                    value: '0%',
                    color: const Color(0xFFF5F6F7),
                    iconPath: 'assets/icons/moon.png',
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  HealthCard(
                    title: 'Exercise',
                    value: '0%',
                    color: const Color(0xFFEBF6FF),
                    iconPath: 'assets/icons/exercise.png',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const BottomNavBar(),
          ],
        ),
      ),
    );
  }
}