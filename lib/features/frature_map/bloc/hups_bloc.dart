import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_app/features/frature_map/data/hups_servies.dart';

import '../data/model/hups_model.dart';

part 'hups_event.dart';
part 'hups_state.dart';

class HupsBloc extends Bloc<HupsEvent, HupsState> {
  HupsBloc() : super(HupsInitial()) {
    on<GetHups>((event, emit) async {
      emit(LoadingState());

      try {
        final result = await fetchHupsModel(
          latitude: event.latitude,
          longitude: event.longitude,
        );
        emit(SuccessToGetHups(hups: result));
      } catch (e) {
        emit(ErrorState(errorMessage: e.toString()));
      }
    });
  }
}
