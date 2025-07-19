class GenreTmdb {
  final int id;
    final String name;

    GenreTmdb({
        required this.id,
        required this.name,
    });

    factory GenreTmdb.fromJson(Map<String, dynamic> json) => GenreTmdb(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
