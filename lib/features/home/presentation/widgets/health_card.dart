import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final String iconPath;
  final VoidCallback onTap;

  const HealthCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.figtree(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1D2939),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: GoogleFonts.figtree(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1D2939),
                ),
              ),
              TextButton(
                onPressed: onTap,
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF1D2939),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  'Details',
                  style: GoogleFonts.figtree(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Image.asset(
            iconPath,
            width: 80,
            height: 80,
          ),
        ],
      ),
    );
  }
}