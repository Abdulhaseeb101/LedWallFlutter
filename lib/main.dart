import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sri City Led',
      debugShowCheckedModeBanner: false,
      home: Temperature(),
    );
  }
}

class Temperature extends StatelessWidget {
  const Temperature({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer timer = Timer.periodic(Duration(seconds: 5), (timer) {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade, child: Humidity(), ctx: context));
      timer.cancel();
    });

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFfc6076), Color(0xFFFF9A44)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('../images/logo.png'),
                    Text('Current Weather',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 20,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        )),
                    IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 10)),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: SfLinearGauge(
                    minorTicksPerInterval: 0,
                    interval: 10,
                    minimum: 10,
                    maximum: 60,
                    orientation: LinearGaugeOrientation.vertical,
                    ranges: [
                      LinearGaugeRange(
                        startValue: 10,
                        endValue: 60,
                      ),
                    ],
                    markerPointers: [LinearShapePointer(value: 50)],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 15)),
                Text(
                  '25°C',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 15),
                ),
                Text(
                  'Temperature: ',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 15),
                ),
                Text(
                  'Powered by Eterna',
                  textAlign: TextAlign.end,
                )
              ],
            )),
      ),
    );
  }
}

class Humidity extends StatelessWidget {
  const Humidity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer timer = Timer.periodic(Duration(seconds: 5), (timer) {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade, child: DewPoint(), ctx: context));
      timer.cancel();
    });

    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('../images/logo.png'),
                  Text('Current Weather',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 20,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      )),
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 10)),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      showLabels: false,
                      showTicks: false,
                      annotations: [],
                      // centerX: 1,
                      startAngle: 180,
                      endAngle: 360,
                      minimum: 0,
                      maximum: 100,
                      ranges: <GaugeRange>[
                        GaugeRange(
                          gradient: SweepGradient(
                              colors: [Color(0xFF667E2C), Color(0xFF00FFFF)]),
                          startValue: 0,
                          endValue: 100,
                          startWidth: 20,
                          endWidth: 100,
                        )
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          animationType: AnimationType.ease,
                          enableAnimation: true,
                          value: 80,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 15)),
              Text(
                '25°C',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 15),
              ),
              Text(
                'Humidity: ',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 15),
              ),
              Text(
                'Powered by Eterna',
                textAlign: TextAlign.end,
              )
            ],
          )),
    );
  }
}

class DewPoint extends StatelessWidget {
  const DewPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer timer = Timer.periodic(Duration(seconds: 5), (timer) {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade, child: HeatIndex(), ctx: context));
      timer.cancel();
    });

    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('../images/logo.png'),
                  Text('Current Weather',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 20,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      )),
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 10)),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: SfSparkLineChart(
                    trackball: SparkChartTrackball(
                        activationMode: SparkChartActivationMode.tap),
                    marker: SparkChartMarker(
                        displayMode: SparkChartMarkerDisplayMode.all),
                    labelDisplayMode: SparkChartLabelDisplayMode.none,
                    data: <double>[
                      1.0,
                      1.2,
                      1.3,
                      1.4,
                      1.5,
                      1.7,
                      1.9,
                      2.2,
                      2.6,
                      3.1,
                      3.7,
                      4.5,
                      5.7,
                      6.9,
                      8.9,
                      10
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 15)),
              Text(
                '25°C',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 15),
              ),
              Text(
                'Temperature: ',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 15),
              ),
              Text(
                'Powered by Eterna',
                textAlign: TextAlign.end,
              )
            ],
          )),
    );
  }
}

class HeatIndex extends StatelessWidget {
  const HeatIndex({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    Timer timer = Timer.periodic(Duration(seconds: 5), (timer) {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: Temperature(),
              ctx: context));
      timer.cancel();
    });

    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('../images/logo.png'),
                  Text('Current Weather',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 20,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      )),
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 10)),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      showLabels: false,
                      showTicks: false,
                      annotations: [],
                      // centerX: 1,
                      startAngle: 150,
                      endAngle: 30,
                      minimum: 0,
                      maximum: 100,
                      ranges: <GaugeRange>[
                        GaugeRange(
                          gradient: SweepGradient(colors: [
                            Color(0xFF8B8000),
                            Color(0xFFFF8C00),
                            Color(0xFF8B0000)
                          ]),
                          startValue: 0,
                          endValue: 100,
                          startWidth: 75,
                          endWidth: 75,
                        )
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          animationType: AnimationType.ease,
                          enableAnimation: true,
                          value: 80,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 15)),
              Text(
                '25°C',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 15),
              ),
              Text(
                'Humidity: ',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 15),
              ),
              Text(
                'Powered by Eterna',
                textAlign: TextAlign.end,
              )
            ],
          )),
    );
  }
}

class DataProvider {
  late double temperature;
}
