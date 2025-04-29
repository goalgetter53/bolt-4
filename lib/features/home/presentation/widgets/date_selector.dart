import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final dateFormat = DateFormat('EEEE, d\'th\' MMM yyyy');
    final formattedDate = dateFormat.format(today);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              formattedDate,
              style: GoogleFonts.figtree(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1D2939),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {},
                  color: const Color(0xFF5339AD),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {},
                  color: const Color(0xFF5339AD),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              final date = today.add(Duration(days: index - 3));
              final isToday = date.day == today.day;
              
              return Container(
                width: 64,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: isToday ? const Color(0xFF5339AD) : Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: const Color(0xFFE4E7EC),
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date.day.toString(),
                      style: GoogleFonts.figtree(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: isToday ? Colors.white : const Color(0xFF1D2939),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('E').format(date),
                      style: GoogleFonts.figtree(
                        fontSize: 16,
                        color: isToday ? Colors.white : const Color(0xFF667085),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}