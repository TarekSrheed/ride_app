import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/container/container_cycle_feaures.dart';
import 'package:rideshare_app/features/view/widget/container/container_specigications.dart';


class CarImageSlider extends StatefulWidget {
  @override
  _CarImageSliderState createState() => _CarImageSliderState();
}

class _CarImageSliderState extends State<CarImageSlider> {
  int _currentIndex = 0;
  List<String> _imagePaths = [
    nameCar,
    onboardingOneImage,
  ];

  void _previousImage() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + _imagePaths.length) % _imagePaths.length;
    });
  }

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _imagePaths.length;
    });
  }
    AppString appString = AppString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'name cycle',
                style: titleStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow[700],
                  ),
                  Text(
                    '4.9(531 reviews)',
                    style: subtitleStyle,
                  ),
                ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: _previousImage,
                    ),
                    Image.asset(
                      _imagePaths[_currentIndex],
                      width: MediaQuery.of(context).size.width * 2 / 3,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: _nextImage,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                appString.   SPECIFICATIONS,
                  style: titleStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerSpecifications(
                    image: maxPower,
                    title: 'Max Power',
                    subtitle: '2500hp',
                  ),
                  ContainerSpecifications(
                    image: maxPower,
                    title: 'Max Power',
                    subtitle: '2500hp',
                  ),
                  ContainerSpecifications(
                    image: maxPower,
                    title: 'Max Power',
                    subtitle: '2500hp',
                  ),
                  ContainerSpecifications(
                    image: maxPower,
                    title: 'Max Power',
                    subtitle: '2500hp',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                 appString.  CARFEATURES,
                  style: titleStyle,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerCycleFeaures(
                    title: 'adsf',
                    subtitle: 'asd',
                  ),
                  ContainerCycleFeaures(
                    title: 'adsf',
                    subtitle: 'asd',
                  ),
                  ContainerCycleFeaures(
                    title: 'adsf',
                    subtitle: 'asd',
                  ),
                  ContainerCycleFeaures(
                    title: 'adsf',
                    subtitle: 'asd',
                  ),
                  ContainerCycleFeaures(
                    title: 'adsf',
                    subtitle: 'asd',
                  ),
                  Row(
                    children: [
                      ButtonWidget(
                          title: appString. BOOKLATER,
                          ontap: () {},
                          color: Colors.black.withOpacity(0),
                          textColor: primaryColor,
                          borderColor: primaryColor,
                          width: MediaQuery.of(context).size.width / 2 - 40),
                      SizedBox(
                        width: 20,
                      ),
                      ButtonWidget(
                          title: appString. RIDENOW,
                          ontap: () {},
                          color: primaryColor,
                          textColor: white,
                          borderColor: primaryColor,
                          width: MediaQuery.of(context).size.width / 2 - 40),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
