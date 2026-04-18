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

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Scaffold(
      backgroundColor: const Color(0xFF15131E),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔥 IMAGE + GRADIENT
          Stack(
  children: [
    Image.network(
      movie["image"],
      height: 300,
      width: double.infinity,
      fit: BoxFit.cover,
    ),

    Container(
      height: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.3),
            Colors.transparent,
            Colors.black.withOpacity(0.8),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ),

    // 🔙 BACK BUTTON
    Positioned(
      top: 40,
      left: 10,
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
    ),

    // ❤️ FAVORITE BUTTON
    Positioned(
      top: 40,
      right: 10,
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: toggleFavorite,
      ),
    ),

    // ▶️ PLAY BUTTON (CENTER)
    Positioned.fill(
      child: Center(
        child: GestureDetector(
          onTap: () {
            // 👉 later you can open video player here
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
    ),

    // 🎬 TITLE
    Positioned(
      bottom: 20,
      left: 15,
      child: Text(
        movie["title"],
        style: const TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),

            const SizedBox(height: 15),

            // ⏱ RUNTIME + RATING
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.grey, size: 16),
                  const SizedBox(width: 5),
                  const Text(
                    "152 min",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  const CircleAvatar(radius: 2, backgroundColor: Colors.grey),
                  const SizedBox(width: 10),
                  const Text(
                    "IMDb",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    movie["rating"] ?? "7.0",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // 🎭 GENRE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Text(
                    "Genre: ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    movie["genre"] ?? "Action",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📖 ABOUT
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Synopsis",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                movie["about"] ?? "",
                style: const TextStyle(
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🎭 CAST
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Cast",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                movie["cast"] != null
                    ? movie["cast"].join(", ")
                    : "No cast available",
                style: const TextStyle(color: Colors.grey),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}