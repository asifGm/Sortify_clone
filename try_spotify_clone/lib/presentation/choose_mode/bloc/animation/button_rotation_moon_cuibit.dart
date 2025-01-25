import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:try_spotify_clone/presentation/choose_mode/bloc/animation/button_rotation_state.dart';

class ButtonRotationMoonCuibit extends HydratedCubit<ButtonRotationState> {
  ButtonRotationMoonCuibit() : super(ButtonRotationState(0));

  void rotation() {
    emit(ButtonRotationState(state.rotate + 360));
  }

  @override
  ButtonRotationState? fromJson(Map<String, dynamic> json) {
    return null; //json['angle'];
  }

  @override
  Map<String, dynamic>? toJson(ButtonRotationState state) {
    return null; //{'angle': state};
  }
}
