import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:travelapp/home_main.dart';
import 'package:travelapp/widget/HomeWidget/home_appbar_seach.dart';

class MapScreenn extends StatefulWidget {
  const MapScreenn({super.key});

  @override
  State<MapScreenn> createState() => _MapScreennState();
}

class _MapScreennState extends State<MapScreenn> {
  final Location _locationControler = new Location();

  final Completer<GoogleMapController> _mapControler =
      Completer<GoogleMapController>();

  static LatLng _pHaNoi = LatLng(21.02873, 105.85074);
  static LatLng _pTPHue = LatLng(16.46371, 107.59084);

  LatLng? _currentP = null;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
              const HomeBar(),
            ],
          ),
        ),
      ),
      body: _currentP == null
          ? Center(child: Text('Loading...'))
          : GoogleMap(
              onMapCreated: ((GoogleMapController controller) =>
                  _mapControler.complete(controller)),
              initialCameraPosition: CameraPosition(
                target: _currentP!,
                zoom: 12,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('_currentLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _currentP!,
                ),
                Marker(
                    markerId: MarkerId('_sourcleLocation'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pHaNoi),
                Marker(
                  markerId: MarkerId('_destionationLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pTPHue,
                )
              },
            ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapControler.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 12);

    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationControler.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationControler.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationControler.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationControler.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationControler.onLocationChanged.listen(
      (LocationData currentLocation) {
        if (currentLocation.latitude != null &&
            currentLocation.longitude != null) {
          setState(
            () {
              _currentP =
                  LatLng(currentLocation.latitude!, currentLocation.longitude!);
              _cameraToPosition(_currentP!);
            },
          );
        }
      },
    );
  }
}
