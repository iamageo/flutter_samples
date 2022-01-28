import 'package:flutter/material.dart';
import 'package:fruits/screens/fruit_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.blue,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FruitList(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: Size.infinite.width,
                  child: Column(
                    children: const <Widget>[
                      Icon(
                        Icons.fastfood,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      Text(
                        'Fruits',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}