
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vote/pages/WelcomePage.dart';
import 'package:image_picker/image_picker.dart';
import '../cubit/app_cubits.dart';
import '../model/user_model.dart';
import '../provider/auth_provider.dart';
import '../utils/utils.dart';
import '../widget/app_large_text.dart';
import '../widget/app_text.dart';
import '../widget/custom_button.dart';
import '../widget/responsive_button.dart';

class UserInfromationScreen extends StatefulWidget {
  const UserInfromationScreen({super.key});

  @override
  State<UserInfromationScreen> createState() => _UserInfromationScreenState();
}

class _UserInfromationScreenState extends State<UserInfromationScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  // for selecting image

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,//images.length,
          itemBuilder: (_,index){
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "images/mimi.jpg"
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


                        SizedBox(height: 40,),

                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
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
                          //color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3),
                        ),
                      );
                    }),)
                  ],
                ),
              ),
            );
          }),
    ) ;
  }
}
