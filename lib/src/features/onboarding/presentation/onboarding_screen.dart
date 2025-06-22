import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wh_mobile/src/common/common.dart';

class OnboardingPageData {
  final String imagePath;
  final String title;
  final String subtitle;

  const OnboardingPageData({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });
}

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  // Daftar konten untuk setiap halaman onboarding
  final List<OnboardingPageData> _pages = [
    const OnboardingPageData(
      imagePath: 'assets/onboarding/onboarding-1.png',
      title: 'Selamatkan Makanan Lezat',
      subtitle:
          'Temukan makanan berkualitas dari warung favoritmu dengan harga spesial sebelum terbuang.',
    ),
    const OnboardingPageData(
      imagePath: 'assets/onboarding/onboarding-2.png',
      title: 'Bantu UMKM Lokal',
      subtitle:
          'Setiap pembelianmu berarti dukungan nyata bagi pedagang kecil untuk terus berkembang.',
    ),
    const OnboardingPageData(
      imagePath: 'assets/onboarding/onboarding-3.png',
      title: 'Makan Enak, Harga Hemat',
      subtitle:
          'Jelajahi berbagai pilihan kuliner terjangkau di sekitarmu. Praktis dan ramah di kantong.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onFinish() {
    // Navigasi ke halaman login/register setelah onboarding selesai
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            // Konten slide yang bisa di-swipe
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (_, index) {
                final page = _pages[index];
                // Setiap halaman adalah Stack untuk menumpuk gambar dan teks
                return Stack(
                  children: [
                    // 1. Gambar sebagai background
                    Image.asset(
                      page.imagePath,
                      // height: double.infinity,
                      // width: double.infinity,
                      fit: BoxFit.cover, // Memastikan gambar menutupi layar
                    ),
                    // 2. Lapisan gradien untuk keterbacaan teks
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.6, 1.0],
                        ),
                      ),
                    ),
                    // 3. Konten teks di atas gambar dan gradien
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.end, // Posisikan di bawah
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            page.title,
                            textAlign: TextAlign.left,
                            style: textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Ubah warna teks jadi putih
                            ),
                          ),
                          const HeightSpacer(height: 16),
                          Text(
                            page.subtitle,
                            textAlign: TextAlign.left,
                            style: textTheme.bodyLarge?.copyWith(
                              color: Colors.white.withOpacity(
                                0.9,
                              ), // Ubah warna teks
                            ),
                          ),
                          // Beri jarak agar tidak terlalu mepet dengan kontrol navigasi
                          const HeightSpacer(height: 120),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),

            // Kontrol navigasi di bagian bawah
            Positioned(
              bottom: 30.h,
              left: 24.w,
              right: 24.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol "Lewati"
                  TextButton(onPressed: _onFinish, child: const Text('Lewati')),

                  // Indikator halaman
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _pages.length,
                    effect: WormEffect(
                      dotHeight: 10.h,
                      dotWidth: 10.w,
                      activeDotColor: colorScheme.primary,
                      dotColor: colorScheme.secondaryContainer,
                    ),
                  ),

                  // Tombol "Next"
                  IconButton.filled(
                    onPressed: () {
                      if (_currentPage == _pages.length - 1) {
                        _onFinish();
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
