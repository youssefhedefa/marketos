import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/core/di/di.dart';
import 'package:marketos/features/profile/logic/cubits/change_address_cubit/change_Address_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/change_address_cubit/change_address_states.dart';


class MapListener extends StatelessWidget {
  const MapListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChangeAddressCubit>(),
      child: BlocListener<ChangeAddressCubit,ChangeAddressState>(
          listener: (context, state) {
            if (state is ChangeAddressSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Address Changed Successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is ChangeAddressFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
            else if (state is ChangeAddressLoading) {
              showDialog(context: context, builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
            }
          }
      ),
    );
  }
}
