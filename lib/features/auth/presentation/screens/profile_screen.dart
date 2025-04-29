import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  String? _selectedGender;
  String? _profileImageUrl;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Handle image upload and update profile image URL
      setState(() {
        _profileImageUrl = image.path;
      });
    }
  }

  void _showGenderBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  'Select gender',
                  style: GoogleFonts.figtree(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildGenderOption('Male', '♂'),
            const SizedBox(height: 8),
            _buildGenderOption('Female', '♀'),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderOption(String gender, String symbol) {
    final isSelected = _selectedGender == gender;
    return InkWell(
      onTap: () {
        setState(() => _selectedGender = gender);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xFF5339AD) : const Color(0xFFD0D5DD),
          ),
        ),
        child: Row(
          children: [
            Text(
              symbol,
              style: TextStyle(
                fontSize: 20,
                color: isSelected ? const Color(0xFF5339AD) : const Color(0xFF1D2939),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              gender,
              style: GoogleFonts.figtree(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected ? const Color(0xFF5339AD) : const Color(0xFF1D2939),
              ),
            ),
            const Spacer(),
            if (isSelected)
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF5339AD),
                ),
                child: const Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
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
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1D2939)),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: _profileImageUrl != null
                      ? NetworkImage(_profileImageUrl!)
                      : null,
                  child: _profileImageUrl == null
                      ? const Icon(Icons.person, size: 50, color: Colors.grey)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: Color(0xFF5339AD),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
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
                  ),
                ),
                const SizedBox(width: 16),
                OutlinedButton.icon(
                  onPressed: () {
                    // Handle avatar change
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('Change avatar'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF5339AD),
                    side: const BorderSide(color: Color(0xFFD0D5DD)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildTextField(
              label: 'First name',
              controller: _firstNameController,
              hintText: 'First name',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Last name',
              controller: _lastNameController,
              hintText: 'Last name',
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gender',
                  style: GoogleFonts.figtree(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1D2939),
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: _showGenderBottomSheet,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFD0D5DD)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedGender ?? 'Select',
                          style: GoogleFonts.figtree(
                            fontSize: 14,
                            color: _selectedGender != null
                                ? const Color(0xFF1D2939)
                                : const Color(0xFF98A2B3),
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF667085),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.figtree(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1D2939),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.figtree(
              fontSize: 14,
              color: const Color(0xFF98A2B3),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF5339AD)),
            ),
          ),
        ),
      ],
    );
  }
}