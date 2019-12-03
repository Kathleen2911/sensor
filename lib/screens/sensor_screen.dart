import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class SensorScreen extends StatefulWidget {
  @override
  _SensorScreenState createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  String _acc_x = "noch nix";
  String _acc_y = "noch nix";
  String _acc_z = "noch nix";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _acc_x = event.x.toStringAsFixed(2);
        _acc_y = event.y.toStringAsFixed(2);
        _acc_z = event.z.toStringAsFixed(2);
      });
      print(event);
    });
// [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]

    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      print(event);
    });
// [UserAccelerometerEvent (x: 0.0, y: 0.0, z: 0.0)]

    gyroscopeEvents.listen((GyroscopeEvent event) {
      print(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sensortest"),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Wert x:    " + _acc_x + "\n"),
            Text("Wert y:   " + _acc_y + "\n"),
            Text("Wert z:   " + _acc_z + "\n"),


          ],
        ),
      ),
    );
  }
}


