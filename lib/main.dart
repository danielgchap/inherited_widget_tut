import 'package:flutter/material.dart';
import 'package:inherited_widget_tut/inherited_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return InheritedWrapper(
      child: Scaffold(
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
              WidgetB(),
              WidgetA(),
              WidgetC()
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetA extends StatefulWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  _WidgetAState createState() => _WidgetAState();
}

class _WidgetAState extends State<WidgetA> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text("Increment"));
  }

  onPressed() {
    InheritedWrapperState wrapper = InheritedWrapper.of(context);
    wrapper.incrementCounter();
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final InheritedWrapperState state = InheritedWrapper.of(context);
    return Text('${state.counter}');
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InheritedWrapperState state =
        InheritedWrapper.of(context, build: false);
    return const Text('I am Widget C');
  }
}
