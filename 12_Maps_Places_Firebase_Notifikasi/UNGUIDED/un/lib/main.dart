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
  late GoogleMapController _mapController;
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
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Google Maps'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible(
              child: GoogleMap(
                initialCameraPosition: _kInitialPosition,
                markers: _marker,
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
                onTap: (position) {
                  _mapController
                      .animateCamera(CameraUpdate.newLatLng(position));
                  setState(() {
                    _marker.add(Marker(
                      markerId: MarkerId(position.toString()),
                      position: position,
                      infoWindow: InfoWindow(
                          title: 'Lokasi Baru',
                          snippet:
                              '${position.latitude}, ${position.longitude}'),
                    ));
                  });
                },
              ),
            ),
            Flexible(child: _buildListMarker()),
          ],
        ),
      ),
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

  _buildListMarker() {
    return ListView.builder(
      itemCount: _marker.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Marker ${_marker.elementAt(index).markerId.value}'),
          subtitle: Text(
              '${_marker.elementAt(index).position.latitude}, ${_marker.elementAt(index).position.longitude}'),
          onTap: () {
            _mapController.animateCamera(
              CameraUpdate.newLatLng(_marker.elementAt(index).position),
            );
            _mapController
                .showMarkerInfoWindow(_marker.elementAt(index).markerId);
          },
        );
      },
    );
  }
}
