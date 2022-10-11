import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final fullname = TextEditingController();
  final mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite"),
      ),
      body: Center(
        child: Column(
          children: [
            _form(),
            _list(),
          ],
        ),
      ),
    );
  }

  _form() => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: fullname,
                decoration: const InputDecoration(label: Text('Full name')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter full name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: mobile,
                decoration: const InputDecoration(label: Text('Mobile')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter mobile';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Ok'),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
              )
            ],
          ),
        ),
      );

  _list() => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: Form(
          child: Column(
            children: const [
              Text('List'),
            ],
          ),
        ),
      );
}
