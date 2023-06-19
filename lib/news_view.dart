import 'package:flutter/material.dart';

import 'news_controller.dart';
import 'news_model.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NewsController();
    final model = NewsModel();

    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: FutureBuilder(
        future: controller.fetchNews(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.articles.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 100,
                    width: 100,
                    child: ListTile(
                      title: Text(model.articles.elementAt(index).title ?? ''),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
