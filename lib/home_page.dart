import 'dart:async';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../app.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController? _navController;
  Animation<Offset>? _navAnimation;
  Timer? _timer;

  AnimationController? _dpController;
  Animation<double>? _dpAnimation;

  AnimationController? _controller;
  Animation<double>? _widthAnimation;

  AnimationController? _containerController;
  Animation<Offset>? _containerAnimation;

  AnimationController? _contentController;
  Animation<double>? _contentAnimation;

  AnimationController? _circleController;
  Animation<double>? _circleAnimation;

  static const int _max = 1460;
  int _amount = 0;

  int _numValue1 = 0;
  int _numValue2 = 0;
  bool _expandText = false;
  bool _hideCircleRow = false;

  void _animateAmount() {
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) {
        setState(() {
          _amount += 5;
        });
        if (_amount == _max) {
          timer.cancel();
        }
      },
    );
  }

  @override
  void initState() {
    numbersFunction();
    animateWidth();
    hideCircleWidget();
    _navController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..forward();

    _dpController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _dpAnimation =
        Tween<double>(begin: 20.0, end: 50.0).animate(CurvedAnimation(
      parent: _dpController!,
      curve: Curves.easeIn,
    ));
    _dpController!.forward();

    _circleController = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );

    _circleAnimation =
        Tween<double>(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: _circleController!,
      curve: Curves.easeOut,
    ));
    _circleController!.forward();

    _widthAnimation = Tween<double>(
      begin: 0.0,
      end: 400.0, // Adjust this value according to your needs
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    ));

    _navAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.99),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _navController!,
      curve: Curves.easeIn,
    ));

    _containerController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _containerAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _containerController!,
      curve: Curves.easeInOut,
    ));

    _contentController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _contentAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _contentController!,
      curve: Curves.easeIn,
    ));

    _containerController!.forward().then((value) {
      _contentController!.forward();
    });

    _animateAmount();
    super.initState();
  }

  void numbersFunction() {
    Future.delayed(const Duration(milliseconds: 1800), () {
      setState(() {
        _numValue1 = 1034;
        _numValue2 = 2212;
      });
    });
  }

  void animateWidth() {
    Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() {
        _expandText = true;
      });
    });
  }

  void hideCircleWidget() {
    Future.delayed(const Duration(milliseconds: 2600), () {
      setState(() {
        _hideCircleRow = true;
      });
    });
  }

  @override
  void dispose() {
    _navController!.dispose();
    _controller!.dispose();
    _dpController!.dispose();
    _circleController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFA5957E).withOpacity(0.1),
              const Color(0xFFF9D8AF).withOpacity(0.9)
            ],
            stops: const [0.2, 7.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(children: [
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SlideTransition(
                        position: _containerAnimation!,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FadeTransition(
                            opacity: _contentAnimation!,
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: Color(0XFFa4957e),
                                ),
                                SizedBox(
                                    width:
                                        8), // Add some space between the icon and text
                                Text(
                                  "Saint Petersburg",
                                  style: TextStyle(
                                      color: Color(0XFFa4957e),
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: _dpAnimation?.value,
                        height: _dpAnimation?.value,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE48E28),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/dp.png"), // Replace with your image URL
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Hi, Marina',
                        style: TextStyle(
                            color: Color(0xFFbcb0a0),
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ).fadeInFromLeft(delay: 1500.ms),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'let\'s select your',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ).fadeInFromBottom(
                              delay: 1800.ms, animationDuration: 450.ms),
                          const Text(
                            'perfect place',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ).fadeInFromBottom(
                              delay: 2100.ms, animationDuration: 500.ms),
                        ],
                      )
                    ],
                  )),
              const SizedBox(
                height: 60,
              ),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimatedBuilder(
                        animation: _circleAnimation!,
                        builder: (context, child) {
                          return Transform.scale(
                              scale: 1 +
                                  (_circleAnimation!.value /
                                      95), // Calculate scale based on animation value
                              child: Center(
                                  child: Container(
                                      width: 80,
                                      height: 100,
                                      padding: const EdgeInsets.all(15),
                                      margin: const EdgeInsets.only(left: 10),
                                      decoration: const BoxDecoration(
                                        color: AppColors.primary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text('BUY',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8)),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          AnimatedFlipCounter(
                                              duration: const Duration(
                                                  milliseconds: 1500),
                                              value: _numValue1,
                                              wholeDigits: 4,
                                              hideLeadingZeroes: true,
                                              thousandSeparator: ' ',
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                          const Text('offers',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 7)),
                                        ],
                                      ))));
                        }),
                    AnimatedBuilder(
                        animation: _circleAnimation!,
                        builder: (context, child) {
                          return Transform.scale(
                              scale: 1 +
                                  (_circleAnimation!.value /
                                      95), // Calculate scale based on animation value
                              child: Center(
                                  child: Container(
                                      width: 80,
                                      height: 80,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        color: context.colorScheme.surface,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text('Rent',
                                              style: TextStyle(
                                                  color: Color(0XFFa4957e),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 8)),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          AnimatedFlipCounter(
                                              duration: const Duration(
                                                  milliseconds: 1500),
                                              value: _numValue2,
                                              wholeDigits: 4,
                                              hideLeadingZeroes: true,
                                              thousandSeparator: ' ',
                                              textStyle: const TextStyle(
                                                  color: Color(0XFFa4957e),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold)),
                                          const Text('offers',
                                              style: TextStyle(
                                                  color: Color(0XFFa4957e),
                                                  fontSize: 7)),
                                        ],
                                      ))));
                        })
                  ],
                ),
              ]),
              SizedBox(
                height: 60,
              ),
              Offstage(
                offstage: !_hideCircleRow,
                child: Container(
                  width: context.sizeWidth(1),
                  padding: const EdgeInsets.all(6),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      const ImgWidget(
                        text: 'Gladkova St., 25',
                      ),
                      SizedBox(
                        height: context.sizeHeight(0.4),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ImgWidget(
                                  imgPath: ImagesPaths.furniture3,
                                  imgHeight: context.sizeHeight(0.5),
                                  milliseconds: 3600,
                                  text: 'Malaga St., 92',
                                  sliderWidth: 0.36,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    2,
                                    (index) => Expanded(
                                      child: ImgWidget(
                                        imgPath: index.isEven
                                            ? ImagesPaths.furniture4
                                            : ImagesPaths.furniture1,
                                        imgHeight: context.sizeHeight(0.4),
                                        milliseconds: 3650,
                                        text: index == 0
                                            ? 'Margaret., 32'
                                            : 'Trefeleva., 43',
                                        sliderWidth: 0.36,
                                      ),
                                    ),
                                  ).columnInPadding(5),
                                ),
                              )
                            ].rowInPadding(5)),
                      ).padSymmetric(vertical: 5),
                    ],
                  ),
                ).slideInFromBottom(
                  delay: 2700.ms,
                  animationDuration: 1200.ms,
                  begin: 1,
                ),
              ),
            ])
            // BUY AND RENT ROW WIDGETS

            // Text(
            //   "$_amount",
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            // SizedBox(
            //   height: 50,
            //   child: Stack(
            //     alignment: Alignment.centerLeft,
            //     children: [
            //       Container(
            //         width: _widthAnimation!.value,
            //         height: 50,
            //         decoration: BoxDecoration(
            //           color: Colors.grey.shade300.withOpacity(0.5),
            //           borderRadius: BorderRadius.circular(25),
            //         ),
            //         child: Center(child: Text("Apata Street")),
            //       ),
            //       Positioned(
            //         right: 0,
            //         child: CircleAvatar(
            //             radius: 25,
            //             backgroundColor: Colors.grey.shade300,
            //             child: const CircleAvatar(
            //               radius: 23,
            //               backgroundColor: Colors.white,
            //               child: Icon(
            //                 Icons.arrow_forward_ios,
            //                 size: 15,
            //               ),
            //             )),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),

      // bottomNavigationBar: Container(
      //     color: const Color(0xFFF9D8AF).withOpacity(0.8),
      //     child: SlideTransition(
      //       position: _navAnimation!,
      //       textDirection: TextDirection.rtl,
      //       child: Container(
      //         margin: EdgeInsets.only(bottom: 20, left: 40, right: 40),
      //         width: MediaQuery.of(context).size.width,
      //         height: 60,
      //         decoration: BoxDecoration(
      //           color: Colors.black,
      //           borderRadius: BorderRadius.circular(30.0),
      //           boxShadow: [
      //             BoxShadow(
      //                 blurRadius: 5,
      //                 offset: const Offset(0, 2),
      //                 color: Colors.black.withOpacity(.05),
      //                 spreadRadius: -2 // changes position of shadow
      //                 ),
      //           ],
      //         ),
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(
      //             horizontal: 10.0,
      //             vertical: 17.0,
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             children: [
      //               InkWell(
      //                   onTap: () {
      //                     // Navigator.of(context)
      //                     //     .push(_createZoomOutPageRoute(PageTwo()));
      //                   },
      //                   child: const Icon(
      //                     Icons.search,
      //                     color: AppColors.white,
      //                     size: 27,
      //                   )),
      //               InkWell(
      //                   onTap: () {
      //                     // model.setCurrentTabTo(newTabIndex: 0);
      //                   },
      //                   child: const Icon(
      //                     Icons.message,
      //                     color: AppColors.white,
      //                     size: 27,
      //                   )),
      //               InkWell(
      //                   onTap: () {
      //                     // model.setCurrentTabTo(newTabIndex: 0);
      //                   },
      //                   child: const CircleAvatar(
      //                       radius: 30,
      //                       backgroundColor: Colors.amber,
      //                       child: Icon(
      //                         Icons.home_outlined,
      //                         color: AppColors.white,
      //                         //  size: 27,
      //                       ))),
      //               InkWell(
      //                   onTap: () {
      //                     //  model.setCurrentTabTo(newTabIndex: 1);
      //                   },
      //                   child: const Icon(
      //                     Icons.favorite_border,
      //                     color: AppColors.white,
      //                     size: 27,
      //                   )),
      //               InkWell(
      //                   onTap: () {
      //                     //model.setCurrentTabTo(newTabIndex: 2);
      //                   },
      //                   child: const Icon(
      //                     Icons.person,
      //                     color: AppColors.white,
      //                     size: 27,
      //                   )),
      //             ],
      //           ),
      //         ),
      //       ),
      //     )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // Custom page route with zoom out transition
  PageRouteBuilder _createZoomOutPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 1.5,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }
}
