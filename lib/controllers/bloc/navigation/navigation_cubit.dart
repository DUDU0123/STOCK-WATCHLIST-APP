import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationInitial(currentIndex: 0));
  void selectCurrentIndex({required int currentIndex}){
    emit(NavigationState(currentIndex: currentIndex));
  }
}
