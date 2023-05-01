import 'package:epam_test/src/data/datasources/remote_datasource/news_api_service.dart';
import 'package:epam_test/src/domain/models/responses/breaking_news_response.dart';
import 'package:epam_test/src/domain/models/requests/braking_news_request.dart';
import 'package:epam_test/src/domain/repositories/api_repository.dart';
import 'package:epam_test/src/utils/resources/data_state.dart';

import '../datasources/remote_datasource/base/base_api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final NewsApiService _newsApiService;

  ApiRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<BreakingNewsResponse>> getBreakingNewsArticles(
      {required BreakingNewsRequest request}) {
    return getStateOf<BreakingNewsResponse>(
      request: () => _newsApiService.getBreakingNewsArticles(
        apiKey: request.apiKey,
        country: request.country,
        category: request.category,
        pageSize: request.pageSize,
        page: request.page,
      ),
    );
  }
}
