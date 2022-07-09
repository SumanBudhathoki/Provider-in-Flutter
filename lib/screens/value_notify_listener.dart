import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({Key? key}) : super(key: key);

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> obscure = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless in Statefull'),
      ),
      body: Column(
        children: [
          Center(
            child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Text(
                    _counter.value.toString(),
                    style: const TextStyle(
                      fontSize: 45,
                    ),
                  );
                }),
          ),
          ValueListenableBuilder(
            valueListenable: obscure,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: obscure.value,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffix: InkWell(
                    onTap: () {
                      obscure.value = !obscure.value;
                    },
                    child: Icon(!obscure.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
