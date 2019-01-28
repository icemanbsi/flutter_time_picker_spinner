import 'package:flutter/material.dart';

import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Time Picker Spinner Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Time Picker Spinner Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        padding: EdgeInsets.only(
            top: 100
        ),
        child: new Column(
          children: <Widget>[
//            hourMinute12H(),
//            hourMinute15Interval(),
//            hourMinuteSecond(),
            hourMinute12HCustomStyle(),
            new Container(
              margin: EdgeInsets.symmetric(
                  vertical: 50
              ),
              child: new Text(
                _dateTime.hour.toString().padLeft(2, '0') + ':' +
                    _dateTime.minute.toString().padLeft(2, '0') + ':' +
                    _dateTime.second.toString().padLeft(2, '0'),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      )
    );
  }


  /// SAMPLE
  Widget hourMinute12H(){
    return new TimePickerSpinner(
      is24HourMode: false,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
  Widget hourMinuteSecond(){
    return new TimePickerSpinner(
      isShowSeconds: true,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
  Widget hourMinute15Interval(){
    return new TimePickerSpinner(
      spacing: 40,
      minutesInterval: 15,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
  Widget hourMinute12HCustomStyle(){
    return new TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(
        fontSize: 24,
        color: Colors.deepOrange
      ),
      highlightedTextStyle: TextStyle(
        fontSize: 24,
        color: Colors.yellow
      ),
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: true,
      minutesInterval: 15,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}
