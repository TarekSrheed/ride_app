import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare_app/core/config/service_locater.dart';
import 'package:rideshare_app/core/res/app_images.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/view/bloc/app_bloc/app_bloc.dart';
import 'package:rideshare_app/features/view/pages/Transport/select_avaiable_cycle_list.dart';
import 'package:rideshare_app/features/view/widget/container/container_select_transport.dart';

class SelectTransport extends StatelessWidget {
  SelectTransport();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc()..add(GetBicycleCategory()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppString().SELECTTRANSPORT),
            centerTitle: true,
          ),
          body: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              if (state is SuccessToGetCategories) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    itemCount: state.categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectAvaiableCycleList(
                                  category:
                                      state.categories[index].body![index],
                                ),
                              ),
                            );
                          },
                          child: ContainerWithBorderWithBackground(
                            widget: Image.asset(cycle, width: 80, height: 80),
                            text: state.categories[index].body![index],
                          ),
                        ),
                      );
                    },
                  ),
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
          ),
        );
      }),
    );
  }
}
