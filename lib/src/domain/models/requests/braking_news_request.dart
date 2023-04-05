class BreakingNewsRequest {
  final String apiKey;
  final String country;
  final String category;
  final int pageSize;
  final int page;

  BreakingNewsRequest({
    this.apiKey = '376fe50f2ad5497098d0db37a30e2c43',
    this.country = 'us',
    this.category = 'general',
    this.pageSize = 20,
    this.page = 1,
});
}
