import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  static const LatLng _kMapCenter =
      LatLng(-7.434872869258951, 109.25229085274653);
  static const CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 20.0);

  final Set<Marker> _marker = {};

  @override
  void initState() {
    super.initState();
    _marker.addAll(_initialMarker());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          Flexible(
              child: GoogleMap(
            initialCameraPosition: _kInitialPosition,
            markers: _marker,
            mapType: MapType.normal,
          )),
          const Flexible(
            child: PlacePicker(
              apiKey: 'GOOGLE_MAPS_API_KEY_ANDROID',
              enableNearbyPlaces: true,
              mapType: MapType.normal,
              searchInputConfig: SearchInputConfig(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                autofocus: false,
                textDirection: TextDirection.ltr,
              ),
              searchInputDecorationConfig: SearchInputDecorationConfig(
                hintText: "...",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Set<Marker> _initialMarker() {
    return {
      const Marker(
          markerId: MarkerId("Telkom"),
          position: _kMapCenter,
          infoWindow: InfoWindow(title: 'PWT'),
          rotation: 180),
      const Marker(
        markerId: MarkerId("KANTIN"),
        infoWindow: InfoWindow(title: 'KANTIN COY'),
        position: LatLng(-7.4346511961784465, 109.25254851151722),
      ),
    };
  }
}
