import 'package:flutter_dotenv/flutter_dotenv.dart';

class Const {
  static final String url =
      dotenv.env['BACKEND_URL'] ?? 'http://localhost:8000';
}
