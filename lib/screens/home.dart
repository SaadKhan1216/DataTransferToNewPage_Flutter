import 'package:data_transfer_ui/screens/form_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<FormData> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: items.isNotEmpty ? ListView.builder(itemCount: items.length, itemBuilder: item
          //children: items.map((text) => item(text)).toList(),
          ) : const Center(
            child: Text('No Items Available') ,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push<FormData>(MaterialPageRoute(builder: (_) => FormScreen()))
              .then((value) => setState(() {
                    items.add(value!);
                  }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget item(BuildContext context, int index) => Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(items[index].title),
                  Text(items[index].descp),
                ],
              )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      );
}
