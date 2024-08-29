
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rideshare_app/core/res/app_color.dart';

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
