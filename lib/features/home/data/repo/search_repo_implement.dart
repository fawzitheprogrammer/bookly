import 'package:bookly/core/api_service.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplement implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplement({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> search(searchQuery) async {
    try {
      var data = await apiService.getData(endPoint: 'volumes?q=$searchQuery');

      List<BookModel> books = [];

      for (var book in data['items']) {
        books.add(
          BookModel.fromJson(book),
        );
      }

      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(failureMessage: e.toString()));
    }
  }
}
