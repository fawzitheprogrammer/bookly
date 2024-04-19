import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

   SearchRepo searchRepo;

  Future<void> searchForBook(searchQuery) async {
    emit(SearchLoading());
    var result = await searchRepo.search(searchQuery);
    result.fold(
      (failure) => emit(SearchFailure(failure.failureMessage)),
      (books) => emit(
        SearchSuccess(books: books),
      ),
    );
  }
}
