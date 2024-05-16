import 'package:flutter/material.dart';

import '../util/responsive.dart';
import 'activity_details_card.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const ActivityDetailsCard(),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
