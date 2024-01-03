class QuotesModel {
  int? id;
  String? quote;
  String? author;

  QuotesModel({required this.id, required this.quote, required this.author});

  factory QuotesModel.fromJson(Map<String, dynamic> json) {
    return QuotesModel(
        id: json['id'], quote: json['quote'], author: json['author']);
  }
}

class DataModel {
  int? total;
  int? skip;
  int? limit;
  List<QuotesModel>? quotes;

  DataModel({
    required this.quotes,
    required this.total,
    required this.limit,
    required this.skip,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<QuotesModel> listQuotes = [];
    for (Map<String, dynamic> eachMap in json['quotes']) {
      var eachQuotes = QuotesModel.fromJson(eachMap);
      listQuotes.add(eachQuotes);
    }
    return DataModel(
        quotes: listQuotes,
        total: json['total'],
        limit: json['limit'],
        skip: json['skip']);
  }
}
