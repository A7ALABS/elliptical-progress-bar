import 'package:elliptical_progress_bar/elliptical_progress_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Elliptical progress bar'),
          backgroundColor: Colors.deepOrange,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: EllipticalProgressBar(
                        fillColor: Colors.green,
                        bgColor: Colors.green.withOpacity(0.5),
                        progress: 70,
                        thickness: 5,
                        progressTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                        showCenterProgress: true,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: EllipticalProgressBar(
                        fillColor: Colors.blue,
                        bgColor: Colors.blue.withOpacity(0.5),
                        progress: 50,
                        textColor: Colors.black,
                        // showCenterProgress: false,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                EllipticalProgressBar(
                  fillColor: Colors.yellow,
                  bgColor: Colors.orange.withOpacity(0.5),
                  progress: 20,
                  textColor: Colors.blueAccent,
                  progressTextStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.withOpacity(0.5)),
                ),
                const SizedBox(
                  height: 20,
                ),
                EllipticalProgressBar(
                  fillColor: Colors.grey,
                  bgColor: Colors.black.withOpacity(0.5),
                  thickness: 20,
                  progress: 70,
                  textColor: Colors.red,
                  progressTextStyle: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                EllipticalProgressBar(
                  fillColor: Colors.red,
                  bgColor: Colors.red.withOpacity(0.5),
                  thickness: 30,
                  progress: 85,
                  progressTextStyle:
                      const TextStyle(fontSize: 30, color: Colors.red),
                ),
                const SizedBox(
                  height: 20,
                ),
                EllipticalProgressBar(
                  fillColor: Colors.purple,
                  bgColor: Colors.purple.withOpacity(0.5),
                  thickness: 40,
                  progress: 33,
                  showCenterProgress: false,
                  progressTextStyle: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
