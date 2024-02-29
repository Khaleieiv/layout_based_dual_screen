import 'dart:io';

import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;
import 'package:layout_based_dual_screen/common/constants/app_colors.dart';
import 'package:layout_based_dual_screen/common/presentation/state/controller_provider.dart';
import 'package:layout_based_dual_screen/common/presentation/widgets/custom_elevated_button.dart';
import 'package:layout_based_dual_screen/home/presentation/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLocationAvailable = false;
  bool _isInternetAvailable = false;

  Future<void> _checkLocationPermission() async {
    final status = await permission_handler.Permission.location.request();
    setState(() {
      _isLocationAvailable =
          status == permission_handler.PermissionStatus.granted;
    });
  }

  Future<void> _checkInternetConnection() async {
    bool isConnected = await _checkInternetConnectivity();
    setState(() {
      _isInternetAvailable = isConnected;
    });
  }

  Future<bool> _checkInternetConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final nameController = ControllerStorage.getController();
    const coordinatePlace = LatLng(49.9935, 36.2304);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.greenColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: 300,
          title: CustomAppBar(
            nameController: nameController,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              _isLocationAvailable && _isInternetAvailable
                  ? Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: FlutterMap(
                          options: const MapOptions(
                            initialCenter: coordinatePlace,
                            initialZoom: 10,
                            backgroundColor: Colors.black12,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.app',
                            ),
                            const MarkerLayer(
                              markers: [
                                Marker(
                                  point: coordinatePlace,
                                  child: Icon(
                                    Icons.share_location,
                                    size: 30,
                                    color: AppColors.greenColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Visibility(
                      visible: !_isLocationAvailable || !_isInternetAvailable,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _isInternetAvailable
                                ? const Icon(
                                    Icons.location_off,
                                    color: AppColors.greenColor,
                                    size: 48.0,
                                  )
                                : const Icon(
                                    Icons.wifi_off,
                                    color: AppColors.greenColor,
                                    size: 48.0,
                                  ),
                            const SizedBox(height: 10.0),
                            const Text(
                              "Відсутній зв'язок",
                              style: TextStyle(fontSize: 23),
                            ),
                            const SizedBox(height: 10.0),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Відсутність доступу до геолокації."),
                                Text("Переконайтеся, що у додатку увімкнено"),
                                Text(
                                    "геолокацію та перевірте з'єднання з Інтернетом."),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Visibility(
                              visible: !_isLocationAvailable,
                              child: TextButton(
                                onPressed: () async {
                                  await _checkLocationPermission();
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _checkLocationPermission();
                                      _checkInternetConnection();
                                    });
                                  },
                                  child: const Text(
                                    'Налаштування геолокації >',
                                    style: TextStyle(color: AppColors.greenColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomElevatedButton(
            child: const Text(
              'Продовжити',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
