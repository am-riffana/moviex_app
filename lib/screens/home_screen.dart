import 'package:flutter/material.dart';
import 'details_screen.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> movies = [
    {
  "title": "Stranger Things",
  "image": "https://i.guim.co.uk/img/media/344f3917f3e40dbb745e498dd31ab84e4b098981/0_901_3000_2400/master/3000.jpg?width=1300&dpr=2&s=none&crop=none",
  "genre": "Sci-Fi / Horror",
  "about": "Stranger Things is a thrilling series set in the 1980s, where a group of kids uncover mysterious government experiments and supernatural forces in their small town. When a boy disappears, strange events begin to unfold, including the appearance of a girl with telekinetic powers. The story blends friendship, adventure, and horror elements.",
  "cast": ["Millie Bobby Brown", "Finn Wolfhard", "David Harbour", "Winona Ryder"]
},
{
  "title": "Avatar",
  "image": "https://upload.wikimedia.org/wikipedia/en/d/d6/Avatar_%282009_film%29_poster.jpg",
  "genre": "Sci-Fi / Adventure",
  "about": "Avatar is set on the alien planet Pandora, where humans are mining valuable resources. Jake Sully, a disabled marine, uses an avatar body to interact with the native Na’vi people. As he becomes part of their world, he must choose between his mission and protecting the planet.",
  "cast": ["Sam Worthington", "Zoe Saldana", "Sigourney Weaver", "Stephen Lang"]
},
{
  "title": "Avengers",
  "image": "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
  "genre": "Action / Superhero",
  "about": "The Avengers brings together Earth's strongest heroes to stop Loki and his alien army from taking over the world. Led by Nick Fury, Iron Man, Captain America, Thor, Hulk, Black Widow, and Hawkeye must learn to work as a team to save humanity.",
  "cast": ["Robert Downey Jr.", "Chris Evans", "Chris Hemsworth", "Scarlett Johansson"]
},
{
  "title": "Joker",
  "image": "https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
  "genre": "Drama / Thriller",
  "about": "Joker is a dark psychological story about Arthur Fleck, a struggling comedian who is ignored by society. As he faces rejection and mental health struggles, he slowly transforms into the infamous Joker, becoming a symbol of chaos in Gotham City.",
  "cast": ["Joaquin Phoenix", "Robert De Niro", "Zazie Beetz"]
},
    {
  "title": "Deadpool",
  "image": "https://image.tmdb.org/t/p/w500/3E53WEZJqP6aM84D8CckXx4pIHw.jpg",
  "genre": "Action",
  "about": "A wisecracking mercenary gains superpowers and seeks revenge.",
  "cast": ["Ryan Reynolds", "Morena Baccarin", "T.J. Miller"]
},
{
  "title": "Doctor Strange in the Multiverse of Madness",
  "image": "https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg",
  "genre": "Fantasy",
  "about": "Doctor Strange explores dangerous alternate realities in the multiverse.",
  "cast": ["Benedict Cumberbatch", "Elizabeth Olsen"]
},
{
  "title": "Black Widow",
  "image": "https://image.tmdb.org/t/p/w500/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg",
  "genre": "Action",
  "about": "Natasha Romanoff confronts her past and unfinished business.",
  "cast": ["Scarlett Johansson", "Florence Pugh"]
},
{
  "title": "Shang-Chi",
  "image": "https://image.tmdb.org/t/p/w500/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg",
  "genre": "Action",
  "about": "A young man must face his past when he is drawn into the Ten Rings organization.",
  "cast": ["Simu Liu", "Awkwafina"]
},
{
  "title": "The Batman",
  "image": "https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg",
  "genre": "Action",
  "about": "Batman uncovers corruption in Gotham while hunting a serial killer known as the Riddler.",
  "cast": ["Robert Pattinson", "Zoë Kravitz"]
},
{
  "title": "Aquaman",
  "image": "https://image.tmdb.org/t/p/w500/5Kg76ldv7VxeX9YlcQXiowHgdX6.jpg",
  "genre": "Fantasy",
  "about": "Arthur Curry must embrace his destiny as king of Atlantis.",
  "cast": ["Jason Momoa", "Amber Heard"]
},
{
  "title": "The Matrix",
  "image": "https://image.tmdb.org/t/p/w500/aOIuZAjPaRIE6CMzbazvcHuHXDc.jpg",
  "genre": "Sci-Fi",
  "about": "A hacker discovers reality is a simulation and joins a rebellion.",
  "cast": ["Keanu Reeves", "Laurence Fishburne"]
},
{
  "title": "The Conjuring",
  "image": "https://image.tmdb.org/t/p/w500/wVYREutTvI2tmxr6ujrHT704wGF.jpg",
  "genre": "Horror",
  "about": "Paranormal investigators help a family terrorized by dark forces.",
  "cast": ["Patrick Wilson", "Vera Farmiga"]
},
{
  "title": "It",
  "image": "https://image.tmdb.org/t/p/w500/9E2y5Q7WlCVNEhP5GiVTjhEhx1o.jpg",
  "genre": "Horror",
  "about": "A group of kids face a shape-shifting clown that feeds on fear.",
  "cast": ["Bill Skarsgård", "Finn Wolfhard"]
},
  ];

  final List<Map<String, dynamic>> trendingMovies = [
    {
      "title": "Oppenheimer",
      "image": "https://image.tmdb.org/t/p/w500/ptpr0kGAckfQkJeJIt8st5dglvd.jpg",
      "rating": "8.5"
    },
    {
      "title": "Dune",
      "image": "https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
      "rating": "8.1"
    },
    {
      "title": "Batman",
      "image": "https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg",
      "rating": "7.9"
    },
    {
  "title": "Spider-Man: No Way Home",
  "image": "https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
  "genre": "Action",
  "about": "Peter Parker seeks help from Doctor Strange after his identity is revealed, but things go wrong and villains from other universes enter his world.",
  "cast": ["Tom Holland", "Zendaya", "Benedict Cumberbatch"]
},
{
  "title": "Captain America: Civil War",
  "image": "https://image.tmdb.org/t/p/w500/rAGiXaUfPzY7CDEyNKUofk3Kw2e.jpg",
  "genre": "Action",
  "about": "The Avengers are divided into two factions led by Iron Man and Captain America over government control.",
  "cast": ["Chris Evans", "Robert Downey Jr.", "Scarlett Johansson"]
},
{
  "title": "Guardians of the Galaxy",
  "image": "https://image.tmdb.org/t/p/w500/r7vmZjiyZw9rpJMQJdXpjgiCOk9.jpg",
  "genre": "Sci-Fi",
  "about": "A group of intergalactic criminals must work together to stop a powerful villain.",
  "cast": ["Chris Pratt", "Zoe Saldana", "Dave Bautista"]
},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      title: Text('MOVIEX'),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          movies[0]["image"],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 15,
                    child: Text(
                      movies[0]["title"],
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 20),

               Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Trending 🔥",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),

               SizedBox(height: 10),

              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingMovies.length,
                  itemBuilder: (context, index) {
                    final movie = trendingMovies[index];

                    return Container(
                      width: 140,
                      margin:  EdgeInsets.only(left: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          movie["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

               SizedBox(height: 20),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "All Movies",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),

               SizedBox(height: 15),
              GridView.builder(
                padding:  EdgeInsets.all(15),
                shrinkWrap: true,
                physics:  NeverScrollableScrollPhysics(),
                itemCount: movies.length,
                gridDelegate:
                     SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 13,
                ),
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsScreen(movie: movie),
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
                            bottom: 9,
                            left: 9,
                            child: Text(
                              movie["title"],
                              style:
                                   TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}