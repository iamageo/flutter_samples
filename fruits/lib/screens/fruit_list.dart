import 'package:flutter/material.dart';
import 'package:fruits/database/dao/fruit_dao.dart';
import 'package:fruits/models/fruit.model.dart';
import 'package:fruits/screens/fruit_form.dart';

class FruitList extends StatefulWidget {
  @override
  _FruitListState createState() => _FruitListState();
}

class _FruitListState extends State<FruitList> {
  final FruitDao _dao = FruitDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits'),
      ),
      body: FutureBuilder<List<Fruit>>(
        initialData: const [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Fruit> fruits = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Fruit fruit = fruits[index];
                  return _FruitItem(fruit);
                },
                itemCount: fruits.length,
              );
          }
          return const Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FruitForm(),
                ),
              )
              .then(
                (value) => setState(() {}),
              );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _FruitItem extends StatelessWidget {
  final Fruit fruit;

  _FruitItem(this.fruit);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.fastfood),
        title: Text(
          fruit.name,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          'R\$: ${fruit.value.toString()}',
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
