import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:wh_mobile/src/common/constants/height_spacer.dart';
import 'package:wh_mobile/src/features/merchant/presentation/controller/merchant_profile_controller.dart';
import 'package:wh_mobile/src/utils/permission_utils.dart';

class CreateProfileScreen extends ConsumerStatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  ConsumerState<CreateProfileScreen> createState() =>
      _CreateProfileScreenState();
}

class _CreateProfileScreenState extends ConsumerState<CreateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _merchantNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController();

  Position? _currentPosition;
  bool _isGettingLocation = false;

  @override
  void dispose() {
    _merchantNameController.dispose();
    _descriptionController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {

    setState(() {
      _isGettingLocation = true;
    });

    try {
      final position = await PermissionUtils.getCurrentLocation();
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mendapatkan lokasi: ${e.toString()}')),
        );
      }
    } finally {
      setState(() {
        _isGettingLocation = false;
      });
    }
  }

  void _submitProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (_currentPosition == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap tentukan lokasi warung Anda.')),
      );
      return;
    }

    final success = await ref
        .read(merchantProfileControllerProvider.notifier)
        .createProfile(
          merchantName: _merchantNameController.text,
          description: _descriptionController.text,
          address: _addressController.text,
          latitude: _currentPosition!.latitude,
          longitude: _currentPosition!.longitude,
        );

    if (success && mounted) {
      context.go('/');
    } else if (mounted) {
      final error = ref.read(merchantProfileControllerProvider).error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan profil: ${error.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final profileState = ref.watch(merchantProfileControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lengkapi Profil Warung'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(
                'Informasi Usaha',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const HeightSpacer(height: 8),
              Text(
                'Data ini akan ditampilkan kepada pelanggan untuk menemukan warungmu.',
                style: textTheme.bodyMedium,
              ),
              const HeightSpacer(height: 24),

              // Nama Warung
              TextFormField(
                controller: _merchantNameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Warung/Toko',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => (value?.isEmpty ?? true)
                    ? 'Nama warung tidak boleh kosong'
                    : null,
              ),
              const HeightSpacer(height: 16),

              // Deskripsi
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Singkat (Opsional)',
                  hintText: 'Contoh: Warung makan masakan rumahan...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const HeightSpacer(height: 16),

              // Alamat
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Alamat Lengkap',
                  hintText: 'Jalan, nomor, kelurahan, dll.',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) => (value?.isEmpty ?? true)
                    ? 'Alamat tidak boleh kosong'
                    : null,
              ),
              const HeightSpacer(height: 24),

              // Lokasi di Peta
              Text(
                'Lokasi di Peta',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const HeightSpacer(height: 8),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _isGettingLocation
                          ? const Text('Mencari lokasi...')
                          : Text(
                              _currentPosition == null
                                  ? 'Lokasi belum diatur'
                                  : 'Lokasi berhasil didapat!',
                              style: TextStyle(
                                color: _currentPosition != null
                                    ? Colors.green.shade700
                                    : null,
                                fontWeight: _currentPosition != null
                                    ? FontWeight.bold
                                    : null,
                              ),
                            ),
                    ),
                    OutlinedButton(
                      onPressed: _isGettingLocation
                          ? null
                          : _getCurrentLocation,
                      child: const Text('Atur Lokasi'),
                    ),
                  ],
                ),
              ),

              const HeightSpacer(height: 48),

              // Tombol Simpan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: profileState.isLoading ? null : _submitProfile,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                  ),
                  child: profileState.isLoading
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        )
                      : const Text('Simpan Profil'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
