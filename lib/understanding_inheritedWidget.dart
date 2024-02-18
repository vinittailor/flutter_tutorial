import 'package:flutter/cupertino.dart';

// Create an InheritedWidget
//home
class Cheif extends InheritedWidget {
  final String instruction;

  const Cheif({super.key, required this.instruction, required Widget child})
      : super(child: child);

  // A method to easily access the instruction
  static Cheif of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Cheif>()!;
  }

  @override
  bool updateShouldNotify(Cheif oldWidget) {
    return oldWidget.instruction != instruction;
  }
}

//
// Wrap your app with Instruction
class Kitchen extends StatelessWidget {
  const Kitchen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Cheif(
      instruction: 'baked for 5 minutes',
      child: HelpingFriend(), // Wrap your app with SharedData
    );
  }
}

// Use the instruction in any widget
class HelpingFriend extends StatelessWidget {
  const HelpingFriend({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the instruction using the of method
    final instruction = Cheif.of(context).instruction;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Inherited Data:', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 10),
        Text(
          instruction,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}


class SharedData extends InheritedWidget {
  final String data;

  SharedData({required this.data, required Widget child})
      : super(child: child);

  static SharedData of(BuildContext context) {
    // A method to easily access the shared data
    return context.dependOnInheritedWidgetOfExactType<SharedData>()!;
  }

  @override
  bool updateShouldNotify(SharedData oldWidget) {
    // Check if a rebuild is needed when the data changes
    return oldWidget.data != data;
  }
}


// InheritedWidget Approach - Example
class A extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Widget A wraps the entire subtree with SharedData
    return SharedData(
      data: 'Shared Data for InheritedWidget',
      child: const B(),
    );
  }
}

class B extends StatelessWidget {
  const B({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget B doesn't need to explicitly pass data to Widget C
    return C();
  }
}

class C extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Widget C easily accesses the shared data
    final inheritedData = SharedData.of(context).data;

    return Container();
  }
}