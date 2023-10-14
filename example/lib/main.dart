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
      darkTheme: ThemeData.dark(),
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
                        textColor: Colors.yellow,
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
                  fillColor: Colors.purple,
                  bgColor: Colors.purple.withOpacity(0.5),
                  thickness: 30,
                  progress: 70,
                  textColor: Colors.blue,
                  showCenterProgress: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                EllipticalProgressBar(
                  fillColor: Colors.yellow,
                  bgColor: Colors.orange.withOpacity(0.5),
                  progress: 70,
                  textColor: Colors.blue,
                ),
                const SizedBox(
                  height: 20,
                ),
                EllipticalProgressBar(
                  fillColor: Colors.grey,
                  bgColor: Colors.black.withOpacity(0.5),
                  thickness: 30,
                  progress: 70,
                  textColor: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                EllipticalProgressBar(
                  fillColor: Colors.red,
                  bgColor: Colors.red.withOpacity(0.5),
                  thickness: 30,
                  progress: 70,
                  textColor: Colors.blue,
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
