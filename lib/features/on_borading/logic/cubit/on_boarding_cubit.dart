import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_boarding_state.dart';
part 'on_boarding_cubit.freezed.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(const OnBoardingState.initial());

  int currentIndex = 0;

  void skip() {
    emit(const Skip());
  }

  void next() {
    emit(const Next());
  }

  void back() {
    emit(const Back());
  }

  void getStarted() {
    emit(const GetStarted());
  }

  void pageChanged(int index) {
    currentIndex = index;
    emit(const PageChanged());
  }
}
