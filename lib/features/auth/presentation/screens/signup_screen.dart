import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../application/auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _notARobot = false;
  bool _legalAge = false;
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      try {
        // Handle sign up logic
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign up',
                  style: GoogleFonts.figtree(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1D2939),
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  'Create an account and start your journey.',
                  style: GoogleFonts.figtree(
                    fontSize: 16,
                    color: const Color(0xFF667085),
                  ),
                ),
                const SizedBox(height: 32),
                _buildTextField(
                  label: 'Email',
                  controller: _emailController,
                  hintText: 'Enter your email address',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'Password',
                  controller: _passwordController,
                  hintText: 'Create a password',
                  isPassword: true,
                  isPasswordVisible: _isPasswordVisible,
                  onTogglePasswordVisibility: () {
                    setState(() => _isPasswordVisible = !_isPasswordVisible);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildCheckbox(
                  value: _rememberMe,
                  onChanged: (value) => setState(() => _rememberMe = value ?? false),
                  label: 'Remember me',
                ),
                _buildCheckbox(
                  value: _notARobot,
                  onChanged: (value) => setState(() => _notARobot = value ?? false),
                  label: "I'm not a robot",
                ),
                _buildCheckbox(
                  value: _legalAge,
                  onChanged: (value) => setState(() => _legalAge = value ?? false),
                  label: 'I confirm that I am of legal age',
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleSignUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5339AD),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      disabledBackgroundColor: const Color(0xFF5339AD).withOpacity(0.5),
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
                            'Sign up',
                            style: GoogleFonts.figtree(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(color: Color(0xFFEAECF0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'or',
                        style: GoogleFonts.figtree(
                          fontSize: 16,
                          color: const Color(0xFF667085),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(color: Color(0xFFEAECF0)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Handle Google sign up
                    },
                    icon: Image.network(
                      'https://www.google.com/favicon.ico',
                      width: 24,
                      height: 24,
                    ),
                    label: Text(
                      'Google sign-up',
                      style: GoogleFonts.figtree(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1D2939),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: Color(0xFFD0D5DD)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    'By signing up, you agree to our Terms of Service and Privacy Policy, ensuring your information is protected.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.figtree(
                      fontSize: 12,
                      color: const Color(0xFF667085),
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: GoogleFonts.figtree(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1D2939),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/auth/login');
                      },
                      child: Text(
                        'Log in',
                        style: GoogleFonts.figtree(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF5339AD),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    bool? isPasswordVisible,
    VoidCallback? onTogglePasswordVisibility,
    String? Function(String?)? validator,
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
        TextFormField(
          controller: controller,
          obscureText: isPassword && !(isPasswordVisible ?? false),
          keyboardType: keyboardType,
          validator: validator,
          style: GoogleFonts.figtree(
            fontSize: 14,
            color: const Color(0xFF1D2939),
          ),
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
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      isPasswordVisible ?? false
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFF667085),
                    ),
                    onPressed: onTogglePasswordVisibility,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox({
    required bool value,
    required ValueChanged<bool?> onChanged,
    required String label,
  }) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF51BC6F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Text(
          label,
          style: GoogleFonts.figtree(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1D2939),
          ),
        ),
      ],
    );
  }
}