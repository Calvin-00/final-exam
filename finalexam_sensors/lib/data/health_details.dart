// import 'package:fitness_dashboard_ui/model/health_model.dart';

import '../model/health_model.dart';

class HealthDetails {
  final healthData = const [
    HealthModel(
        icon: 'assets/icons/accelerometer.png',
        value: "44%",
        title: "Accelerometer"),
    HealthModel(
        icon: 'assets/icons/map_maker.jpeg',
        value: " kk 12 st 93",
        title: "GPS"),
    // HealthModel(
    //     icon: 'assets/icons/light.png', value: "7km", title: "Brightness"),
    HealthModel(
        icon: 'assets/icons/sleep.png', value: "70%", title: "Brightness"),
  ];
}
