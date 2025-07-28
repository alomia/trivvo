import 'package:trivvo/infrastructure/models/models.dart';

class TmdbCreditsResponse {
    final List<CastTmdb> cast;
    final List<CastTmdb> crew;

    TmdbCreditsResponse({
        required this.cast,
        required this.crew,
    });

    factory TmdbCreditsResponse.fromJson(Map<String, dynamic> json) => TmdbCreditsResponse(
        cast: List<CastTmdb>.from(json["cast"].map((x) => CastTmdb.fromJson(x))),
        crew: List<CastTmdb>.from(json["crew"].map((x) => CastTmdb.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
    };
}
