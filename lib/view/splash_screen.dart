import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webelight_assignment/providers/vehicle_list_provider.dart';
import 'package:webelight_assignment/view/vehicle_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<VehicleListProvider>().getAllList().then((value) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const VehicleListScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Brand Logo
              FlutterLogo(
                size: MediaQuery.of(context).size.height * 0.1,
              ),
              const SizedBox(
                height: 10,
              ),

              /// Loading Progress Indicator till the api is calling
              const LinearProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
