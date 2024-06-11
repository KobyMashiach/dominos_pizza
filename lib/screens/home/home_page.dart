import 'package:dominos_pizza/screens/home/bloc/home_bloc.dart';
import 'package:dominos_pizza/widgets/cards/category_card.dart';
import 'package:dominos_pizza/widgets/general/appbar.dart';
import 'package:dominos_pizza/widgets/general/circular_progress_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeEventInitialize()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: appAppBar(title: "home"),
            body: state is HomeLoadingState
                ? Center(child: CircularProgressImage())
                : Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.formatMap.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 24),
                      itemBuilder: (context, index) {
                        final category =
                            state.formatMap.values.elementAt(index);
                        return CategoryCard(category: category, height: 150);
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
