import 'package:ecommerce/presentation/controller/navbar/navbar_bloc.dart';
import 'package:ecommerce/presentation/controller/navbar/navbar_event.dart';
import 'package:ecommerce/presentation/controller/navbar/navbar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarBloc, NavbarState>(
      builder: (context, navbarState) {
        return Scaffold(
          body: SafeArea(child: NavbarBloc().screens[navbarState.currentIndex]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navbarState.currentIndex,
            onTap: (index) {
              context.read<NavbarBloc>().add(ChangeTabEvent(index));
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorites",
              ),
            ],
          ),
        );
      },
    );
  }
}
