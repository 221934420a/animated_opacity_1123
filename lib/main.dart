import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Opacity Demo';
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

// The StatefulWidget's job is to take data and create a State class.
// In this case, the widget takes a title, and creates a _MyHomePageState.
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// The State class is responsible for two things: holding some data you can
// update and building the UI using that data.
class _MyHomePageState extends State<MyHomePage> {
  // Whether the green box should be visible
  bool _visible = true;
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedAlign(
        // If the widget is visible, animate to 0.0 (invisible).
        // If the widget is hidden, animate to 1.0 (fully visible).
        duration: const Duration(milliseconds: 500),
        curve: Curves.elasticOut,
        // The green box must be a child of the AnimatedOpacity widget.
        alignment: selected ? Alignment.center : Alignment.topCenter,
        child: const Icon(
          Icons.flight,
          size: 100,
          color: Colors.blue,
        ),
        onEnd: () {
          setState(() {
            selected = true;
            print('onEnd');
          });
        },
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            setState(() {
              // _visible = !_visible;
              selected = false;
              print("setState $selected");
            });
          },
          child: const Text("fly")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
