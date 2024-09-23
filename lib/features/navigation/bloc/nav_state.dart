part of 'nav_bloc.dart';

class NavState extends Equatable {
  const NavState(this.navbarItem);
  final NavbarItem navbarItem;

  @override
  List<Object> get props => [navbarItem];
}
