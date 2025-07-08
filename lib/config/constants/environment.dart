import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String tmdbAPIKey = dotenv.get('TMDB_API_KEY');
  static String tmdbAPIReadAccessToken = dotenv.get('TMDB_API_Read_Access_Token');
}
