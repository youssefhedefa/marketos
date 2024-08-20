import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marketos/features/profile/domain/use_cases/change_address_use_case.dart';
import 'package:marketos/features/profile/logic/cubits/change_address_cubit/change_address_states.dart';

class ChangeAddressCubit extends Cubit<ChangeAddressState> {

  final ChangeAddressUseCase useCase;

  ChangeAddressCubit({required this.useCase}) : super(ChangeAddressInitial());

  Completer<GoogleMapController> controller =
  Completer<GoogleMapController>();

  changeAddress({required Position address}) async {
    emit(ChangeAddressLoading());
    final String currentAddress = await getAddressFromLatLng(address) ?? '';
    final result = await useCase.call(address: currentAddress);
    result.fold(
      (failure) => emit(ChangeAddressFailed(message: failure.message)),
      (profile) => emit(ChangeAddressSuccess()),
    );
  }

  Future<String?> getAddressFromLatLng(Position position) async {
    String currentAddress = '';
    await placemarkFromCoordinates(
        position.latitude, position.longitude)
        .then((List<Placemark> placeMarks) {
      Placemark place = placeMarks[0];
      currentAddress = '${place.locality}, ${place.country}';
      return currentAddress;
    }).catchError((e) {
      debugPrint(e);
      return e.toString();
    });
    return currentAddress;
  }


}