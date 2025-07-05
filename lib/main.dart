import 'dart:math';

import 'package:counter_app_redesign/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:counter_app_redesign/widgets/custom_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.lightBlueAccent,
        scaffoldBackgroundColor: Colors.grey.withValues(alpha: 0.2),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  final List<String> buttonTitle = ["Increment", "Decrement", "Reset"];
  final List<IconData> buttonIcon = [
    Icons.add,
    Icons.remove,
    Icons.restart_alt,
  ];

  void _handleButtonPress(String action) {
    switch (action) {
      case "Increment":
        setState(() {
          count++;
        });
        break;
      case "Decrement":
        if (count > 0) {
          setState(() {
            count--;
          });
        }
        break;
      case "Reset":
        _showResetDialog();
        break;
    }
  }

  void _showResetDialog() {
    if (count > 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Reset Counter"),
            content: const Text(
              "Are you sure you want to reset the count to 0?",
            ),
            actions: [
              TextButton(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text("Reset"),
                onPressed: () {
                  setState(() {
                    count = 0;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Color _randomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavbar(),
      appBar: AppBar(
        title: const Text("Counter App"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Current Count',
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: count == 0 ? Colors.red : _randomColor(),
            ),
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 55,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: buttonTitle.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return CustomButton(
                    title: buttonTitle[index],
                    iconData: buttonIcon[index],
                    buttonColor: Colors.lightBlueAccent,
                    textColor: Colors.white,
                    onPress: () => _handleButtonPress(buttonTitle[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
