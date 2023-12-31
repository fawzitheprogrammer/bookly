import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../model/book_model/book_model.dart';

abstract class HomeRep {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(String category);
}
