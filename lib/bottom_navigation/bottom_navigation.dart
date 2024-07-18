import 'package:flutter/material.dart';
import 'package:realestate_moniepoint_test/utils/colors.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<BottomNavigation>
    with TickerProviderStateMixin {
  AnimationController? _navController;
  Animation<Offset>? _navAnimation;

  // Widget getViewForIndex(int index) {
  //   switch (index) {
  //     case 0:
  //       return const Home();
  //
  //     case 1:
  //       return  FavoritePage();
  //     case 2:
  //       return const CartPage();
  //     default:
  //       return const Home();
  //   }
  // }

  @override
  void initState() {
    _navController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..forward();
    _navAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.99),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _navController!,
      curve: Curves.easeIn,
    ));

    super.initState();
  }

  @override
  void dispose() {
    _navController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            //getViewForIndex(model.currentTabIndex),
            Positioned(
                bottom: 100,
                right: 10,
                left: 10,
                child: SlideTransition(
                  position: _navAnimation!,
                  textDirection: TextDirection.rtl,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                            color: Colors.black.withOpacity(.05),
                            spreadRadius: -2 // changes position of shadow
                            ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 17.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                // model.setCurrentTabTo(newTabIndex: 0);
                              },
                              child: Icon(
                                Icons.home_outlined,
                                color: AppColors.primaryColor,
                                size: 27,
                              )),
                          InkWell(
                              onTap: () {
                                //  model.setCurrentTabTo(newTabIndex: 1);
                              },
                              child: Icon(
                                Icons.favorite_border,
                                color: AppColors.primaryColor,
                                size: 27,
                              )),
                          InkWell(
                              onTap: () {
                                //model.setCurrentTabTo(newTabIndex: 2);
                              },
                              child: Icon(
                                Icons.add_shopping_cart,
                                color: AppColors.primaryColor,
                                size: 27,
                              )),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ));
  }
}
