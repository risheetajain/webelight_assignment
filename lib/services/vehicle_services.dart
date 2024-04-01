import 'package:fluttertoast/fluttertoast.dart';
import 'package:webelight_assignment/constants/url_constants.dart';
import 'package:webelight_assignment/services/api_services.dart';

import '../models/vehicle_model.dart';

class VehicleSevices {
  static Future<List<VehicleModel>?> getAllList() async {
    final myData = await ApiServices().getRequest(vehicleUrl);
    if (myData["status"] == "success") {
      return List.generate(myData["data"]["results"].length, (index) {
        return VehicleModel.fromJson(myData["data"]["results"][index]);
      });
    } else {
      Fluttertoast.showToast(msg: myData["data"]["message"].toString());
    }
    return null;
  }
}
