import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:trivvo/config/database/database.dart';
import 'package:trivvo/infrastructure/datasources/datasources.dart';
import 'package:trivvo/infrastructure/repositories/repositories.dart';


part 'local_storage_provider.g.dart';

@riverpod
LocalStorageRepositoryImpl localStorageRepository (Ref ref) {
  return LocalStorageRepositoryImpl(DriftDatasource(database));
}

