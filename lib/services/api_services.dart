import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiServices {
  ///This request is to do get api call to the url provided
  ///In catch We have handled exception so we just have to check if status == "success" ai is hit successfully if not status changes to "failure" then you to show msg to user or handle accordingly
  Future<Map<String, dynamic>> getRequest(String url) async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return {"status": "success", "data": jsonDecode(response.body)};
      } else {
        return {
          "status": "failure",
          "data": {"message": response.reasonPhrase}
        };
      }
    } catch (e) {
      //If user disconnected from internet services
      if (e is SocketException) {
        return {
          "status": "failure",
          "data": {"message": "Check your Connectivity"}
        };
      } else {
        ///Any other exception which may occur
        return {
          "status": "failure",
          "data": {"message": "Something went wrong"}
        };
      }
    }
  }
}
