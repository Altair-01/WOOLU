import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../misc/colors.dart';
import 'app_text.dart';

class CardVote extends StatelessWidget {
  bool? isEmpty;
  final String image;
  final String description;
  final String nom;
  final String politique;
  CardVote({Key? key, required this.image,required this.politique, required this.description, required this.nom, this.isEmpty=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15, top: 10),
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.fitWidth)),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Container(
                  child: AppText(text: politique,size: 34, color: Colors.white,)

                  ),
                ),

            ],
          ),
          Padding(
            padding: EdgeInsets.all(16).copyWith(bottom: 0),
            child:AppText(text: description,size: 16,)
          ),
          TextButton(

            child: AppText(text: 'je vote pour '+nom,color: AppColors.mainColor,size: 25,),
            onPressed: () {},


          )
        ],
      ),
    );
  }
}
