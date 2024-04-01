import 'package:flutter/material.dart';
import 'package:webelight_assignment/models/vehicle_model.dart';
import 'package:webelight_assignment/services/vehicle_services.dart';

class VehicleListProvider with ChangeNotifier {
  ///All Vehicle List will be saved here
  List<VehicleModel> _vehicleList = [];
  List<VehicleModel> get vehicleList => _vehicleList;
  //Current Active Vehicle will be here
  VehicleModel? _activeVehicle;
  VehicleModel? get activeVehicle => _activeVehicle;

//To update the active vehicle
  updateActiveVehicle(int index) {
    _activeVehicle = vehicleList[index];
    notifyListeners();
  }

//TO get all List
  getAllList() async {
    final myData = await VehicleSevices.getAllList();

    _vehicleList = myData ?? [];

    notifyListeners();
    return myData;
  }
}
