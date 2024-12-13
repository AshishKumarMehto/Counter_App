import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  double current = 0.00;
  double currentValue = 1.00;
  // double result =0;
  final TextEditingController buddy = TextEditingController();

  void increase() {
    setState(() {
      current += currentValue.toInt();
    });
  }

  void decrease() {
    setState(() {
      current -= currentValue.toInt();
    });
  }

  void reset() {
    setState(() {
      current = 0;
    });
  }

  void initial() {
    setState(() {
      current = double.parse(buddy.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 165, 177, 239),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 177, 239),
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 3, 17, 95),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'Counter App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Current Value: ${current.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 24)),
              ),
            ),
            const SizedBox(height: 75),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: buddy,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 21, 21, 21),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      hintText: "Enter Initial Value ",
                      border: OutlineInputBorder(
                        // Adding the border
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                FloatingActionButton(
                  onPressed: initial,
                  child: const Text("Enter"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft, // Align text to the left
              child: Text(
                "Choose Step Value",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // const SizedBox(height: 10),
            Slider(
              value: currentValue,
              min: 1,
              max: 10,
              divisions: 10,
              label: currentValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  currentValue = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: increase,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 101, 231, 15),
                    ),
                    child: const Text('Increment')),
                ElevatedButton(
                  onPressed: decrease,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 243, 69, 10),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                  child: const Text('Decrement'),
                ),
                ElevatedButton(
                    onPressed: reset,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 239, 167, 22),
                    ),
                    child: const Text('Reset')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
