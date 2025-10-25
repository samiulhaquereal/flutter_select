import 'package:flutter/material.dart';
import 'package:retcore_select/retcore_select.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retcore Select Example',
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  // --- State for our examples ---
  String? _singleValue;
  List<String> _multiValues = [];

  final List<String> _options = [
    'Flutter',
    'React',
    'Vue',
    'Angular',
    'Svelte',
    'Ember',
    'Backbone',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Retcore Select Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '1. Single Select',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                RetCoreSelect<String>(
                  label: 'Select a framework',
                  options: _options,
                  value: _singleValue,
                  onChanged: (newValue) {
                    setState(() {
                      _singleValue = newValue;
                    });
                  },
                ),

                const SizedBox(height: 32),

                const Text(
                  '2. Multi-Select with Search',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                RetCoreSelect<String>(
                  label: 'Select your favorite skills',
                  placeholder: 'You can select multiple...',
                  options: _options,
                  isMulti: true,
                  isSearchable: true,
                  isClearable: true,
                  values: _multiValues,
                  onValuesChanged: (newValues) {
                    setState(() {
                      _multiValues = newValues;
                    });
                  },
                ),

                const SizedBox(height: 32),

                const Text(
                  '3. Disabled State',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                RetCoreSelect<String>(
                  label: 'Disabled field',
                  isDisabled: true,
                  options: _options,
                  isMulti: true,
                  values: const ['Flutter', 'React'],
                  onValuesChanged: (v) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
