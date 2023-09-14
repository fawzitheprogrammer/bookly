import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/book_model/book_model.dart';
import '../../../data/repo/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRep homeRepo;

  Future<void> getNewestBook() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(
        NewestBooksFailure(
          failureMessage: failure.failureMessage,
        ),
      );
    }, (books) {
      emit(
        NewestBooksSuccess(books: books),
      );
    });
  }
}
