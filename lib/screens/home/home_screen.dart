import 'package:flutter/material.dart';
import 'package:modern_home_ui/screens/home/widgets/smart_device.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List smartDevices = [
    ['Smart Light', 'assets/icons/light-bulb.png', true],
    ['Smart AC', 'assets/icons/air-conditioner.png', false],
    ['Smart TV', 'assets/icons/smart-tv.png', false],
    ['Smart Fan', 'assets/icons/fan.png', false],
  ];
  onPowerChanged(value, index) => setState(() {
        smartDevices[index][2] = value;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Image.asset(
                    'assets/icons/logo.png',
                    height: 45,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // welcome home JOHNKODER
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Welcome Home,'),
                  Text(
                    'JOHNKODER',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
            const SizedBox(height: 10),

            // smart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Smart Devices',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),

            Expanded(
              child: GridView.builder(
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
                itemCount: smartDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                itemBuilder: (context, index) {
                  var device = smartDevices[index];
                  return SmartDevice(
                    name: device[0],
                    icon: device[1],
                    powerOn: device[2],
                    onChanged: (value) => onPowerChanged(value, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
