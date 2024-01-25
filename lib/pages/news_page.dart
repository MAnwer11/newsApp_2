import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search_rounded)),
              ],
              title: const Text('News App'),
            ),
            body: BlocProvider.of<NewsCubit>(context).screens[cubit.],
            //cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: BlocProvider.of<NewsCubit>(context).bottomsItem,
              currentIndex: BlocProvider.of<NewsCubit>(context).currentIndex,
              onTap: (index) {
                BlocProvider.of<NewsCubit>(context).changeBottomNavBar(index);
              },
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
