// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../articles.dart';

class BreakingNewsResponse extends Equatable {
  final String status;
  final int totalResults;
  final List<Articles> articles;

  const BreakingNewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });


  factory BreakingNewsResponse.fromMap(Map<String, dynamic> map) {
    return BreakingNewsResponse(
      status: map['status'] as String,
      totalResults: map['totalResults'] as int,
      articles: List<Articles>.from((map['articles'] as List<int>).map<Articles>((x) => Articles.fromMap(x as Map<String,dynamic>),),),
    );
  }


  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, totalResults, articles];
}
