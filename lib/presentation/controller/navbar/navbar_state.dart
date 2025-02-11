abstract class NavbarState {
  final int currentIndex;
  NavbarState(this.currentIndex);
}

class NavbarInitial extends NavbarState {
  NavbarInitial() : super(0);
}

class NavbarUpdated extends NavbarState {
  NavbarUpdated(super.newIndex);
}