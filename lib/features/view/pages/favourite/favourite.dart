import 'package:flutter/material.dart';
import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_string.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FAVOURITE),
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          decoration: BoxDecoration(
              color: iconDisplayColor, borderRadius: BorderRadius.circular(8)),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.density_medium,
            ),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ContainerFavourite(
                title: HOME,
                subtitle: 'dsaf',
              ),
            ),
          )),
    );
  }
}

class ContainerFavourite extends StatelessWidget {
  ContainerFavourite({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: subTitleColor,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(Icons.location_on_rounded),
        trailing: IconButton(
          icon: Icon(
            Icons.remove_circle_rounded,
            color: const Color.fromARGB(255, 170, 29, 19),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Favourite Page')),
    Center(child: Text('Wallet Page')),
    Center(child: Text('Offer Page')),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(), // Placeholder for the central button
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),
                label: 'Offer',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
          Positioned(
            bottom: 20, // Adjust this value for the protrusion effect (50%)
            left: MediaQuery.of(context).size.width / 2 - 40,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              child: ClipPath(
                clipper: HexagonClipper(),
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
                  child: Center(
                    child: Icon(
                      Icons.wallet,
                      size: 40,
                      color: Colors.white,
                    ),
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

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    double cornerRadius = 8.0; // Adjust this for rounder corners

    Path path = Path()
      ..moveTo(w * 0.5, 0)
      ..lineTo(w - cornerRadius, h * 0.25)
      ..arcToPoint(Offset(w, h * 0.25 + cornerRadius),
          radius: Radius.circular(cornerRadius))
      ..lineTo(w, h * 0.75 - cornerRadius)
      ..arcToPoint(Offset(w - cornerRadius, h * 0.75),
          radius: Radius.circular(cornerRadius))
      ..lineTo(w * 0.5, h)
      ..lineTo(cornerRadius, h * 0.75)
      ..arcToPoint(Offset(0, h * 0.75 - cornerRadius),
          radius: Radius.circular(cornerRadius))
      ..lineTo(0, h * 0.25 + cornerRadius)
      ..arcToPoint(Offset(cornerRadius, h * 0.25),
          radius: Radius.circular(cornerRadius))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
