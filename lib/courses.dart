class Courses {
  final String searchBar;


  Courses({
    required this.searchBar,
  });

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(searchBar: json['searchBar']);
}