import 'package:flutter/material.dart';

import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const LoginPage({super.key, required this.onToggleTheme});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: widget.onToggleTheme,
                    icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                    tooltip: isDark ? 'Light Mode' : 'Dark Mode',
                  ),
                ),

                const Icon(Icons.account_circle, size: 100, color: Colors.pink),

                const SizedBox(height: 15),

                const Text(
                  'Profil Mahasiswa',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                const Text('Silakan login untuk melanjutkan'),

                const SizedBox(height: 30),

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email wajib diisi';
                    }

                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
                      return 'Format email tidak valid';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: passwordController,
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password wajib diisi';
                    }

                    if (value.length < 6) {
                      return 'Password minimal 6 karakter';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : login,
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Text('LOGIN'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
