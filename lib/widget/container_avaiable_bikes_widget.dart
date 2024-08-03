import 'package:flutter/material.dart';
import 'package:ride/widget/button_widget.dart';


class ContainerAvaiableBikesWidget extends StatelessWidget {
  ContainerAvaiableBikesWidget({
    super.key,
    required this.typeBikes,
    required this.specifications,
    required this.distance,
    required this.duration,
    required this.image,
  });
  final String typeBikes;
  final String specifications;
  final String distance;
  final String duration;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff008955).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xff008955),
        ),
      ),
      child: Column(
        children: [
          Text(typeBikes),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(specifications),
              Container(width: 50, height: 30, child: Image.asset(image)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on_sharp),
              Text('${distance}(${duration}away)'),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: ButtonWidget(
                  title: 'View',
                  ontap: () {},
                  color: Colors.white.withOpacity(0),
                  textColor: Color(0xff008955),
                  borderColor: Color(0xff008955),
                  size: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
