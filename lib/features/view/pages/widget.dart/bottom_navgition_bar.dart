import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/view/pages/favourite/favourite.dart';
import 'package:rideshare_app/features/view/pages/offer/offer.dart';
import 'package:rideshare_app/features/view/pages/wallet/wallet.dart';
import 'package:rideshare_app/features/view/pages/profile/profile.dart';

class BottomNavgitionBar extends StatefulWidget {
  const BottomNavgitionBar({super.key});

  @override
  State<BottomNavgitionBar> createState() => _BottomNavgitionBarState();
}

class _BottomNavgitionBarState extends State<BottomNavgitionBar> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,

        onTap: (index) {
          setState(() {
            _selectedIndex = index;

            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        }, // Current selected index

        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: grayColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: AppString().HOME,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet,
              size: 50,
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount_rounded),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

      body: PageView(
        controller: _pageController,
        children: [
          HomePage(),
          Favourite(),
          Wallet(),
          Offer(),
          Profile(),
        ],
      ),

      // ... other
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
