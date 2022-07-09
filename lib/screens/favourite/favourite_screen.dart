import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    // final favoriteProvider = Provider.of<FavouriteItem>(context);
    print('object');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavouriteItem>(
                  builder: ((context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text('Item ' + index.toString()),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
