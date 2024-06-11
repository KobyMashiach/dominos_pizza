import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dominos_pizza/models/category/category_model.dart';
import 'package:dominos_pizza/tests/map_test.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Map<String, CategoryModel> formatMap = {};
  HomeBloc() : super(HomeLoadingState(formatMap: {})) {
    on<HomeEventInitialize>(_homeEventInitialize);
  }

  FutureOr<void> _homeEventInitialize(
      HomeEventInitialize event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState(formatMap: {}));
    await Future.delayed(Duration(seconds: 1)); //TODO: delete this
    formatMap = jsonMap.map(
      (key, value) => MapEntry(key, CategoryModel.fromJson(value)),
    );
    emit(HomeInitial(formatMap: formatMap));
  }
}
