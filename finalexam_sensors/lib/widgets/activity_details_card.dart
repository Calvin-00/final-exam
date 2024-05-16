

import 'package:finalexam_sensors/gps.dart';
import 'package:finalexam_sensors/light.dart';
import 'package:flutter/material.dart';

import '../accelerometer_dashboard.dart';
import '../data/health_details.dart';
import '../util/responsive.dart';
import 'custom_card_widget.dart';
//
// class ActivityDetailsCard extends StatelessWidget {
//   const ActivityDetailsCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final healthDetails = HealthDetails();
//
//     return GridView.builder(
//       itemCount: healthDetails.healthData.length,
//       shrinkWrap: true,
//       physics: const ScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
//         crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
//         mainAxisSpacing: 12.0,
//       ),
//       itemBuilder: (context, index) => CustomCard(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               healthDetails.healthData[index].icon,
//               width: 30,
//               height: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15, bottom: 4),
//               child: Text(
//                 healthDetails.healthData[index].value,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             Text(
//               healthDetails.healthData[index].title,
//               style: const TextStyle(
//                 fontSize: 13,
//                 color: Colors.grey,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import '../data/health_details.dart';
// import '../util/responsive.dart';
// import 'custom_card_widget.dart';
//
// class ActivityDetailsCard extends StatelessWidget {
//   const ActivityDetailsCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final healthDetails = HealthDetails();
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: healthDetails.healthData.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: CustomCard(
//             child: SizedBox(
//               height: 150, // Adjust the height as needed
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     healthDetails.healthData[index].icon,
//                     width: 70,
//                     height: 70,
//                   ),
//                   const SizedBox(width: 16),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         healthDetails.healthData[index].value,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         healthDetails.healthData[index].title,
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../data/health_details.dart';
import '../util/responsive.dart';
import 'custom_card_widget.dart';
// import '../accelerometer.dart'; // Import the AccelerometerExample widget

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final healthDetails = HealthDetails();
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: healthDetails.healthData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GestureDetector(
            onTap: () {
              // Handle card click event
              if (healthDetails.healthData[index].title == 'Accelerometer') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccelerometerDashboard(),
                  ),
                );
              } else if (healthDetails.healthData[index].title == 'GPS') {
                // Handle clicks for other cards if needed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapPagez(),
                  ),
                );
              } else if (healthDetails.healthData[index].title ==
                  'Brightness') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Light(),
                  ),
                );
              } else {}
            },
            child: CustomCard(
              child: SizedBox(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      healthDetails.healthData[index].icon,
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          healthDetails.healthData[index].value,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          healthDetails.healthData[index].title,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
