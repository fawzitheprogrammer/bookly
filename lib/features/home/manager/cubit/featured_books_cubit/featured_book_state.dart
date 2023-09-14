part of 'featured_book_cubit.dart';

abstract class FeaturedBookState extends Equatable {
  const FeaturedBookState();

  @override
  List<Object> get props => [];
}

final class FeaturedBookInitial extends FeaturedBookState {}

final class FeaturedBookLoading extends FeaturedBookState {}

final class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookModel> featuredBooks;

  const FeaturedBookSuccess({required this.featuredBooks});
}

final class FeaturedBookFailure extends FeaturedBookState {
  final String failureMessage;

  const FeaturedBookFailure({required this.failureMessage});
}
