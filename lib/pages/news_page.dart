import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/news_cubit/cubit.dart';
import '../cubit/news_cubit/state.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          return Scaffold(
            // floatingActionButton: FloatingActionButton(
            // child: Icon(Icons.add),
            //onPressed: () {

            // },
            //),
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search_rounded)),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<NewsCubit>(context).changeThemeMode();
                    },
                    icon: const Icon(Icons.brightness_4_outlined)),
              ],
              title: const Text('News App'),
            ),
            body: BlocProvider.of<NewsCubit>(context)
                .screens[BlocProvider.of<NewsCubit>(context).currentIndex],
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
