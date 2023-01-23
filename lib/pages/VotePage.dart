import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vote/cubit/app_cubit_states.dart';
import 'package:vote/misc/colors.dart';
import 'package:vote/widget/app_buttons.dart';
import 'package:vote/widget/app_text.dart';
import 'package:vote/widget/card_vote.dart';

import '../cubit/app_cubits.dart';
import '../misc/color_filters.dart';
import '../widget/app_large_text.dart';
import '../widget/responsive_button.dart';

class VotePage extends StatefulWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List total = ["1","2","3"];
  List images = [
    "mimi.jpg",
    "sonko.jpg",
    "macky.jpg"
  ];
  List text = [
    "Mimi Touré", "Ousmane Sonko", "Macky Sall"
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if(state is /*VotingState*/LoadedState){
            var info = state.candidates;
            return PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: images.length,
                      itemBuilder: (_, index) {
                        return Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              border: new Border.all(
                                  color: Colors.green,
                                  width: 5.0,
                                  style: BorderStyle.solid
                              ),
                              /*       boxShadow: [
                           BoxShadow(
                              color: Colors.black87,
                              offset:  Offset(20.0, 10.0),
                              blurRadius: 10.0,
                              spreadRadius: 10.0
                          )
                        ],*/
                              color: AppColors.mainColor,gradient: new LinearGradient(
                              colors: [Colors.red, Colors.green],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft
                          ),
                              shape: BoxShape.circle,
                              // border: Border.all(width: 5.0, color: Colors.white),
                              image: DecorationImage(
                                fit: BoxFit.scaleDown,
                                image: AssetImage(
                                    "images/" + images[index]
                                ),
                              )
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(top: 90, left: 5, right: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppLargeText(text: "Candidat(e)"),
                                    AppText(text: info[index].firstName+' '+info[index].lastName, size: 30,color: AppColors.mainColor,),

                                    SizedBox(height: 550,),
                                    Center(
                                        child: Column(
                                          children: [
                                            AppText(text: total[index]+'/'+info.length.toString() , color: AppColors.mainTextColor,size: 30,),
                                            SizedBox(height: 5,),
                                            AppText(text: 'Je vote', color: Colors.black,size: 30,),
                                          ],
                                        )
                                    ),
                                    SizedBox(height: 10,),


                                    GestureDetector(
                                      onTap: () {
                                         BlocProvider.of<AppCubits>(context).vote();
                                      },
                                      child: Container(
                                          width: 382,
                                          child: Row(
                                              children: [
                                                ResponsiveButton(width: double.maxFinite,)
                                                //AppButtons(size: 20, color: AppColors.textColor2, backgroundColor: AppColors.buttonBackground, borderColor: AppColors.textColor1)
                                              ])),
                                    ),
                                  ],
                                ),
                                Column(children: List.generate(3, (indexDots) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 2),
                                    width: 8,
                                    height: index == indexDots ? 25 : 8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: index == indexDots
                                          ? AppColors.mainColor
                                          : AppColors.mainColor.withOpacity(0.3),
                                    ),
                                  );
                                }),)
                              ],
                            ),
                          ),
                        );
                      });


          } else{            print('${state}');

          return Center(child: AppText(text: "Voté !",),);
          }
        },
      )
    );
  }


}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/*
=> Scaffold(
        appBar: AppBar(
          title: Text("Page de vote"),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            CardVote(image: 'images/macky.jpg', description: '4e Président du Sénégal',nom: 'Macky Sall', politique: 'APR', ),
            CardVote(image: 'images/mimi.jpg', description: "Candidate à l'élection présidentielle du Sénégal",nom: 'Mimi Touré', politique: 'APR', ),
            CardVote(image: 'images/sonko.jpg', description: "Candidate à l'élection présidentielledu Sénégal",nom: 'Ousmane Sonko', politique: 'PUR', ),

          ],
        ),
      );



}
*/