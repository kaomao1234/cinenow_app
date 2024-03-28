import 'package:cinenow_app/models/index.dart';

class MovieViewModel {
  MovieBookingData bookingData = const MovieBookingData(
      title: 'Interstellar',
      storyLine:
          "Earth's future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind's survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life.",
      imageUrl: "assets/images/interstellar.jpg",
      sessions: [
        Session(date: "Sat\n09/02", times: ["14:00"]),
        Session(date: "Sun\n10/02", times: ["16:00"]),
        Session(date: "Mon\n11/02", times: ["20:00"]),
        Session(date: "Tue\n12/02", times: ["19:00"]),
        Session(date: "Wed\n13/02", times: ["20:00"])
      ]);
  MovieDetailsData detailsData = MovieDetailsData(
      storyLine:
          "Earth's future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind's survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life.",
      director: "Christopher Nolan",
      writers: "Jonathan Nolan, Christopher Nolan",
      stars: "Matthew McConaughey , Anne Hathaway,Jessica Chastain",
      trailerUrl: "zSWdZVtXT7E",
      imageUrl: "assets/images/interstellar.jpg");
}
