part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final Map<String, CategoryModel> formatMap;

  HomeState({required this.formatMap});
}

final class HomeInitial extends HomeState {
  HomeInitial({required super.formatMap});
}

final class HomeLoadingState extends HomeState {
  HomeLoadingState({required super.formatMap});
}
