import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wh_mobile/src/common/common.dart';
import 'package:wh_mobile/src/common/constants/height_spacer.dart';
import 'package:wh_mobile/src/features/authentication/domain/auth_request_model.dart';
import 'package:wh_mobile/src/features/authentication/presentation/controller/auth_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  UserRole _selectedRole = UserRole.customer; // Default role

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen<AsyncValue<AuthState>>(authControllerProvider, (_, state) {
      if (state.hasError && !state.isLoading) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(state.error.toString())));
      }
      
    });

    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Akun Baru'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Selamat Datang!', style: textTheme.headlineMedium),
            Text('Buat akun untuk memulai.', style: textTheme.bodyLarge),
            const HeightSpacer(height: 32),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            const HeightSpacer(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const HeightSpacer(height: 16),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const HeightSpacer(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const HeightSpacer(height: 24),
            Text('Saya mendaftar sebagai:', style: textTheme.titleMedium),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<UserRole>(
                    title: const Text('Konsumen'),
                    value: UserRole.customer,
                    groupValue: _selectedRole,
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedRole = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<UserRole>(
                    title: const Text('Pedagang'),
                    value: UserRole.merchant,
                    groupValue: _selectedRole,
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedRole = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const HeightSpacer(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: authState.isLoading
                    ? null
                    : () {
                        final request = RegisterRequest(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          phoneNumber: _phoneController.text,
                          role: _selectedRole,
                        );
                        ref
                            .read(authControllerProvider.notifier)
                            .register(request);
                      },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
                child: authState.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Daftar'),
              ),
            ),
            const HeightSpacer(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Sudah punya akun?'),
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Login di sini'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
