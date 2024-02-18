import 'dart:developer';
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
      title: 'TextField Tutorial',
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
      home: const BaseWidget(),
    );
  }
}


class BaseWidget extends StatefulWidget {
  const BaseWidget({super.key});

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBasicTextField(),
            ControllingInput(),
            DynamicChanges(),
            PasswordInput(),
          ],
        ),
      ),
    );
  }
}


//region Basic TextField
///---Explanation:
///The TextField widget provides a simple way to capture text input from users.
///It includes a variety of properties for customizing its appearance and behavior.
///By specifying the decoration property, you can add a label, hint text, border,
///and other visual elements to the text field.
class DemoBasicTextField extends StatefulWidget {
  const DemoBasicTextField({super.key});

  @override
  State<DemoBasicTextField> createState() => _DemoBasicTextFieldState();
}

class _DemoBasicTextFieldState extends State<DemoBasicTextField> {
  @override
  Widget build(BuildContext context) {
    return const  Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        ///---Basic TextField Code
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Enter your text',
          ),
        ),
      ),
    );
  }
}
//endregion

//region Controlling Input TextField Code
/// Explanation:
/// TextEditingController allows you to interact with the text field's content programmatically.
/// You can set an initial value, retrieve the current value, and even listen for changes in the text input.
/// This is particularly useful when you need to perform operations like validation or formatting on the input text.
class ControllingInput extends StatefulWidget {
  const ControllingInput({super.key});

  @override
  State<ControllingInput> createState() => _ControllingInputState();
}

class _ControllingInputState extends State<ControllingInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        ///---Controlling Input TextField Code
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your text',
              ),
            ),

            ///---In this way you can print and use controller
            Text(
              _controller.text,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
//endregion

//region Dynamic Changes TextField Code
/// Explanation:
/// The onChanged callback is triggered whenever the content of the text field changes.
/// This allows you to react in real-time to user input,
/// such as updating UI elements based on the input text or performing validation as the user types.
class DynamicChanges extends StatefulWidget {
  const DynamicChanges({super.key});

  @override
  State<DynamicChanges> createState() => _DynamicChangesState();
}

class _DynamicChangesState extends State<DynamicChanges> {
  final TextEditingController _controller = TextEditingController();
  String controllerValue = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        ///---Dynamic Changes TextField Code
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) {
                // Implement your dynamic logic here.
                print("TextField value is => ${_controller.text}");
                setState(() {
                  controllerValue = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter your text',
              ),
            ),
            Text(
              controllerValue,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
//endregion

//region Password Input TextField Code
/// Explanation:
/// The onChanged callback is triggered whenever the content of the text field changes.
/// This allows you to react in real-time to user input,
/// such as updating UI elements based on the input text or performing validation as the user types.
class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        ///---Password Input TextField Code
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Enter your text',
          ),
        ),
      ),
    );
  }
}
//endregion
