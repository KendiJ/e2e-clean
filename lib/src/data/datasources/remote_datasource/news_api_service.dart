import 'package:dio/dio.dart';
import 'package:epam_test/src/domain/models/responses/breaking_news_response.dart';
import 'package:epam_test/src/utils/constants/strings.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: baseURL, parser: Parser.MapSerializable)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/v2/top-headlines')
  Future<HttpResponse<BreakingNewsResponse>> getBreakingNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
    @Query("pageSize") int? pageSize,
    @Query("page") int? page,
  });
}
