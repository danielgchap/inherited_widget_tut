import 'package:flutter/material.dart';

class InheritedWrapper extends StatefulWidget {
  final Widget child;
  const InheritedWrapper({Key? key, required this.child}) : super(key: key);

  static InheritedWrapperState of(BuildContext context, {bool build = true}) {
    return build
        ? context.dependOnInheritedWidgetOfExactType<InheritedCounter>()!.data
        : context.findAncestorWidgetOfExactType<InheritedCounter>()!.data;
  }

  @override
  InheritedWrapperState createState() => InheritedWrapperState();
}

class InheritedWrapperState extends State<InheritedWrapper> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCounter(
      child: widget.child,
      data: this,
      counter: counter,
    );
  }
}

class InheritedCounter extends InheritedWidget {
  final int counter;
  final InheritedWrapperState data;

  const InheritedCounter(
      {Key? key,
      required Widget child,
      required this.data,
      required this.counter})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedCounter oldWidget) {
    return oldWidget.counter != counter;
  }
}
