// ignore_for_file: avoid_print
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/features/profile/data/map_init/get_current_location.dart';
import 'package:marketos/features/profile/logic/cubits/change_address_cubit/change_Address_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/change_address_cubit/change_address_states.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  late CameraPosition _kGooglePlex;

  Set<Marker> markers = {};

  @override
  void initState() {
    _kGooglePlex = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );
    getCurrentLocation(getLocation: false);
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
          context.read<ChangeAddressCubit>().controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<ChangeAddressCubit,ChangeAddressState>(
        builder: (context,state) {
          if(state is ChangeAddressLoading) {
            return FloatingActionButton(
              onPressed: () {},
                child: const CircularProgressIndicator(),
            );
          }
          return FloatingActionButton.extended(
            onPressed: () {
              getCurrentLocation(getLocation: true);
            },
            backgroundColor: AppColorHelper.primaryColor,
            label: Text(
              'Current Location',
              style: AppTextStyleHelper.font26WhiteBold,
            ),
            icon: const Icon(
              Icons.location_on,
              color: Colors.white,
            ),
          );
        }
      ),
    );
  }

  Future<void> _goToCurrentPosition({required Position position}) async {
    final GoogleMapController controller =
        await context.read<ChangeAddressCubit>().controller.future;
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

  getCurrentLocation({required bool getLocation}) async {
    var result = await GetCurrentLocation.getCurrentLocation();
    result.fold(
      (position) {
        print(position);
        _goToCurrentPosition(
          position: position,
        );
        getLocation ? context.read<ChangeAddressCubit>().changeAddress(address: position) : null;
        getLocation ? Navigator.pop(context,true) : null;
      },
      (error) {
        alertsBuilder(error: error);
      },
    );
    setState(() {});
  }

  alertsBuilder({required String error}) {
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
  }

}