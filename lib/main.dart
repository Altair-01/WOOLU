import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vote/provider/auth_provider.dart';
import 'package:vote/service/data_services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'cubit/app_cubit_logics.dart';
import 'cubit/app_cubits.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //initialize firebase



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        BlocProvider(create: (_) => AppCubits(data: DataServices()))
      ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Application de vote',
            home:BlocProvider<AppCubits>(
              create: (context)=>AppCubits(
                data:DataServices(),
              ),
              child: AppCubitLogics(),
            )
        ),
    );
  }
}
