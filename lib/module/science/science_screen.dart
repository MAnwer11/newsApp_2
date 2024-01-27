import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oneo_order/cubit/get_data/get_data_state.dart';

import '../../component/component.dart';
import '../../cubit/get_data/get_data_cubit.dart';

// up
class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetData, GetDataStates>(
      builder: (context, state) {
        var list = BlocProvider.of<GetData>(context).science;
        if (state is NewsGetScienceLoadingState) {
          return const CircularProgressIndicator();
        } else if (list.isNotEmpty) {
          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleItem(
                  BlocProvider.of<GetData>(context).science[index]),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: 10);
        } else if (state is NewsGetScienceFailureState) {
          return Text(state.error);
        }
        return const Text('SomeThing wrong');
      },
    );
  }
}
