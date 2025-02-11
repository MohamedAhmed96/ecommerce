abstract class NavbarEvent {}

class ChangeTabEvent extends NavbarEvent {
  final int newIndex;
  ChangeTabEvent(this.newIndex);
}