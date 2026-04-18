import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('favorites');

    return Scaffold(
      appBar: AppBar(
        title:  Text("Favorites"),
      ),

      body: ValueListenableBuilder(
        valueListenable: box.listenable(),

        builder: (context, box, _) {
          if (box.isEmpty) {
            return  Center(
              child: Text("No Favorites"),
            );
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final movie = box.getAt(index);

              return ListTile(
                leading: Image.network(
                  movie["image"],
                  width: 100,
                ),

                title: Text(movie["title"]),

                trailing: IconButton(
                  icon:  Icon(Icons.delete, color: const Color.fromARGB(255, 238, 225, 224)),
                  onPressed: () {
                    box.deleteAt(index); // delete item
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}