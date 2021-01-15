class PersonModel {
  final int id;
  final double popularity;
  final String name;
  final String profileImg;
  final String known;

  PersonModel(
      {this.id, this.popularity, this.name, this.profileImg, this.known});

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        id: json["id"],
        popularity: json["popularity"],
        name: json["name"],
        profileImg: json["profile_path"],
        known: json["known_for_department"],
      );
}
