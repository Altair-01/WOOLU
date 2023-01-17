import 'package:flutter/material.dart';

import '../misc/colors.dart';
import '../widget/app_buttons.dart';
import '../widget/app_large_text.dart';
import '../widget/app_text.dart';
import '../widget/responsive_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int note = 4;
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left:0,
                right:0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "images/welcome-one.png",
                        ),
                        fit:BoxFit.cover,
                      )
                  ),
                )),
            Positioned(
                left:20,
                top:70,
                child: Row(

                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.menu),
                      color: Colors.white,),
                  ],
                )),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "NGB", color: Colors.black.withOpacity(0.8),),
                        AppLargeText(text: " 45000 XOF ", color: AppColors.mainColor,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor,),
                        SizedBox(width: 5,),
                        AppText(text: "Dakar, Niarry Tally", color: AppColors.textColor1,)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,color: index < note ?AppColors.starColor:AppColors.textColor2,);
                          }),
                        ),
                        SizedBox(width: 10,),
                        AppText(text: "4.0", color: AppColors.textColor2,)
                      ],
                    ),
                    SizedBox(width: 25,),
                    AppLargeText(text: "Joueur(s)", color: Colors.black.withOpacity(0.8),size: 20,),
                    SizedBox(height: 5,),
                    AppText(text: "Nombre de joueurs dans votre équipe", color: AppColors.mainTextColor,),
                    SizedBox(height: 5,),
                    Wrap(
                      children: List.generate(11, (index) {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              selectedIndex=index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(size: 50, color: selectedIndex==index?Colors.white:Colors.black, backgroundColor: selectedIndex==index?Colors.black:AppColors.buttonBackground, borderColor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                                text: (index+1).toString()),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20,),
                    AppLargeText(text: "Description",color: Colors.black.withOpacity(0.8),),
                    SizedBox(height: 10,),
                    AppText(text: "Ce terrain est en excellent état, idéal pour vos matchs entre amis, sa capacité est de 11 vs 11. Il est en location pour demi-terrain aussi.", color: AppColors.mainTextColor,),
                    SizedBox(height: 20,),


                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(size: 60,
                    color: AppColors.textColor1,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textColor1,
                    isIcon: true,
                    icon: Icons.favorite_border,),
                  SizedBox(width: 20,),
                  ResponsiveButton(
                    isResponsive:true,
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
