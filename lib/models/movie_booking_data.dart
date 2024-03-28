class MovieBookingData {
  final String title;
  final String storyLine;
  final String imageUrl; // Assuming you have an image URL
  final List<Session> sessions;

  const MovieBookingData({
    required this.title,
    required this.storyLine,
    required this.imageUrl,
    required this.sessions,
  });
}

class Session {
  final String date;
  final List<String> times;

  const Session({
    required this.date,
    required this.times,
  });
}
