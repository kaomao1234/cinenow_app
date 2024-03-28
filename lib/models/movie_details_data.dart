class MovieDetailsData {
  final String storyLine;
  final String director;
  final String writers;
  final String stars;
  final String trailerUrl;
  final String imageUrl; // Assuming you have an image URL
  MovieDetailsData(
      {required this.storyLine,
      required this.director,
      required this.writers,
      required this.stars,
      required this.trailerUrl,
      required this.imageUrl});
}
