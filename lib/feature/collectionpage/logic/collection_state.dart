part of 'collection_cubit.dart';

sealed class CollectionState extends Equatable {
  const CollectionState();

  @override
  List<Object> get props => [];
}

final class CollectionInitial extends CollectionState {}

final class CollectionLoadingState extends CollectionState {}

final class CollectionSucessState extends CollectionState {
  final List<CollectionModel> collections;

  const CollectionSucessState({required this.collections});
  @override
  List<Object> get props => [collections];
}

class CollectionError extends CollectionState {
  final String message;

  const CollectionError({required this.message});

  @override
  List<Object> get props => [message];
}
