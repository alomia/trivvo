// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FavoriteMoviesTable extends FavoriteMovies
    with TableInfo<$FavoriteMoviesTable, FavoriteMovy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteMoviesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _movieIdMeta = const VerificationMeta(
    'movieId',
  );
  @override
  late final GeneratedColumn<String> movieId = GeneratedColumn<String>(
    'movie_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _backdropPathMeta = const VerificationMeta(
    'backdropPath',
  );
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
    'backdrop_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _posterPathMeta = const VerificationMeta(
    'posterPath',
  );
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
    'poster_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, movieId, backdropPath, posterPath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_movies';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteMovy> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('movie_id')) {
      context.handle(
        _movieIdMeta,
        movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta),
      );
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
        _backdropPathMeta,
        backdropPath.isAcceptableOrUnknown(
          data['backdrop_path']!,
          _backdropPathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
        _posterPathMeta,
        posterPath.isAcceptableOrUnknown(data['poster_path']!, _posterPathMeta),
      );
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteMovy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteMovy(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      movieId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}movie_id'],
      )!,
      backdropPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backdrop_path'],
      )!,
      posterPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}poster_path'],
      )!,
    );
  }

  @override
  $FavoriteMoviesTable createAlias(String alias) {
    return $FavoriteMoviesTable(attachedDatabase, alias);
  }
}

