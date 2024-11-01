part of 'on_boarding_cubit.dart';

@freezed
class OnBoardingState with _$OnBoardingState {
  const factory OnBoardingState.initial() = _Initial;
  const factory OnBoardingState.skip() = Skip;
  const factory OnBoardingState.next() = Next;
  const factory OnBoardingState.back() = Back;
  const factory OnBoardingState.getStarted() = GetStarted;
  const factory OnBoardingState.pageChanged() = PageChanged;
}
