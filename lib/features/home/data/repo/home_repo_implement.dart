import 'package:bookly/core/api_service.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplement implements HomeRep {
  final ApiService apiService;

  HomeRepoImplement({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.getData(
          endPoint: 'volumes?Filtering=paid-ebooks&q=computer science');

      List<BookModel> books = [];

      for (var book in data['items']) {
        print(book);
        books.add(BookModel.fromJson(book));
      }

      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(failureMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.getData(
          endPoint: 'volumes?Filtering=paid-ebooks&q=computer science');

      List<BookModel> books = [];

      for (var book in data['items']) {
        print(book);
        books.add(BookModel.fromJson(book));
      }

      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(failureMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(category) async {
    try {
      var data = await apiService.getData(
          endPoint: 'volumes?Sorting=relevance&q=$category');

      List<BookModel> books = [];

      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
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
