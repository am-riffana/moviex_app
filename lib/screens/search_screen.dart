import 'package:flutter/material.dart';
import 'details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
  String searchText = "";

  final List<Map<String, dynamic>> movies = [
   {
  "title": "John Wick",
  "image": "https://image.tmdb.org/t/p/w500/fZPSd91yGE9fCcCe6OoQr6E3Bev.jpg",
  "genre": "Action",
  "about": "A retired hitman seeks revenge after losing everything he loved.",
  "cast": ["Keanu Reeves", "Ian McShane", "Laurence Fishburne"]
},
{
  "title": "Titanic",
  "image": "https://image.tmdb.org/t/p/w500/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
  "genre": "Romance / Drama",
  "about": "A love story unfolds aboard the ill-fated Titanic ship.",
  "cast": ["Leonardo DiCaprio", "Kate Winslet"]
},

{
  "title": "Fast & Furious",
  "image": "https://image.tmdb.org/t/p/w500/2EewmxXe72ogD0EaWM8gqa0ccIw.jpg",
  "genre": "Action",
  "about": "Street racers get involved in high-speed heists and missions.",
  "cast": ["Vin Diesel", "Paul Walker"]
},
{
  "title": "Iron Man",
  "image": "https://image.tmdb.org/t/p/w500/78lPtwv72eTNqFW9COBYI0dWDJa.jpg",
  "genre": "Action / Superhero",
  "about": "Tony Stark builds a powerful suit to become Iron Man.",
  "cast": ["Robert Downey Jr.", "Gwyneth Paltrow"]
},
{
  "title": "Thor",
  "image": "https://image.tmdb.org/t/p/w500/prSfAi1xGrhLQNxVSUFh61xQ4Qy.jpg",
  "genre": "Fantasy",
  "about": "The God of Thunder must prove himself worthy.",
  "cast": ["Chris Hemsworth", "Natalie Portman"]
},

{
  "title": "Spider-Man",
  "image": "https://image.tmdb.org/t/p/w500/gh4cZbhZxyTbgxQPxD0dOudNPTn.jpg",
  "genre": "Action",
  "about": "A teenager gains spider-like powers and becomes a hero.",
  "cast": ["Tobey Maguire", "Kirsten Dunst"]
},
{
  "title": "Black Panther",
  "image": "https://image.tmdb.org/t/p/w500/uxzzxijgPIY7slzFvMotPv8wjKA.jpg",
  "genre": "Action",
  "about": "The king of Wakanda must protect his nation and throne.",
  "cast": ["Chadwick Boseman", "Michael B. Jordan"]
},
{
  "title": "The Lion King",
  "image": "https://image.tmdb.org/t/p/w500/sKCr78MXSLixwmZ8DyJLrpMsd15.jpg",
  "genre": "Animation",
  "about": "A lion cub must reclaim his rightful place as king.",
  "cast": ["Donald Glover", "Beyoncé"]
},
{
  "title": "Frozen",
  "image": "https://image.tmdb.org/t/p/w500/kgwjIb2JDHRhNk13lmSxiClFjVk.jpg",
  "genre": "Animation",
  "about": "Two sisters face magical powers and destiny.",
  "cast": ["Kristen Bell", "Idina Menzel"]
},

{
  "title": "Jurassic Park",
  "image": "https://image.tmdb.org/t/p/w500/9i3plLl89DHMz7mahksDaAo7HIS.jpg",
  "genre": "Adventure",
  "about": "Dinosaurs are brought back to life in a theme park.",
  "cast": ["Sam Neill", "Jeff Goldblum"]
},
  ]; 
  @override
  Widget build(BuildContext context) {
    final filteredMovies = movies.where((movie) {
      return movie["title"]
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title:  Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search movies...",
                prefixIcon:  Icon(Icons.search_outlined),
                filled: true,
                fillColor: const Color.fromARGB(255, 104, 46, 46),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredMovies.isEmpty
                ?  Center(
                    child: Text(
                      "No movies found ",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : GridView.builder(
                    padding:  EdgeInsets.all(10),
                    itemCount: filteredMovies.length,
                    gridDelegate:
                         SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final movie = filteredMovies[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  DetailsScreen(movie: movie),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              Image.network(
                                movie["image"],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Text(
                                  movie["title"],
                                  style:  TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}