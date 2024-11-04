import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/article.dart';
import '../repositories/article_repository.dart';

class ArticleNotifier extends Notifier<List<Article>> {
  final ArticleRepository articleRepository = ArticleRepository();
  @override
  List<Article> build() {
    state=[];
    initializeAccounts();
    return state;
  }

  Future<void> initializeAccounts() async {
    List<Article> articles = await articleRepository.getArticles();
    state = articles;
    print(state);
  }

  void addArticle(Article article) {
    state = [...state, article];
  }
  List<Article> searchByCategory(String category){
    if(category.isEmpty){
      return state;
    }
    return state.where((article)=>article.category.contains(category)).toList();
  }
} // ArticleNotifier

final articleNotifierProvider =
    NotifierProvider<ArticleNotifier, List<Article>>(() => ArticleNotifier());
