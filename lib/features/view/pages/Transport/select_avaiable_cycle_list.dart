// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rideshare_app/core/res/app_color.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/core/res/app_style.dart';
import 'package:rideshare_app/features/view/bloc/app_bloc/app_bloc.dart';
import 'package:rideshare_app/features/view/widget/avaiable_cycle_list.dart';
import 'package:rideshare_app/features/view/widget/button_widget.dart';

class SelectAvaiableCycleList extends StatelessWidget {
  String category;
  SelectAvaiableCycleList({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppBloc()..add(GetBicyclebyCategoryEvent(category: category)),
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(),
            body: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                if (state is SuccessToGetBicycles) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString().AVAIABLECYCLE,
                            style: titleStyle,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Text('18 cars found'),
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: state.bicycles.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AvaiableCycleList(
                                      nameCycle: state
                                          .bicycles[index].modelPrice.model,
                                      feature1: 'auto',
                                      feature2: '2 seats',
                                      image: state.bicycles[index].photoPath,
                                    ),
                                  );
                                }),
                          )
                        ]),
                  );
                } else if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ErrorState) {
                  return const Text("There is an Error");
                } else {
                  return const Icon(Icons.error);
                }
              },
            ));
      }),
    );
  }
}
