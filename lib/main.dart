import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mantra Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;
  int _target = 108;
  bool _targetReached = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _count = prefs.getInt('count') ?? 0;
        _target = prefs.getInt('target') ?? 108;
        _targetReached = _count >= _target && _target > 0;
      });
    } catch (e) {
      // If SharedPreferences fails, use default values
      setState(() {
        _count = 0;
        _target = 108;
        _targetReached = false;
      });
    }
  }

  Future<void> _saveData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('count', _count);
      await prefs.setInt('target', _target);
    } catch (e) {
      // Handle storage error silently or show a message if needed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save data')),
      );
    }
  }

  void _incrementCounter() {
    // Disable counting if target is 0 or already reached
    if (_target <= 0 || _targetReached) return;

    setState(() {
      _count++;
      if (_count == _target && !_targetReached) {
        _targetReached = true;
        HapticFeedback.vibrate();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('🎉 Target Reached!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    });
    _saveData();
  }

  void _resetCounter() {
    setState(() {
      _count = 0;
      _targetReached = false;
    });
    _saveData();
  }

  void _setTargetDialog() {
    final controller = TextEditingController(text: _target.toString());
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Set Target'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Enter target number',
              border: OutlineInputBorder(),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final inputText = controller.text.trim();

                // Validate input: check if empty or null
                if (inputText.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a target number'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  return;
                }

                // Validate input: check if numeric and positive
                final value = int.tryParse(inputText);
                if (value == null || value <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid positive number'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                setState(() {
                  _target = value;
                  _targetReached = _count >= _target;
                  if (_count > _target) _count = 0;
                });
                _saveData();
                Navigator.of(context).pop();

                // Show confirmation message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Target set to $value'),
                    backgroundColor: Colors.blue,
                  ),
                );
              },
              child: const Text('Set'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mantra Counter'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Count: $_count',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: _targetReached ? Colors.green : null,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Target: $_target',
                  style: TextStyle(
                    fontSize: 22,
                    color: _targetReached ? Colors.green : Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (_targetReached) ...[
                  const SizedBox(height: 8),
                  const Text(
                    '🎉 Target Achieved!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 64,
                  child: ElevatedButton(
                    onPressed: (_target <= 0 || _targetReached) ? null : _incrementCounter,
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(_targetReached ? 'Target Reached!' : 'Count'),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _setTargetDialog,
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Set Target'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _resetCounter,
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Reset'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
