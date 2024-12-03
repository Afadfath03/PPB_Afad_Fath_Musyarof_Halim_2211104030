# PERTEMUAN KE 12

## Maps and Places

---

### GUIDED

Kodingan main.dart
  ``` dart
  import 'package:flutter/material.dart';
  import 'package:google_maps_flutter/google_maps_flutter.dart';
  
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
        LatLng(-7.434872869258951, 109.25229085274653); // TUP
    static const CameraPosition _kInitialPosition =
        CameraPosition(target: _kMapCenter, zoom: 20.0);
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
            body: GoogleMap(
          initialCameraPosition: _kInitialPosition,
          markers: _createMarker(),
          mapType: MapType.hybrid,
          myLocationEnabled: true,
        )),
      );
    }
  
    Set<Marker> _createMarker() {
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
  ```

---

### UNGUIDED
