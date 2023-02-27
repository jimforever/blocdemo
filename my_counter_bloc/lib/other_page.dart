import 'package:flutter/material.dart';

class Otherpage extends StatelessWidget {
  const Otherpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('other'),
      ),
      body: Center(
        child: Text(
          'Other',
          style: TextStyle(fontSize: 52),
        ),
      ),
    );
  }
}
