import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vote/pages/ErrorPage.dart';
import 'package:vote/pages/LoginPage.dart';
import 'package:vote/pages/MainPage.dart';
import 'package:vote/pages/OtpPage.dart';
import 'package:vote/pages/UserInformationScreen.dart';
import 'package:vote/pages/VotePage.dart';
import 'package:vote/pages/WelcomePage.dart';
import 'package:vote/widget/app_text.dart';

import 'app_cubit_states.dart';
import 'app_cubits.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if(state is WelcomeState){
            return WelcomePage();
          }
          if(state is ErrorState) {
            return ErrorPage();
          }
          if(state is SigninState) {
            return LoginPage();
          }
          if(state is LoginState) {
            return OtpPage(verificationId: '',);
          }if(state is LoadedState) {
            return VotePage();
          }/*
          if(state is VotingState) {
            return VotePage();
          }*/
          if(state is VotedState) {
            return Center(child: AppText(text: "Voté !",),);
          }if(state is LoadingState) {
            return Center(child: CircularProgressIndicator(),);
          }
          else{

            return Container();
          }
        },
      ),
    );
  }
}
