import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleRestore() async {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email address')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      // Handle password recovery logic
      await Future.delayed(const Duration(seconds: 2)); // Simulated API call
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email sent')),
      );
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
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
          'Password recovery',
          style: GoogleFonts.figtree(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1D2939),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot password',
                style: GoogleFonts.figtree(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1D2939),
                ),
              ),
              const SizedBox(height: 11),
              Text(
                "We've got your back. Enter your email to reset your password.",
                style: GoogleFonts.figtree(
                  fontSize: 16,
                  color: const Color(0xFF667085),
                ),
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: GoogleFonts.figtree(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1D2939),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your email address',
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
                        borderSide: const BorderSide(color: Color(0xFF51BC6F)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleRestore,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF51BC6F),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                    disabledBackgroundColor: const Color(0xFF51BC6F).withOpacity(0.5),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          'Restore',
                          style: GoogleFonts.figtree(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Navigate to Terms of Service
                      },
                      child: Text(
                        'Terms of Service',
                        style: GoogleFonts.figtree(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF667085),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to Privacy Policy
                      },
                      child: Text(
                        'Privacy Policy',
                        style: GoogleFonts.figtree(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF667085),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}