import 'package:bookly/core/api_service.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplement implements HomeRep {
  final ApiService apiService;

  HomeRepoImplement({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.getData(
          endPoint: 'volumes?Sorting=newest &q=subject:computer science');

      List<BookModel> books = [];

      for (var book in data['items']) {
        books.add(book);
      }

      return right(books);
    } on Exception {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
