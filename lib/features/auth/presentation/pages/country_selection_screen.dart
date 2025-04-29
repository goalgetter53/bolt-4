import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flag/flag.dart';
import 'package:go_router/go_router.dart';

class CountryOption {
  final String name;
  final String countryCode;
  const CountryOption({required this.name, required this.countryCode});
}

class CountrySelectionScreen extends StatefulWidget {
  const CountrySelectionScreen({super.key});

  @override
  State<CountrySelectionScreen> createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String? selectedCountry;
  final TextEditingController _searchController = TextEditingController();
  List<CountryOption> filteredCountries = [];
  
  final List<CountryOption> countries = [
    const CountryOption(name: "Afghanistan", countryCode: "AF"),
    const CountryOption(name: "Albania", countryCode: "AL"),
    const CountryOption(name: "Algeria", countryCode: "DZ"),
    const CountryOption(name: "Angola", countryCode: "AO"),
    const CountryOption(name: "Argentina", countryCode: "AR"),
    const CountryOption(name: "Armenia", countryCode: "AM"),
    const CountryOption(name: "Australia", countryCode: "AU"),
    // Add more countries as needed
  ];

  @override
  void initState() {
    super.initState();
    filteredCountries = List.from(countries);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCountries = countries.where((country) {
        return country.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select country or Region',
                    style: GoogleFonts.figtree(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1D2939),
                    ),
                  ),
                  const SizedBox(height: 11),
                  Text(
                    'Available cloud services are based on the country and region you select.',
                    style: GoogleFonts.figtree(
                      fontSize: 16,
                      color: const Color(0xFF667085),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search country',
                  hintStyle: GoogleFonts.figtree(
                    fontSize: 14,
                    color: const Color(0xFF98A2B3),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xFFD0D5DD),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xFFD0D5DD),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F4F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: filteredCountries.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Color(0xFFEAECF0),
                    height: 1,
                    thickness: 1,
                  ),
                  itemBuilder: (context, index) {
                    final country = filteredCountries[index];
                    final isSelected = selectedCountry == country.name;
                    
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedCountry = country.name;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Flag.fromString(
                                      country.countryCode,
                                      height: 24,
                                      width: 24,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  country.name,
                                  style: GoogleFonts.figtree(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF1D2939),
                                  ),
                                ),
                              ],
                            ),
                            _buildRadioButton(isSelected),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: selectedCountry != null
                    ? () => context.go('/auth/login')
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5339AD),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  elevation: selectedCountry != null ? 1 : 0,
                  shadowColor: Colors.black.withOpacity(0.05),
                  disabledBackgroundColor: const Color(0xFF5339AD).withOpacity(0.5),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.figtree(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton(bool isSelected) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? const Color(0xFF231849) : const Color(0xFFD0D5DD),
          width: 1.5,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF231849),
                ),
              ),
            )
          : null,
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }
}