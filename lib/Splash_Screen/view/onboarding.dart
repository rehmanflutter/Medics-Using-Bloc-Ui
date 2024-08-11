// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medical_bloc/Splash_Screen/Presenter/onboard_bloc.dart';
// import 'package:medical_bloc/Splash_Screen/Presenter/onboard_status.dart';
// import 'package:medical_bloc/main.dart';
// import 'package:medical_bloc/utils/custom/textCustam.dart';
// import 'package:medical_bloc/utils/images.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';

// class Onboardingscreen extends StatelessWidget {
//   PageController controller = PageController();

//   List<Color> colour = [Colors.white, appcolour];
//   List<Color> Scipk = [Colors.grey, Colors.white];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteColour,
//       body: Column(
//         children: [
//           BlocBuilder<OnboardBloc, OnboardStatus>(
//             builder: (context, state) => Expanded(
//               child: LiquidSwipe.builder(
//                 // controller: controller,
//                 itemCount: state.datashow.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     color: colour[index],
//                     child: Column(
//                       children: [
//                         7.h.height,
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: Textcustam(
//                                 text: 'Skip', size: 17, col: Scipk[index]),
//                           ),
//                         ),
//                         SizedBox(
//                             height: 60.h,
//                             child: Image.asset(state.datashow[index].image)),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: Container(
//                             height: 15.h,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                 // color: Colors.amber,
//                                 borderRadius: BorderRadius.circular(10),
//                                 image: DecorationImage(
//                                     image: AssetImage(Images.shado),
//                                     fit: BoxFit.fill)),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 50),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   3.h.height,
//                                   SizedBox(
//                                     width: 60.w,
//                                     child: Textcustam(
//                                       text: state.datashow[index].data,
//                                       //'Find a lot of specialist doctors in one place',
//                                       size: 20,
//                                       weight: FontWeight.w700,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 45),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SmoothPageIndicator(
//                   controller: controller,
//                   count: 2,
//                   axisDirection: Axis.horizontal,
//                   effect: const SlideEffect(
//                       spacing: 8.0,
//                       radius: 4.0,
//                       dotWidth: 20.0,
//                       dotHeight: 5.0,
//                       //  paintStyle: PaintingStyle.stroke,
//                       strokeWidth: 1.5,
//                       dotColor: Color.fromARGB(255, 212, 247, 243),
//                       activeDotColor: appcolour),
//                 ),
//                 FloatingActionButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50)),
//                   backgroundColor: appcolour,
//                   child: const Icon(
//                     Icons.arrow_forward,
//                     color: Colors.white,
//                   ),
//                   onPressed: () {
//                     // if (controller.initialPage == 0) {
//                     //   Navigator.pushNamed(context, '/OnboardingEnterPoint');
//                     // } else {
//                     //   controller.nextPage(
//                     //       duration: Duration(milliseconds: 1000),
//                     //       curve: Curves.linear);
//                     // }
//                     Navigator.pushNamed(context, '/OnboardingEnterPoint');
//                   },
//                 )
//               ],
//             ),
//           ),
//           3.h.height
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_bloc/Splash_Screen/Presenter/onboard_bloc.dart';
import 'package:medical_bloc/Splash_Screen/Presenter/onboard_status.dart';
import 'package:medical_bloc/main.dart';
import 'package:medical_bloc/utils/custom/textCustam.dart';
import 'package:medical_bloc/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Onboardingscreen extends StatefulWidget {
  @override
  _OnboardingscreenState createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  //final PageController controller = PageController();
  final LiquidController liquidController = LiquidController();

  List<Color> colour = [Colors.white, appcolour];
  List<Color> Scipk = [Colors.grey, Colors.white];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      body: Column(
        children: [
          BlocBuilder<OnboardBloc, OnboardStatus>(
            builder: (context, state) => Expanded(
              child: LiquidSwipe.builder(
                liquidController: liquidController,
                itemCount: state.datashow.length,
                onPageChangeCallback: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: colour[index],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    child: Column(
                      children: [
                        7.h.height,
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Textcustam(
                                text: 'Skip', size: 17, col: Scipk[index]),
                          ),
                        ),
                        SizedBox(
                            height: 60.h,
                            child: Image.asset(state.datashow[index].image)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 15.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(Images.shado),
                                    fit: BoxFit.fill)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  3.h.height,
                                  SizedBox(
                                    width: 60.w,
                                    child: Textcustam(
                                      text: state.datashow[index].data,
                                      size: 20,
                                      weight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          1.h.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: PageController(initialPage: currentPage),
                  count: 2,
                  axisDirection: Axis.horizontal,
                  effect: const SlideEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 20.0,
                    dotHeight: 5.0,
                    strokeWidth: 1.5,
                    dotColor: Color.fromARGB(255, 212, 247, 243),
                    activeDotColor: appcolour,
                  ),
                ),
                BlocBuilder<OnboardBloc, OnboardStatus>(
                    builder: (context, state) => FloatingActionButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          backgroundColor: appcolour,
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (currentPage == state.datashow.length - 1) {
                              Navigator.pushNamed(
                                  context, '/OnboardingEnterPoint');
                            } else {
                              liquidController.animateToPage(
                                page: currentPage + 1,
                                duration: 900,
                              );
                            }
                          },
                        ))
              ],
            ),
          ),
          3.h.height
        ],
      ),
    );
  }
}
