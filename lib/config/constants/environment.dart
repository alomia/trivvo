import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String tmdbApiKey = dotenv.get('TMDB_API_KEY');
}
