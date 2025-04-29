import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(
            icon: Icons.home,
            label: 'Home',
            isSelected: true,
            onTap: () {},
          ),
          _NavItem(
            icon: Icons.air,
            label: 'Lung',
            isSelected: false,
            onTap: () {},
          ),
          _NavItem(
            icon: Icons.nightlight_round,
            label: 'Sleep',
            isSelected: false,
            onTap: () {},
          ),
          _NavItem(
            icon: Icons.settings,
            label: 'Settings',
            isSelected: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF5339AD) : const Color(0xFF667085),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.figtree(
              fontSize: 12,
              color: isSelected ? const Color(0xFF5339AD) : const Color(0xFF667085),
            ),
          ),
        ],
      ),
    );
  }
}