import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webelight_assignment/models/vehicle_model.dart';
import 'package:webelight_assignment/providers/vehicle_list_provider.dart';
import 'package:webelight_assignment/view/vehicle_detail.dart';

class VehicleListScreen extends StatefulWidget {
  const VehicleListScreen({super.key});

  @override
  State<VehicleListScreen> createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  @override
  void initState() {
    context.read<VehicleListProvider>().getAllList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicles List"),
      ),
      body: SafeArea(
        child: Consumer<VehicleListProvider>(
            builder: (context, vehicleListData, child) {
          return vehicleListData.vehicleList.isEmpty
              ? const Center(
                  child: Text("No Vehicles"),
                )
              : ListView.builder(
                  // physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: vehicleListData.vehicleList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          vehicleListData.updateActiveVehicle(index);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const VehicleDetailScreen();
                          }));
                        },
                        child: Card(
                          child: VehicleCard(
                              isHero: true,
                              vehicle: vehicleListData.vehicleList[index]),
                        ));
                  },
                );
        }),
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  final VehicleModel vehicle;
  final bool isHero;

  const VehicleCard({Key? key, required this.vehicle, required this.isHero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isHero)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Hero(
                      tag: vehicle.name ?? "",
                      transitionOnUserGestures: true,
                      child: Text(
                        vehicle.name ?? "Unknown",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          _buildDetailItem("Model", vehicle.model),
          _buildDetailItem("Manufacturer", vehicle.manufacturer),
          _buildDetailItem("Cost in Credits", vehicle.costInCredits),
          _buildDetailItem("Length", vehicle.length),
          _buildDetailItem(
              "Max Atmosphering Speed", vehicle.maxAtmospheringSpeed),
          _buildDetailItem("Crew", vehicle.crew),
          _buildDetailItem("Passengers", vehicle.passengers),
          _buildDetailItem("Cargo Capacity", vehicle.cargoCapacity),
          _buildDetailItem("Consumables", vehicle.consumables),
          _buildDetailItem("Vehicle Class", vehicle.vehicleClass),
        ],
      ),
    );
  }

  Widget _buildDetailItem(
    String label,
    String? value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              value ?? "Unknown",
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
