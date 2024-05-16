import 'package:flutter/material.dart';

import '../util/responsive.dart';
import '../widgets/dashboard_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(

      body: SafeArea(
        child: Row(
          children: [

            Expanded(
              flex: 5,
              child: DashboardWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
