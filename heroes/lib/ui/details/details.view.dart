import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          )
      ),
      body: Center(
        child: Hero(
          tag: 'background',
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orange, Colors.orangeAccent],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight
                )
            ),
          ),
        ),
      ),
    );
  }
}
