// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/features/profile/data/map_init/get_current_location.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Set<Marker> markers = {};

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: markers,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          getCurrentLocation();
        },
        backgroundColor: AppColorHelper.primaryColor,
        label: Text(
            'Current Location',
          style: AppTextStyleHelper.font26WhiteBold,
        ),
        icon: const Icon(Icons.location_on,color: Colors.white,),
      ),
    );
  }

  Future<void> _goToCurrentPosition({required Position position}) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 18,
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: const MarkerId('current'),
        position: LatLng(position.latitude, position.longitude),
        infoWindow: const InfoWindow(title: 'Current Location'),
      ),
    );
  }

  getCurrentLocation() async {
    var result = await GetCurrentLocation.getCurrentLocation();
    result.fold((position) {
      print(position);
      _goToCurrentPosition(
        position: position,
      );
      _getAddressFromLatLng(position);
    },
            (error) {
      print(error);

      String permissionError =
          CheckConstantsExtension(CheckConstants.permission).value;
      String serviceError =
          CheckConstantsExtension(CheckConstants.service).value;

      if (error == permissionError) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Permission Error'),
            content: const Text('Permission not granted'),
            actions: [
              TextButton(
                onPressed: () {
                  Geolocator.openAppSettings();
                  Navigator.pop(context);
                },
                child: const Text('Setting'),
              ),
            ],
          ),
        );
      } else if (error == serviceError) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Service Error'),
            content: const Text('Location service not enabled'),
            actions: [
              TextButton(
                onPressed: () {
                  Geolocator.openLocationSettings();
                  Navigator.pop(context);
                },
                child: const Text('Setting'),
              ),
            ],
          ),
        );
      } else {
        print('Unknown error');
      }
    });

    setState(() {

    });
  }

  String _currentAddress = '';

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        position.latitude, position.longitude)
        .then((List<Placemark> placeMarks) {
      Placemark place = placeMarks[0];
      setState(() {
        _currentAddress = '${place.locality}, ${place.country}';
      });
      print(_currentAddress);
    }).catchError((e) {
      debugPrint(e);
    });
  }

}
