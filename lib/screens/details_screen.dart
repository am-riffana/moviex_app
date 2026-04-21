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
      (item) =>
          Map<String, dynamic>.from(item)["title"] ==
          widget.movie["title"],
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
        (k) =>
            Map<String, dynamic>.from(box.get(k))["title"] ==
            widget.movie["title"],
      );
      box.delete(key);
    }
  }
  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    return Scaffold(
      backgroundColor: const Color(0xFF15131E),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  movie["image"],
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon:  Icon(Icons.arrow_back_ios_new_outlined,
                        color: Color.fromARGB(255, 203, 68, 68)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 10,
                  child: IconButton(
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: toggleFavorite,
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding:  EdgeInsets.all(15),
                        decoration:  BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child:  Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 15,
                  child: Text(
                    movie["title"],
                    style:  TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(height: 15),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                   Icon(Icons.access_time,
                      color: Colors.grey, size: 16),

                   SizedBox(width: 5),
                   Text("152 min",
                      style: TextStyle(color: Colors.grey)),

                   SizedBox(width: 10),
                   CircleAvatar(radius: 2, backgroundColor: Colors.grey),

                   SizedBox(width: 10),
                   Text("IMDb",
                      style: TextStyle(color: Colors.grey)),

                   SizedBox(width: 5),
                  Text(
                    movie["rating"] ?? "7.0",
                    style:  TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
             SizedBox(height: 15),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                   Text("Genre: ",
                      style: TextStyle(color: Colors.white)),
                  Text(
                    movie["genre"] ?? "Action",
                    style:  TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
             SizedBox(height: 20),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Synopsis",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),

             SizedBox(height: 10),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                movie["about"] ?? "",
                style:  TextStyle(
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
            ),
             SizedBox(height: 20),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Cast",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),

             SizedBox(height: 10),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                movie["cast"] != null
                    ? (movie["cast"] as List).join(", ")
                    : "No cast available",
                style:  TextStyle(color: Colors.grey),
              ),
            ),
             SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}