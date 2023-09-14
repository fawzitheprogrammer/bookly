import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/book_model/book_model.dart';
import '../../../data/repo/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRep homeRepo;

  Future<void> getSimilarBooks(String category) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category);
    result.fold((failure) {
      emit(
        SimilarBooksFailure(
          failure.failureMessage,
        ),
      );
    }, (books) {
      emit(
        SimilarBooksSuccess(books: books),
      );
    });
  }
}
