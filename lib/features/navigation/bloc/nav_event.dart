part of 'nav_bloc.dart';

abstract class NavEvent extends Equatable {
  const NavEvent();

  @override
  List<Object> get props => [];
}

class ChangeView extends NavEvent {
  final int index;

  const ChangeView({required this.index});
}
