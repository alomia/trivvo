import 'package:trivvo/infrastructure/models/models.dart';

class TmdbGenreListResponse {
    final List<GenreTmdb> genres;

    TmdbGenreListResponse({
        required this.genres,
    });

    factory TmdbGenreListResponse.fromJson(Map<String, dynamic> json) => TmdbGenreListResponse(
        genres: List<GenreTmdb>.from(json["genres"].map((x) => GenreTmdb.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    };
}
