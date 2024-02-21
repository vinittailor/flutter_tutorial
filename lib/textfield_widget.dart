import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            EasyStyleTextField(),
            AdvancedStyleTextField(),
            MultiLineTextField(),
            ValidationTextField(),
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
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Enter your text',
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
      child: Column(
        children: [
          TextField(
            controller: _controller,
            onChanged: (value) {
              // Implement your dynamic logic here.
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
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Enter your text',
        ),
      ),
    );
  }
}
//endregion

//region Styling Excellence - Custom Styles
///Problem:
// Scenario: You need to go beyond basic styling.
///Solution:
// Explore style, InputDecoration, and utilize both prefix and suffix options.
///Explanation:
// Customize the appearance of your text field with the style property,
// allowing you to set properties like color, font size, and weight.
// Additionally, leverage the InputDecoration class for comprehensive styling,
// including both prefix and suffix options.
// This example showcases the use of a prefix icon and a suffix icon for enhanced visual appeal.
class EasyStyleTextField extends StatefulWidget {
  const EasyStyleTextField({super.key});

  @override
  State<EasyStyleTextField> createState() => _EasyStyleTextFieldState();
}

class _EasyStyleTextFieldState extends State<EasyStyleTextField> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          labelText: 'Custom Styles',
          labelStyle: TextStyle(
            color: Colors.green,
          ),
          prefixIcon: Icon(Icons.person, color: Colors.blue), // Prefix icon for visual enhancement.
          suffixIcon: Icon(Icons.check, color: Colors.green), // Suffix icon for additional context.
        ),
      ),
    );
  }
}
//endregion

//region Advanced Styling Techniques
///Problem:
// Scenario: You want to implement advanced styling for unique designs.
/// Solution:
// Dive deeper into styling techniques, including the addition of a border.
/// Explanation:
// Take your styling to the next level by exploring additional properties and techniques.
// In this example, we set the font size, letter spacing, text decoration,
// and introduce a border to enhance the visual appeal of the TextField.
class AdvancedStyleTextField extends StatefulWidget {
  const AdvancedStyleTextField({super.key});

  @override
  State<AdvancedStyleTextField> createState() => _AdvancedStyleTextFieldState();
}

class _AdvancedStyleTextFieldState extends State<AdvancedStyleTextField> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        style: TextStyle(
          fontSize: 18.0,
          letterSpacing: 1.2,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationThickness: 2.0,
        ),
        decoration: InputDecoration(
          labelText: 'Advanced Styling Techniques',
          border: OutlineInputBorder( // Add a border for a more structured look.
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
//endregion

//region Multiline Magic - Handling Multiline Input
///Problem:
//Scenario: You need to handle multiline text input.
/// Solution:
// Utilize the maxLines property for multiline input.
/// Explanation:
// Enable users to input multiline text with ease by setting the maxLines property.
// In this example, we use null to enable an unlimited number of lines,
// making it suitable for scenarios where users may need to enter extensive text.
// This opens up possibilities for creating rich text input experiences.
class MultiLineTextField extends StatefulWidget {
  const MultiLineTextField({super.key});

  @override
  State<MultiLineTextField> createState() => _MultiLineTextFieldState();
}

class _MultiLineTextFieldState extends State<MultiLineTextField> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        maxLines: 4, // Set to desired number of lines or null for unlimited.
        decoration: InputDecoration(
          labelText: 'Multiline Input',
        ),
      ),
    );
  }
}
//endregion

//region Input Validation Strategies with Regex
///Problem:
// Scenario: You want to ensure the integrity of the input data.
///Solution:
// Implement input validation using onSubmitted and inputFormatters, including regex validation.
///Explanation:
// Guarantee the correctness of input data with input validation.
// The onSubmitted callback allows you to react when the user submits the input,
// and inputFormatters enable you to enforce specific formats or constraints on the entered text.
// Here, we introduce a regex pattern to validate the input against a predefined format.
class ValidationTextField extends StatefulWidget {
  const ValidationTextField({super.key});

  @override
  State<ValidationTextField> createState() => _ValidationTextFieldState();
}

class _ValidationTextFieldState extends State<ValidationTextField> {

  bool _validateInput(String input) {
    // Define your regex pattern for validation.
    RegExp regex = RegExp(r'^[a-zA-Z]+$');
    return regex.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        onSubmitted: (value) {
          // Implement your validation logic here.
          if (_validateInput(value)) {
            // Valid input, proceed with further actions.
          } else {
            // Invalid input, provide feedback or take corrective action.
          }
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+$')), // Allow only alphabetic characters.
        ],
        decoration: const InputDecoration(
          labelText: 'Alphabetic Input Only',
        ),
      ),
    );
  }
}
//endregion