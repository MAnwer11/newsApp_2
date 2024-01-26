import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oneo_order/cubit/get_data/get_data_cubit.dart';
import 'package:oneo_order/cubit/get_data/get_data_state.dart';

import '../../component/component.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetData, GetDataStates>(
      builder: (context, state) {
        if (state is NewsGetSportsLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is NewsGetSportsSuccessState) {
          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleItem(
                  BlocProvider.of<GetData>(context).sports[index]),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: 10);
        } else if (state is NewsGetSportsFailureState) {
          return Text(state.error);
        }
        return const Text('SomeThing wrong  f');
      },
    );
  }
}
