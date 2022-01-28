import 'package:flutter/material.dart';
import 'package:fruits/database/dao/fruit_dao.dart';
import 'package:fruits/models/fruit.model.dart';

class FruitForm extends StatefulWidget {
  @override
  _FruitFormState createState() => _FruitFormState();
}

class _FruitFormState extends State<FruitForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _valueController =TextEditingController();
  final FruitDao _dao = FruitDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert A new fruit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'name',
              ),
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _valueController,
                decoration: const InputDecoration(
                  labelText: 'value',
                ),
                style: const TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text('save'),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int value = int.tryParse(_valueController.text)!;
                    final Fruit newFruit = Fruit(0, name, value);
                    _dao.save(newFruit).then((id) => Navigator.pop(context));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}