import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vote/cubit/app_cubit_states.dart';
import 'package:vote/misc/colors.dart';
import 'package:vote/model/data_model.dart';
import 'package:vote/widget/app_text.dart';
import 'package:http/http.dart' as http;
import '../cubit/app_cubits.dart';
import '../model/vote_model.dart';
import '../widget/app_large_text.dart';
import 'dart:convert';

class VotePage extends StatefulWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  State<VotePage> createState() => _VotePageState();
}

//first_name

class _VotePageState extends State<VotePage> {
  List total = ["1", "2", "3"];
  List images = ["mimi.jpg", "sonko.jpg", "macky.jpg"];
  //List text = ["Mimi Touré", "Ousmane Sonko", "Macky Sall"];

  final _data = {
    'phone_number_voter':'phone_number_voter',
    'id_candidate':'id_candidate'
  };
  Future<VoteModel?> postData( VoteModel _data) async {
    var response = await http.post(
        Uri.https('deeloma.com', 'woolu/vote'),
        body: json.encode(_data.toJson()));
    print(json.encode(_data.toJson()));
    var data = response.body;
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is /*VotingState*/ LoadedState) {
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
                          style: BorderStyle.solid),
                      /*       boxShadow: [
                           BoxShadow(
                              color: Colors.black87,
                              offset:  Offset(20.0, 10.0),
                              blurRadius: 10.0,
                              spreadRadius: 10.0
                          )
                        ],*/
                      color: AppColors.mainColor,
                      gradient: new LinearGradient(
                          colors: [Colors.red, Colors.green],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft),
                      shape: BoxShape.circle,
                      // border: Border.all(width: 5.0, color: Colors.white),
                      image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: AssetImage("images/" + images[index]),
                      )),
                  child: Container(
                    margin: const EdgeInsets.only(top: 90, left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppLargeText(text: "Candidat(e)"),
                            AppText(
                              text: info[index].first_name +
                                  ' ' +
                                  info[index].last_name,
                              size: 30,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(
                              height: 550,
                            ),
                            Center(
                                child: Column(
                              children: [
                                AppText(
                                  text: total[index] +
                                      '/' +
                                      info.length.toString(),
                                  color: AppColors.mainTextColor,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                AppText(
                                  text: 'Je vote',
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ],
                            )),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context).vote();
                              },
                              child: Container(
                                  width: 382,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 300,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: AppColors.mainColor,
                                            ),
                                            child: TextButton(
                                                onPressed: () async {
                                                  String id_candidate = info[index].id_candidate.toString();
                                                  String phone_number_voter = "785332594";
                                                  //String last_name = info[index].last_name;
                                                  final _datamodel = VoteModel(
                                                    id_candidate: int.parse(id_candidate),
                                                      phone_number_voter : phone_number_voter,
                                                      );

                                                  postData(_datamodel);
                                                  //IL FAUT DECOMMENTER LA LIGNE EN BAS
                                                 // BlocProvider.of<AppCubits>(context).vote();

                                                },
                                                child: AppText(
                                                  text: "Valider le choix",
                                                  color: Colors.white,
                                                )),
                                          ),
                                        )
                                        //ResponsiveButton(width: double.maxFinite,)
                                        //AppButtons(size: 20, color: AppColors.textColor2, backgroundColor: AppColors.buttonBackground, borderColor: AppColors.textColor1)
                                      ])),
                            ),
                          ],
                        ),
                        Column(
                          children: List.generate(3, (indexDots) {
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
                          }),
                        )
                      ],
                    ),
                  ),
                );
              });
        } else {
          print('${state}');

          return Center(
            child: AppText(
              text: "Voté !",
            ),
          );
        }
      },
    ));
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
