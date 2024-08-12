import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_string.dart';

import 'package:rideshare_app/features/view/pages/Complete_your_profile_view.dart';
import 'package:rideshare_app/features/view/pages/set_password_view.dart';
import 'package:rideshare_app/features/view/pages/sing_up_view.dart';
import 'package:rideshare_app/features/view/pages/welcome_view.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/OnboardingView': (context) => OnboardingView(),
        '/WelcomView': (context) => WelcomView(),
        '/SingUpView': (context) => SingUpView(),
        '/SetPasswordView': (context) => SetPasswordView(),
        '/CompleteYourProfile': (context) => CompleteYourProfile(),
      },
      home: OnboardingView(),
    );
  }
}

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 1;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation =
        Tween<double>(begin: 1 / 3, end: 1 / 3).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _goToWelcomePage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomView()),
    );
  }

  void _increaseProgress() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
        _animation = Tween<double>(
          begin: (_currentPage - 1) / 3,
          end: _currentPage / 3,
        ).animate(_animationController);
        _animationController.forward(from: 0.0);
      });
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      _goToWelcomePage(context); // انتقال فوري لصفحة Welcome
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => _goToWelcomePage(context),
            child: Text(
              SKIP,
              style: TextStyle(color: blackColor),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                  _animation = Tween<double>(
                    begin: index / 3,
                    end: (index + 1) / 3,
                  ).animate(_animationController);
                  _animationController.forward(from: 0.0);
                });
              },
              children: [
                buildPage(
                  image: 'images/onboardingOneImage.png',
                  text: 'Welcome to our app!',
                ),
                buildPage(
                  image: 'images/onboardingOneImage.png',
                  text: 'Learn more about our features.',
                ),
                buildPage(
                  image: 'images/onboardingOneImage.png',
                  text: 'Ready to get started?',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: CircularButton(
              progressValue: _animation.value,
              onPressed: _increaseProgress,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required String image,
    required String text,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        SizedBox(height: 30),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}

class CircularButton extends StatelessWidget {
  final double progressValue;
  final VoidCallback onPressed;

  CircularButton({
    required this.progressValue,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              value: progressValue,
              strokeWidth: 8.0,
              valueColor: AlwaysStoppedAnimation<Color>(excellentColor),
              backgroundColor: iconDisplayColor,
            ),
          ),
          // دائرة خلف الأيقونة
          if (progressValue < 1.0)
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: excellentColor, // اللون الخلفي للدائرة
                border: Border.all(
                  color: excellentColor, // لون الإطار
                  width: 2,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  size: 30,
                  color: grayColor,
                ),
              ),
            ),
          // عرض النص "Go" فقط في آخر صفحة
          if (progressValue == 1.0)
            Positioned(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: excellentColor, // اللون الخلفي للدائرة
                  border: Border.all(
                    color: excellentColor, // لون الإطار
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Go',
                    style: TextStyle(
                      color: grayColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
