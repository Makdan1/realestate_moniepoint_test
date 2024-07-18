// // ignore_for_file: deprecated_member_use
//
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import '../../../app.dart';
//
// class HomeView extends StatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   State<StatefulWidget> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
//   AnimationController? _containerController;
//
//   Animation<Offset>? _containerAnimation;
//
//   AnimationController? _contentController;
//
//   Animation<double>? _contentAnimation;
//
//   int _numValue1 = 0;
//   int _numValue2 = 0;
//   bool _expandText = false;
//   bool _hideCircleRow = false;
//   @override
//   void initState() {
//     numbersFunction();
//     animateWidth();
//     hideCircleWidget();
//     _containerController = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );
//
//     _containerAnimation = Tween<Offset>(
//       begin: Offset(-1.0, 0.0),
//       end: Offset(0.0, 0.0),
//     ).animate(CurvedAnimation(
//       parent: _containerController!,
//       curve: Curves.easeInOut,
//     ));
//
//     _contentController = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );
//
//     _contentAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: _contentController!,
//       curve: Curves.easeIn,
//     ));
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _containerController!.dispose();
//     _contentController!.dispose();
//     super.dispose();
//   }
//
//   void numbersFunction() {
//     Future.delayed(const Duration(milliseconds: 1800), () {
//       setState(() {
//         _numValue1 = 1034;
//         _numValue2 = 2212;
//       });
//     });
//   }
//
//   void animateWidth() {
//     Future.delayed(const Duration(milliseconds: 1200), () {
//       setState(() {
//         _expandText = true;
//       });
//     });
//   }
//
//   void hideCircleWidget() {
//     Future.delayed(const Duration(milliseconds: 2600), () {
//       setState(() {
//         _hideCircleRow = true;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       bottom: false,
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SlideTransition(
//                       position: _containerAnimation!,
//                       child: Container(
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: FadeTransition(
//                           opacity: _contentAnimation!,
//                           child: const Row(
//                             children: [
//                               Icon(
//                                 Icons.location_on_rounded,
//                                 color: Color(0XFFa4957e),
//                               ),
//                               SizedBox(
//                                   width:
//                                       8), // Add some space between the icon and text
//                               Text(
//                                 "Saint Petersburg",
//                                 style: TextStyle(
//                                     color: Color(0XFFa4957e),
//                                     fontWeight: FontWeight.w500),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const CircleAvatar(
//                       radius: 22,
//                       backgroundImage: AssetImage(ImagesPaths.face),
//                     ).scale(animationDuration: 900.ms),
//                   ],
//                 ),
//
//                 // hi marina
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Text(
//                       'Hi, Marina',
//                       style: context.textTheme.bodyLarge,
//                     ).fadeInFromLeft(delay: 1500.ms),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'let\'s select your',
//                           style: context.textTheme.titleLarge,
//                           textScaleFactor: 1.2,
//                         ).fadeInFromBottom(
//                             delay: 1800.ms, animationDuration: 450.ms),
//                         Text(
//                           'perfect place',
//                           style: context.textTheme.titleLarge,
//                           textScaleFactor: 1.2,
//                         ).fadeInFromBottom(
//                             delay: 2100.ms, animationDuration: 500.ms),
//                       ],
//                     )
//                   ],
//                 ),
//               ].columnInPadding(_hideCircleRow ? 10 : 20),
//             ).padSymmetric(horizontal: 10, vertical: 10),
//             // BUY AND RENT ROW WIDGETS
//             SecondSectionHomeView(
//               numValue1: _numValue1,
//               numValue2: _numValue2,
//               hideCircleRow: _hideCircleRow,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
