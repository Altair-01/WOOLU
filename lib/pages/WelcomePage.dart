import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vote/provider/auth_provider.dart';

import '../cubit/app_cubit_states.dart';
import '../cubit/app_cubit_states.dart';
import '../cubit/app_cubits.dart';
import '../misc/colors.dart';
import '../widget/app_large_text.dart';
import '../widget/app_text.dart';
import '../widget/responsive_button.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-two.png",
  ];
  List text = [
    "Wollu",
  ];
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_,index){
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "images/"+images[index]
                    ),
                    fit: BoxFit.cover,
                  )
              ),
              child: Container(
                margin: const EdgeInsets.only(top:150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Systeme de vote"),
                        AppText(text: text[index],size: 30,),
                        SizedBox(height: 20,),
                        Container(
                          width: 250,
                          child: AppText(
                            text: " Votez en tout anonymat",
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        SizedBox(height: 40,),

                        GestureDetector(
                          onTap: (){
                            //pour avoir directement la page de vote avec les informations de la bd
                            BlocProvider.of<AppCubits>(context).otpvalidation();

                            //pour avoir otp validation
                            /*ap.isSignedIn == true
                            ? BlocProvider.of<AppCubits>(context).getData()//vote()
                            : BlocProvider.of<AppCubits>(context).otpvalidation();//si il n'est pas connecte
                          */},
                          child: Container(
                              width:200,
                              child:Row (children:[ResponsiveButton(width: 120,)])),
                        ),
                      ],
                    ),
                    Column(children: List.generate(1, (indexDots){
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index==indexDots?25:8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3),
                        ),
                      );
                    }),)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
