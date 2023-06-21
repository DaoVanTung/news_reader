import 'package:http/http.dart' as http;

class NewsService {
  NewsService._();
  static NewsService? _instance;
  factory NewsService() {
    _instance ??= NewsService._();
    return _instance!;
  }

  Future<http.Response> fetchNews() async {
    // https://newsapi.org/v2/top-headlines?country=us&apiKey=API_KEY
    final uri = Uri.https(
      'newsapi.org',
      '/v2/top-headlines',
      {
        'country': 'us',
        'apiKey': 'f8bb7a44a3a54ddc8a3025e0e72c6b67',
      },
    );

    final response = await http.get(uri);
    return response;
  }
}
