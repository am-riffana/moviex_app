import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic> movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Box box;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    box = Hive.box('favorites');

    isFavorite = box.values.any(
      (item) => item["title"] == widget.movie["title"],
    );
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      box.add(widget.movie);
    } else {
      final key = box.keys.firstWhere(
        (k) => box.get(k)["title"] == widget.movie["title"],
      );
      box.delete(key);
    }
  }

  void downloadMovie() {
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text("Downloading..."),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie["title"]),

        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: const Color.fromARGB(255, 214, 47, 35),
            ),
            onPressed: toggleFavorite,
          ),

          IconButton(
            icon:  Icon(Icons.download_outlined),
            onPressed: downloadMovie,
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Image.network(
              movie["image"],
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),

             SizedBox(height: 10),

            Padding(
              padding:  EdgeInsets.all(10),
              child: Text(
                movie["title"],
                style:  TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Genre: ${movie["genre"]}",
                style:  TextStyle(color: const Color.fromARGB(255, 205, 118, 118)),
              ),
            ),

             SizedBox(height: 10),

             Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "About",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                movie["about"],
                style:  TextStyle(fontSize: 15, height: 1.5),
              ),
            ),
             SizedBox(height: 20),

             Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Cast",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  (movie["cast"] as List).length,
                  (index) {
                    return Chip(
                      label: Text(movie["cast"][index]),
                    );
                  },
                ),
              ),
            ),
             SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}