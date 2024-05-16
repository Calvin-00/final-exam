import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Light extends StatefulWidget {
  Light({Key? key}) : super(key: key);
  @override
  _LightState createState() => _LightState();
}

class _LightState extends State<Light> {
  double brightness = 0.0;
  bool toggle = false;

  @override
  void initState() {
    super.initState();
    getBrightness();
    proximityListener();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getBrightness() async {
    double bright;
    try {
      bright = await FlutterScreenWake.brightness;
    } on PlatformException {
      bright = 1.0;
    }
    setState(() {
      brightness = bright;
    });
    setScreenBrightness(brightness);
  }

  void setScreenBrightness(double value) {
    FlutterScreenWake.setBrightness(value);
  }

  void proximityListener() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (event.z > 8.0) {
        // Object detected near proximity sensor (e.g., covering front camera)
        setScreenBrightness(0.1); // Set low brightness
        setState(() {
          toggle = true; // Update toggle
          brightness = 0.1; // Update brightness
        });
      } else {
        // Object not detected near proximity sensor
        setScreenBrightness(1.0); // Restore brightness
        setState(() {
          toggle = false; // Update toggle
          brightness = 1.0; // Update brightness
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Light Sensor'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            border: Border.all(color: Colors.black26),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 2,
                blurRadius: 2,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Brightness:'),
              const SizedBox(height: 10),
              Row(
                children: [
                  AnimatedCrossFade(
                    firstChild: const Icon(Icons.brightness_7, size: 50),
                    secondChild: const Icon(Icons.brightness_3, size: 50),
                    crossFadeState: toggle
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(seconds: 1),
                  ),
                  Expanded(
                    child: Slider(
                      value: brightness,
                      onChanged: (value) {
                        setState(() {
                          brightness = value;
                        });
                        setScreenBrightness(brightness);
                      },
                    ),
                  ),
                ],
              ),
              Text(
                brightness.toString(),
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
