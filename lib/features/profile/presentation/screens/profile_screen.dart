import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/avatar_selection_bottom_sheet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ethnicityController = TextEditingController();
  final _birthDateController = TextEditingController();
  String? _selectedAvatar;
  String? _selectedGender;
  String? _selectedHeight;
  String? _selectedWeight;
  String? _selectedPredictionLibrary;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Handle image upload
    }
  }

  void _showAvatarSelection() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const AvatarSelectionBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
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
        title: Text(
          'Profile',
          style: GoogleFonts.figtree(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1D2939),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF5339AD),
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
                  const SizedBox(height: 12),
                  Text(
                    'Unknown',
                    style: GoogleFonts.figtree(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1D2939),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton.icon(
                        onPressed: _pickImage,
                        icon: const Icon(Icons.upload),
                        label: const Text('Upload photo'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF5339AD),
                          side: const BorderSide(color: Color(0xFFD0D5DD)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton.icon(
                        onPressed: _showAvatarSelection,
                        icon: const Icon(Icons.face),
                        label: const Text('Change avatar'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF5339AD),
                          side: const BorderSide(color: Color(0xFFD0D5DD)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              label: 'First name',
              controller: _firstNameController,
              hintText: 'First name',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Last name',
              controller: _lastNameController,
              hintText: 'Last name',
            ),
            const SizedBox(height: 16),
            CustomDropdown(
              label: 'Prediction library',
              value: _selectedPredictionLibrary,
              onChanged: (value) => setState(() => _selectedPredictionLibrary = value),
              items: const ['Library 1', 'Library 2', 'Library 3'],
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Ethnicity',
              controller: _ethnicityController,
              hintText: 'Enter ethnicity',
            ),
            const SizedBox(height: 16),
            CustomDropdown(
              label: 'Gender',
              value: _selectedGender,
              onChanged: (value) => setState(() => _selectedGender = value),
              items: const ['Male', 'Female', 'Other'],
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'I was born in*',
              controller: _birthDateController,
              hintText: 'Select date',
              suffixIcon: Icons.calendar_today,
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  _birthDateController.text = date.toString().split(' ')[0];
                }
              },
            ),
            const SizedBox(height: 16),
            CustomDropdown(
              label: 'Height',
              value: _selectedHeight,
              onChanged: (value) => setState(() => _selectedHeight = value),
              items: List.generate(
                231,
                (index) => '${index + 120} cm',
              ),
            ),
            const SizedBox(height: 16),
            CustomDropdown(
              label: 'Weight*',
              value: _selectedWeight,
              onChanged: (value) => setState(() => _selectedWeight = value),
              items: List.generate(
                151,
                (index) => '${index + 30} kg',
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle continue
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5339AD),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  elevation: 0,
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
}