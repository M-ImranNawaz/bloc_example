import 'package:bloc_example/cubits/internet_cubit.dart';
import 'package:bloc_example/views/home_view.dart';
import 'package:bloc_example/views/signin/bloc/signin_bloc.dart';
import 'package:bloc_example/views/signin/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // providers: [
      //   // BlocProvider<InternetCubit>(create: (context) => InternetCubit())
      //   BlocProvider<SigninBloc>(create: (context) => SigninBloc())
      // ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SiginView() //HomeView(),
      ),
    );
  }
}