class FavoriteMovy extends DataClass implements Insertable<FavoriteMovy> {
  final int id;
  final String movieId;
  final String backdropPath;
  final String posterPath;
  const FavoriteMovy({
    required this.id,
    required this.movieId,
    required this.backdropPath,
    required this.posterPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['movie_id'] = Variable<String>(movieId);
    map['backdrop_path'] = Variable<String>(backdropPath);
    map['poster_path'] = Variable<String>(posterPath);
    return map;
  }

  FavoriteMoviesCompanion toCompanion(bool nullToAbsent) {
    return FavoriteMoviesCompanion(
      id: Value(id),
      movieId: Value(movieId),
      backdropPath: Value(backdropPath),
      posterPath: Value(posterPath),
    );
  }

  factory FavoriteMovy.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteMovy(
      id: serializer.fromJson<int>(json['id']),
      movieId: serializer.fromJson<String>(json['movieId']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'movieId': serializer.toJson<String>(movieId),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'posterPath': serializer.toJson<String>(posterPath),
    };
  }

  FavoriteMovy copyWith({
    int? id,
    String? movieId,
    String? backdropPath,
    String? posterPath,
  }) => FavoriteMovy(
    id: id ?? this.id,
    movieId: movieId ?? this.movieId,
    backdropPath: backdropPath ?? this.backdropPath,
    posterPath: posterPath ?? this.posterPath,
  );
  FavoriteMovy copyWithCompanion(FavoriteMoviesCompanion data) {
    return FavoriteMovy(
      id: data.id.present ? data.id.value : this.id,
      movieId: data.movieId.present ? data.movieId.value : this.movieId,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      posterPath: data.posterPath.present
          ? data.posterPath.value
          : this.posterPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteMovy(')
          ..write('id: $id, ')
          ..write('movieId: $movieId, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('posterPath: $posterPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, movieId, backdropPath, posterPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteMovy &&
          other.id == this.id &&
          other.movieId == this.movieId &&
          other.backdropPath == this.backdropPath &&
          other.posterPath == this.posterPath);
}

class FavoriteMoviesCompanion extends UpdateCompanion<FavoriteMovy> {
  final Value<int> id;
  final Value<String> movieId;
  final Value<String> backdropPath;
  final Value<String> posterPath;
  const FavoriteMoviesCompanion({
    this.id = const Value.absent(),
    this.movieId = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.posterPath = const Value.absent(),
  });
  FavoriteMoviesCompanion.insert({
    this.id = const Value.absent(),
    required String movieId,
    required String backdropPath,
    required String posterPath,
  }) : movieId = Value(movieId),
       backdropPath = Value(backdropPath),
       posterPath = Value(posterPath);
  static Insertable<FavoriteMovy> custom({
    Expression<int>? id,
    Expression<String>? movieId,
    Expression<String>? backdropPath,
    Expression<String>? posterPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (movieId != null) 'movie_id': movieId,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (posterPath != null) 'poster_path': posterPath,
    });
  }

  FavoriteMoviesCompanion copyWith({
    Value<int>? id,
    Value<String>? movieId,
    Value<String>? backdropPath,
    Value<String>? posterPath,
  }) {
    return FavoriteMoviesCompanion(
      id: id ?? this.id,
      movieId: movieId ?? this.movieId,
      backdropPath: backdropPath ?? this.backdropPath,
      posterPath: posterPath ?? this.posterPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (movieId.present) {
      map['movie_id'] = Variable<String>(movieId.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteMoviesCompanion(')
          ..write('id: $id, ')
          ..write('movieId: $movieId, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('posterPath: $posterPath')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteMoviesTable favoriteMovies = $FavoriteMoviesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteMovies];
}

typedef $$FavoriteMoviesTableCreateCompanionBuilder =
    FavoriteMoviesCompanion Function({
      Value<int> id,
      required String movieId,
      required String backdropPath,
      required String posterPath,
    });
typedef $$FavoriteMoviesTableUpdateCompanionBuilder =
    FavoriteMoviesCompanion Function({
      Value<int> id,
      Value<String> movieId,
      Value<String> backdropPath,
      Value<String> posterPath,
    });

class $$FavoriteMoviesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteMoviesTable> {
  $$FavoriteMoviesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get movieId => $composableBuilder(
    column: $table.movieId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteMoviesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteMoviesTable> {
  $$FavoriteMoviesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get movieId => $composableBuilder(
    column: $table.movieId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteMoviesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteMoviesTable> {
  $$FavoriteMoviesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get movieId =>
      $composableBuilder(column: $table.movieId, builder: (column) => column);

  GeneratedColumn<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => column,
  );
}

class $$FavoriteMoviesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteMoviesTable,
          FavoriteMovy,
          $$FavoriteMoviesTableFilterComposer,
          $$FavoriteMoviesTableOrderingComposer,
          $$FavoriteMoviesTableAnnotationComposer,
          $$FavoriteMoviesTableCreateCompanionBuilder,
          $$FavoriteMoviesTableUpdateCompanionBuilder,
          (
            FavoriteMovy,
            BaseReferences<_$AppDatabase, $FavoriteMoviesTable, FavoriteMovy>,
          ),
          FavoriteMovy,
          PrefetchHooks Function()
        > {
  $$FavoriteMoviesTableTableManager(
    _$AppDatabase db,
    $FavoriteMoviesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteMoviesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteMoviesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteMoviesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> movieId = const Value.absent(),
                Value<String> backdropPath = const Value.absent(),
                Value<String> posterPath = const Value.absent(),
              }) => FavoriteMoviesCompanion(
                id: id,
                movieId: movieId,
                backdropPath: backdropPath,
                posterPath: posterPath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String movieId,
                required String backdropPath,
                required String posterPath,
              }) => FavoriteMoviesCompanion.insert(
                id: id,
                movieId: movieId,
                backdropPath: backdropPath,
                posterPath: posterPath,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteMoviesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteMoviesTable,
      FavoriteMovy,
      $$FavoriteMoviesTableFilterComposer,
      $$FavoriteMoviesTableOrderingComposer,
      $$FavoriteMoviesTableAnnotationComposer,
      $$FavoriteMoviesTableCreateCompanionBuilder,
      $$FavoriteMoviesTableUpdateCompanionBuilder,
      (
        FavoriteMovy,
        BaseReferences<_$AppDatabase, $FavoriteMoviesTable, FavoriteMovy>,
      ),
      FavoriteMovy,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteMoviesTableTableManager get favoriteMovies =>
      $$FavoriteMoviesTableTableManager(_db, _db.favoriteMovies);
}
