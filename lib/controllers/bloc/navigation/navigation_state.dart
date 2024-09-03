part of 'navigation_cubit.dart';

@immutable
class NavigationState {
  final int currentIndex;
  const NavigationState({
    required this.currentIndex,
  });
}

final class NavigationInitial extends NavigationState {
  const NavigationInitial({required super.currentIndex});
}
