
import 'package:finalexam_sensors/widgets/dashboard_widget.dart';
import 'package:flutter/material.dart';
// import 'accelerometer.dart';
import 'accelerometer_dashboard.dart';

import 'notification_service.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  NotificationService.initializeNotifications();
  NotificationService.requestNotificationPermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF15131C),
        brightness: Brightness.dark,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const MainScreen(),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sensors'),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Theme.of(context).primaryColor,
      //         ),
      //         child: const Text(
      //           'Menu',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
        //     ListTile(
        //       title: const Text('Step Count'),
        //       onTap: _navigateToStepCount,
        //     ),
        //     // Add more items to the drawer as needed
        //     ListTile(
        //       title: const Text('GPS Tracker'),
        //       onTap: _navigateToGpsTracker,
        //     ),
        //     ListTile(
        //       // leading: Icon(Icons.sensor_door_outlined),
        //       title: Text('Accelerometer'),
        //       onTap: () {
        //         Navigator.pop(context); // Close the drawer
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => AccelerometerExample(),
        //           ),
        //         );
        //       },
        //     ),
        //     ListTile(
        //       // leading: Icon(Icons.sensor_door_outlined),
        //       title: Text('Accelerometer Dashboard'),
        //       onTap: () {
        //         Navigator.pop(context); // Close the drawer
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => AccelerometerDashboard(),
        //           ),
        //         );
        //       },
        //     ),
        //   ],
        // ),
      // ),
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: DashboardWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

