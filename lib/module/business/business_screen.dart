import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oneo_order/component/component.dart';
import 'package:oneo_order/cubit/cubit.dart';
import 'package:oneo_order/cubit/state.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildArticleItem(),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: 10);
      },
      listener: (context, state) {},
    );
  }
}
