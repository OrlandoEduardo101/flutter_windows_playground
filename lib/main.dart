import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus_windows/device_info_plus_windows.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:platform_info/platform_info.dart';

import 'base_coin/root_base_page.dart';
// import 'package:device_info_plus/device_info_plus.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  // final info = await deviceInfo.windowsInfo;
  // final info2 = await deviceInfo.deviceInfo;

  // print(info);
  // print(info2);

  // print(Platform.instance.version);
  // print(Platform.I.operatingSystem);
  // print(platform.numberOfProcessors.gcd(1));

  // String? deviceId = await PlatformDeviceId.getDeviceId;

  // print(deviceId);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootBasePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
