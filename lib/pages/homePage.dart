import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 35.0),
            child: Text("Catalog App"),
          ),
        ),
      ),
      drawer: DrawerWidget(
        isClicked: isClicked,
        onTap: (val) {
          isClicked = val;
          print(val);
          //true
          // setState(() {});
        },
      ),
    );
  }
}
