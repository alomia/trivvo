import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class FavoriteMovies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get movieId => text().named('movie_id')();
  TextColumn get backdropPath => text().named('backdrop_path')();
  TextColumn get posterPath => text().named('poster_path')();
}

@DriftDatabase(tables: [FavoriteMovies])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'trivvo_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}

final database = AppDatabase();
