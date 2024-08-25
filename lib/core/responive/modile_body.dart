import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import 'package:rideshare_app/core/location_permissions/location_permissions.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/frature_map/bloc/hups_bloc.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';
import 'package:rideshare_app/features/view/widget/custom_tab_bar.dart';
import 'package:rideshare_app/features/view/widget/text_from_fild_widget.dart';

class ModileBody extends StatefulWidget {
  const ModileBody({super.key});

  @override
  State<ModileBody> createState() => ModileBodyState();
}

MapController mapController = MapController();
List<Marker> markers = [];

class ModileBodyState extends State<ModileBody> {
  final TextEditingController controllerrextfiledForsearch =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HupsBloc()
        ..add(
          GetHups(
            longitude: 36.2944601,
            latitude: 33.5089789,
          ),
        ),
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<HupsBloc, HupsState>(
              builder: (context, state) {
                if (state is SuccessToGetHups) {
                  markers.clear();

                  for (var hup in state.hups) {
                    markers.add(
                      Marker(
                        width: 80,
                        height: 100,
                        point: LatLng(hup.latitude, hup.longitude),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              hup.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.location_on,
                              size: 40,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return FlutterMap(
                    mapController: mapController,
                    options: const MapOptions(
                      initialCenter: LatLng(33.5093553, 36.2939167),
                      initialZoom: 20,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                        maxNativeZoom: 19,
                      ),
                      MarkerLayer(
                        markers: markers,
                      ),
                    ],
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: iconDisplayColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.menu),
                  ),
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.notifications),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 500),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonWidget(
                      ontap: () {},
                      width: 172,
                      height: 60,
                      textColor: white,
                      color: darkPrimaryColor,
                      borderColor: darkPrimaryColor,
                      title: RENTAL,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Position position = await determinPosition();
                      mapController.move(
                        LatLng(position.latitude, position.longitude),
                        20,
                      );

                      setState(() {
                        markers.clear();
                        markers.add(
                          Marker(
                            point:
                                LatLng(position.latitude, position.longitude),
                            child: const Icon(
                              Icons.location_on,
                              size: 40,
                              color: Colors.blue,
                            ),
                          ),
                        );
                      });
                    },
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.location_searching),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                margin: const EdgeInsets.only(top: 566),
                width: 370,
                height: 200,
                decoration: BoxDecoration(
                  color: iconDisplayColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    TextFromFildWidget(
                      prefixIcon: const Icon(Icons.search),
                      controller: controllerrextfiledForsearch,
                      suffixIcon: const Icon(
                        Icons.favorite,
                        size: 15,
                      ),
                      lableText: WHEREWOULDYOUGO,
                      lableStyle: hintStyle,
                    ),
                    const CustomTabbar(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
