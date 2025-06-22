import 'package:flutter/material.dart';
import 'package:wh_mobile/src/common/global_widgets/my_navbar.dart';
import 'package:wh_mobile/src/features/home/presentation/home_screen.dart';
import 'package:wh_mobile/src/features/order/presentation/order_screen.dart';
import 'package:wh_mobile/src/features/profile/presentation/view/profile_screen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];

  // Daftar item untuk navbar
  final List<BottomNavItem> _navItems = [
    BottomNavItem(icon: Icons.home_rounded, title: 'Beranda'),
    BottomNavItem(icon: Icons.receipt_long_rounded, title: 'Pesanan'),
    BottomNavItem(icon: Icons.person_rounded, title: 'Profil'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tampilkan halaman yang sesuai dengan index yang dipilih
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: CustomBottomNavBar(
        items: _navItems,
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
