import 'package:ecommerce/presentation/components/screens/favorites_screen.dart';
import 'package:ecommerce/presentation/components/screens/home_screen.dart';
import 'package:ecommerce/presentation/controller/navbar/navbar_event.dart';
import 'package:ecommerce/presentation/controller/navbar/navbar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitial()) {
    on<ChangeTabEvent>((event, emit) {
      emit(NavbarUpdated(event.newIndex));
    });
  }


  final List<Widget> screens = [
    HomeScreen(),
    FavoritesScreen(),
  ];
}