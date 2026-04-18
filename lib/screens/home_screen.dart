import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Map<String, dynamic>> movies = const [
  {
    "title": "Inception",
    "image": "https://image.tmdb.org/t/p/w500/8IB2e4r4oVhHnANbnm7O3Tj6tF8.jpg",
    "genre": "Sci-Fi",
    "about":
        "Inception is a mind-bending sci-fi thriller directed by Christopher Nolan. The story follows Dom Cobb, a skilled thief who enters the dreams of others to steal secrets. He is offered a chance to have his criminal record erased if he can successfully plant an idea into someone's subconscious mind — a process known as inception. As the team dives deeper into layered dreams, reality begins to blur, leading to emotional struggles, intense action, and psychological twists.",
    "cast": ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Elliot Page", "Tom Hardy"]
  },
  {
    "title": "Interstellar",
    "image": "https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg",
    "genre": "Sci-Fi",
    "about":
        "Interstellar is an epic science fiction film that explores space travel, love, and survival. Earth is becoming uninhabitable, so a group of astronauts travels through a wormhole near Saturn in search of a new home for humanity. The story focuses on Cooper, a former pilot who leaves his family behind to save mankind. The movie beautifully blends emotional family drama with complex scientific concepts like relativity and black holes.",
    "cast": ["Matthew McConaughey", "Anne Hathaway", "Jessica Chastain", "Michael Caine"]
  },
  {
    "title": "Avengers",
    "image": "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
    "genre": "Action",
    "about":
        "The Avengers brings together Earth's mightiest heroes to fight powerful enemies that no single hero can defeat. When Loki threatens to take over Earth using an alien army, Nick Fury assembles Iron Man, Captain America, Thor, Hulk, Black Widow, and Hawkeye. The film showcases teamwork, sacrifice, and epic battles that define the Marvel Cinematic Universe.",
    "cast": ["Robert Downey Jr.", "Chris Evans", "Chris Hemsworth", "Scarlett Johansson"]
  },
  {
    "title": "Joker",
    "image": "https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
    "genre": "Drama",
    "about":
        "Joker is a dark psychological drama that explores the origin of Gotham City's most infamous villain. Arthur Fleck, a struggling comedian with mental health issues, faces constant rejection and cruelty from society. As his life spirals out of control, he transforms into the Joker, symbolizing chaos and rebellion against social injustice.",
    "cast": ["Joaquin Phoenix", "Robert De Niro", "Zazie Beetz"]
  },
  {
    "title": "John Wick",
    "image": "https://image.tmdb.org/t/p/w500/fZPSd91yGE9fCcCe6OoQr6E3Bev.jpg",
    "genre": "Action",
    "about":
        "John Wick is a stylish action thriller about a retired assassin who is forced back into the criminal underworld after the loss of something deeply personal. Known for its intense fight choreography and gun-fu action style, the film follows Wick as he takes revenge against those who wronged him, facing dangerous organizations and elite killers.",
    "cast": ["Keanu Reeves", "Ian McShane", "Willem Dafoe"]
  },

  {
    "title": "The Dark Knight",
    "image": "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
    "genre": "Action",
    "about":
        "The Dark Knight is a gripping superhero film where Batman faces his greatest challenge yet — the Joker. The Joker brings chaos to Gotham City, testing Batman’s limits, morals, and sense of justice. As crime rises and fear spreads, Batman must decide how far he is willing to go to save the city without becoming a monster himself.",
    "cast": ["Christian Bale", "Heath Ledger", "Aaron Eckhart", "Michael Caine"]
  },
  {
    "title": "Doctor Strange",
    "image": "https://image.tmdb.org/t/p/w500/uGBVj3bEbCoZbDjjl9wTxcygko1.jpg",
    "genre": "Fantasy",
    "about":
        "Doctor Strange follows the journey of Stephen Strange, a talented but arrogant surgeon whose life changes after a devastating accident. Searching for healing, he discovers the world of magic and alternate dimensions. He becomes a powerful sorcerer and learns to protect Earth from mystical threats beyond human understanding.",
    "cast": ["Benedict Cumberbatch", "Rachel McAdams", "Chiwetel Ejiofor", "Benedict Wong"]
  },
  {
    "title": "Black Panther",
    "image": "https://image.tmdb.org/t/p/w500/uxzzxijgPIY7slzFvMotPv8wjKA.jpg",
    "genre": "Action",
    "about":
        "Black Panther tells the story of T’Challa, who returns to Wakanda after his father’s death to take the throne. As the new king, he must protect his advanced nation from enemies who seek its powerful resources. He faces internal and external threats while learning what it truly means to be a leader and protector.",
    "cast": ["Chadwick Boseman", "Michael B. Jordan", "Lupita Nyong'o", "Danai Gurira"]
  },
  {
    "title": "Thor",
    "image": "https://image.tmdb.org/t/p/w500/prSfAi1xGrhLQNxVSUFh61xQ4Qy.jpg",
    "genre": "Fantasy",
    "about":
        "Thor is the story of the powerful god of thunder who is cast out of Asgard for his arrogance. Stripped of his powers and sent to Earth, he learns humility and what it means to be worthy. Meanwhile, dark forces threaten both Earth and Asgard, forcing Thor to rise as a true hero.",
    "cast": ["Chris Hemsworth", "Natalie Portman", "Tom Hiddleston", "Anthony Hopkins"]
  },
  {
    "title": "Iron Man",
    "image": "https://image.tmdb.org/t/p/w500/78lPtwv72eTNqFW9COBYI0dWDJa.jpg",
    "genre": "Action",
    "about":
        "Iron Man follows Tony Stark, a billionaire genius who is kidnapped and forced to build a weapon. Instead, he creates a powerful armored suit and escapes. Realizing the destruction caused by his company’s weapons, he decides to become a hero and protect the world using his technology.",
    "cast": ["Robert Downey Jr.", "Gwyneth Paltrow", "Jeff Bridges", "Jon Favreau"]
  },
  {
    "title": "Avatar",
    "image": "https://image.tmdb.org/t/p/w500/kyeqWdyUXW608qlYkRqosgbbJyK.jpg",
    "genre": "Sci-Fi",
    "about":
        "Avatar is set on the alien world of Pandora, where humans mine valuable resources. A paraplegic marine named Jake Sully is sent to interact with the native Na’vi people using an avatar body. As he connects with their culture, he is forced to choose between loyalty to humans and protecting Pandora.",
    "cast": ["Sam Worthington", "Zoe Saldana", "Sigourney Weaver", "Stephen Lang"]
  },
  {
    "title": "Frozen",
    "image": "https://image.tmdb.org/t/p/w500/mbPrrbt8bSLcHSBCHnRclPlMZPl.jpg",
    "genre": "Animation",
    "about":
        "Frozen tells the story of two royal sisters, Elsa and Anna. Elsa has magical ice powers she struggles to control, which accidentally traps the kingdom in eternal winter. Anna embarks on a journey to bring her sister back and save their home, discovering the power of love and family.",
    "cast": ["Idina Menzel", "Kristen Bell", "Jonathan Groff", "Josh Gad"]
  },
  {
    "title": "Minions",
    "image": "https://image.tmdb.org/t/p/w500/vlOgaxUiMOA8sPDG9n3VhQabnEi.jpg",
    "genre": "Comedy",
    "about":
        "Minions follows the funny yellow creatures who have existed since the beginning of time, always searching for the most evil master to serve. Their journey takes them through different eras, leading to chaotic and hilarious adventures as they try to find their purpose in the world.",
    "cast": ["Pierre Coffin", "Sandra Bullock", "Jon Hamm", "Michael Keaton"]
  },
  {
    "title": "Fast & Furious",
    "image": "https://image.tmdb.org/t/p/w500/2DyEk84XnbJEdPlGF43crxfdtHH.jpg",
    "genre": "Action",
    "about":
        "Fast & Furious is an action-packed franchise centered around street racing, family bonds, and dangerous missions. Dominic Toretto and his crew take on global threats, performing high-speed stunts and risky heists. The series emphasizes loyalty, teamwork, and adrenaline-fueled action.",
    "cast": ["Vin Diesel", "Paul Walker", "Michelle Rodriguez", "Dwayne Johnson"]
  },
  {
    "title": "The Lion King",
    "image": "https://image.tmdb.org/t/p/w500/2bXbqYdUdNVa8VIWXVfclP2ICtT.jpg",
    "genre": "Animation",
    "about":
        "The Lion King follows Simba, a young lion prince who must take his rightful place as king. After the tragic loss of his father, Simba runs away in fear. With guidance from new friends, he learns responsibility and courage, eventually returning to reclaim his throne.",
    "cast": ["Matthew Broderick", "James Earl Jones", "Jeremy Irons", "Nathan Lane"]
  },
  {
    "title": "Venom",
    "image": "https://image.tmdb.org/t/p/w500/2uNW4WbgBXL25BAbXGLnLqX71Sw.jpg",
    "genre": "Action",
    "about":
        "Venom tells the story of Eddie Brock, a journalist who becomes bonded with an alien symbiote. The symbiote gives him superhuman powers but also has its own dark personality. Together, they must learn to coexist while fighting dangerous enemies.",
    "cast": ["Tom Hardy", "Michelle Williams", "Riz Ahmed", "Woody Harrelson"]
  }
];

  String searchText = "";

  @override
  Widget build(BuildContext context) {

    final filteredMovies = movies.where((movie) {
      return movie["title"]!
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title:  Text("MOVIEX"),
        actions: [
          IconButton(
            icon:  Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) =>  FavoritesScreen()),
              );
            },
          )
        ],
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
              decoration:  InputDecoration(
                hintText: "Search movies...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              itemCount: filteredMovies.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final movie = filteredMovies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(movie: movie),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            movie["image"]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(movie["title"]!),
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