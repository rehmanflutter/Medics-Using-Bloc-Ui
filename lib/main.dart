import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_bloc/Chat/presenter/chat_bloc.dart';
import 'package:medical_bloc/Login__Sign_Up/Presenter/login_Bloc.dart';
import 'package:medical_bloc/Online_Pharmacy/presenter/arcticles_block.dart';
import 'package:medical_bloc/Splash_Screen/Presenter/onboard_bloc.dart';
import 'package:medical_bloc/Splash_Screen/view/splish.dart';
import 'package:medical_bloc/home/Presenter/home_bloc.dart';
import 'package:medical_bloc/profile/view/preswnter/profile_bloc.dart';
import 'package:medical_bloc/routes/routing.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension View on num {
  Widget get height => SizedBox(height: toDouble());
  Widget get width => SizedBox(width: toDouble());
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => ArcticlesBlock(),
        ),
        BlocProvider(
          create: (context) => ChatBloc(),
        ),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              routes: Routes.routes,
              home: SplishScreen());
        },
      ),
    );
  }
}
