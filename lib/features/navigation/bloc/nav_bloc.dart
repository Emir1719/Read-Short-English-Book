import 'package:english_will_fly/features/navigation/model/navbar_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(const NavState(NavbarItem.home)) {
    on<ChangeView>(changeView);
  }

  Future<void> changeView(ChangeView event, emit) async {
    try {
      var item = NavbarItem.values.firstWhere((element) => element.pageIndex == event.index);
      emit(NavState(item));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
