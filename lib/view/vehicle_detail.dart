import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webelight_assignment/models/vehicle_model.dart';
import 'package:webelight_assignment/providers/vehicle_list_provider.dart';
import 'package:webelight_assignment/view/vehicle_list.dart';

class VehicleDetailScreen extends StatelessWidget {
  const VehicleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VehicleModel vehicle =
        context.watch<VehicleListProvider>().activeVehicle ?? VehicleModel();
    return Scaffold(
      appBar: AppBar(
        ///Hero tag of text of vehicle name should be exactly same as that of hero tag in previous tag
        title: Hero(
            transitionOnUserGestures: true,
            tag: "${vehicle.name}",
            child: Text(
              "${vehicle.name}",
              style: const TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              overflow: TextOverflow.ellipsis,
            )),
      ),
      body: VehicleCard(
        vehicle: vehicle,
        isHero: false,
      ),
    );
  }
}
