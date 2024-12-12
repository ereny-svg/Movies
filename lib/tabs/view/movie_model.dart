class MovieModel {
  String id;
  String title;
  String overview;
  String backImageName;
  String posterImageName;
  DateTime date;
  String vote;
  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.backImageName,
    required this.posterImageName,
    required this.vote,
    required this.date,
  });
}
