import 'package:flutter/material.dart';

void main() => runApp(const FormApp());

class FormApp extends StatefulWidget {
  const FormApp({super.key});

  @override
  State<FormApp> createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    final List<String> items = ['Item 1', 'Item 2', 'Item 3'];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton<String>(
              value: selectedValue,
              hint: Text('Pilih Item'),
              isExpanded: true,
              dropdownColor: Colors.white,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black, fontSize: 16),
              underline: Container(
                height: 2,
                color: Colors.grey,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {}, 
              child: const Text('Forgot Password?')
              ),
          ],
        ),
      )),
    );
  }
}
