import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oneo_order/component/component.dart';
import 'package:oneo_order/cubit/get_data/get_data_cubit.dart';
import 'package:oneo_order/cubit/get_data/get_data_state.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetData, GetDataStates>(
      builder: (context, state) {
        if (state is NewsGetBusinessLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is NewsGetBusinessSuccessState) {
          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleItem(
                  BlocProvider.of<GetData>(context).business[index]),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: 10);
        } else if (state is NewsGetBusinessFailureState) {
          return Text(state.error);
        }
        return const Text('SomeThing wrong');
      },
    );
  }
}
