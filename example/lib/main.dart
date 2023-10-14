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
                        fillColor: Colors.red,
                        bgColor: Colors.red.withOpacity(0.5),
                        progress: 70,
                        thickness: 5,
                        progressTextStyle: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                        showCenterProgress: true,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: EllipticalProgressBar(
                        fillColor: Colors.red,
                        bgColor: Colors.red.withOpacity(0.5),
                        progress: 50,
                        textColor: Colors.blue,
                        // showCenterProgress: false,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: EllipticalProgressBar(
                        fillColor: Colors.red,
                        bgColor: Colors.red.withOpacity(0.5),
                        progress: 90,
                        textColor: Colors.blue,
                        showCenterProgress: false,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: EllipticalProgressBar(
                        fillColor: Colors.red,
                        bgColor: Colors.red.withOpacity(0.5),
                        progress: 90,
                        textColor: Colors.blue,
                        showCenterProgress: false,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: EllipticalProgressBar(
                        fillColor: Colors.red,
                        bgColor: Colors.red.withOpacity(0.5),
                        progress: 90,
                        textColor: Colors.blue,
                        showCenterProgress: false,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                EllipticalProgressBar(
                  fillColor: Colors.red,
                  bgColor: Colors.red.withOpacity(0.5),
                  thickness: 30,
                  progress: 70,
                  textColor: Colors.blue,
                  showCenterProgress: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                EllipticalProgressBar(
                  fillColor: Colors.red,
                  bgColor: Colors.red.withOpacity(0.5),
                  progress: 70,
                  textColor: Colors.blue,
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
