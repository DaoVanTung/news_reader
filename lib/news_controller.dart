import 'dart:convert';

import 'news_model.dart';
import 'news_service.dart';

class NewsController {
  NewsController._();
  static NewsController? _instance;
  factory NewsController() {
    _instance ??= NewsController._();
    return _instance!;
  }

  final model = NewsModel();
  final service = NewsService();

  Future<void> fetchNews() async {
    final response = await service.fetchNews();
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      for (final article in body['articles']) {
        model.articles.add(Article.fromMap(article));
      }
    }
  }
}
