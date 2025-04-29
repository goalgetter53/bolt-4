import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarSelectionBottomSheet extends StatelessWidget {
  const AvatarSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFEAECF0)),
                    ),
                    child: const Icon(Icons.arrow_back, color: Color(0xFF1D2939), size: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 8),
                Text(
                  'Select avatar',
                  style: GoogleFonts.figtree(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1D2939),
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            padding: const EdgeInsets.all(16),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: List.generate(
              6,
              (index) => GestureDetector(
                onTap: () {
                  // Handle avatar selection
                  Navigator.pop(context, index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFEAECF0),
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://via.placeholder.com/100',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}