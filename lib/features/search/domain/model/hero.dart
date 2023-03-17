class MarvelHero {
  final String name;
  final String description;
  final String thumbnail;
  final List<String> comics;
  final List<String> series;
  final List<String> stories;
  final List<String> events;
  final String? detail;
  final String? comiclink;
  final String? wiki;

  MarvelHero({
    required this.name, 
    required this.description, 
    required this.thumbnail, 
    required this.comics, 
    required this.series, 
    required this.stories, 
    required this.events, 
    required this.detail, 
    required this.comiclink, 
    required this.wiki});
}