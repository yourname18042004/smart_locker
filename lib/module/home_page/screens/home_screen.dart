import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_locker/core/app/app_router.dart';
import 'package:smart_locker/module/camera/camera/screens/camera_screen.dart';
import 'package:smart_locker/module/home_page/bloc/home_bloc.dart';
import 'package:smart_locker/module/home_page/bloc/home_event.dart';
import 'package:smart_locker/module/home_page/bloc/home_state.dart';
import 'package:smart_locker/module/home_page/screens/home_page.dart';
import 'package:smart_locker/module/home_page/screens/search_package_page.dart';
import 'package:smart_locker/module/home_page/screens/setting_page.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        backgroundColor: Color(0xfffdfdfd),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                leading: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFf2f2f2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(Icons.menu),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      context.router.push(ProfileRoute());
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: 40,
                      child: Image.asset("assets/images/avata.png"),
                    ),
                  ),
                ],
                floating: true, 
                snap: true,
              ),
            ];
          },
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeChangePage) {
                return IndexedStack(
                  index: state.index,
                  children: [HomePage(), SearchPackagePage(), CameraScreen()],
                );
              }
              return HomePage();
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            int currentIndex = (state is HomeChangePage) ? state.index : 0;
            return BottomNavigationBar(
              selectedItemColor: Colors.redAccent,
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<HomeBloc>().add(ChangePage(index: index));
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Setting",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
