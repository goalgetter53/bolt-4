import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Log in',
                style: GoogleFonts.figtree(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1D2939),
                ),
              ),
              const SizedBox(height: 11),
              Text(
                'Access your account and stay connected.',
                style: GoogleFonts.figtree(
                  fontSize: 16,
                  color: const Color(0xFF667085),
                ),
              ),
              const SizedBox(height: 32),
              _buildInputField(
                label: 'Email',
                controller: _emailController,
                hintText: 'Enter your email address',
              ),
              const SizedBox(height: 16),
              _buildInputField(
                label: 'Password',
                controller: _passwordController,
                hintText: 'Input password',
                isPassword: true,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() => _rememberMe = value ?? false);
                        },
                        activeColor: const Color(0xFF51BC6F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Text(
                        'Remember me',
                        style: GoogleFonts.figtree(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF1D2939),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.figtree(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1D2939),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5339AD),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  child: Text(
                    'Log in',
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
                    child: Divider(
                      color: Color(0xFFEAECF0),
                      thickness: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'or',
                      style: GoogleFonts.figtree(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF667085),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Color(0xFFEAECF0),
                      thickness: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(
                      color: Color(0xFFD0D5DD),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://www.google.com/favicon.ico',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Continue with Google',
                        style: GoogleFonts.figtree(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1D2939),
                        ),
                      ),
                    ],
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
                    letterSpacing: 0.01,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do not have an Account?',
                    style: GoogleFonts.figtree(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF1D2939),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign up',
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
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
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
          obscureText: isPassword,
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
            suffixIcon: isPassword
                ? IconButton(
                    icon: const Icon(
                      Icons.visibility_off,
                      color: Color(0xFF667085),
                    ),
                    onPressed: () {},
                  )
                : null,
          ),
        ),
      ],
    );
  }
}