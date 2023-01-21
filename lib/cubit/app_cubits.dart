import 'package:bloc/bloc.dart';

import '../service/data_services.dart';
import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }
  final DataServices data;
  late final candidates;
  void getData()async{
    try{
      emit(LoadingState());
      candidates = await data.getInfo();
      emit(LoadedState(candidates));
    }catch(e){

    }
  }

  void otpvalidation() async{
    try {
      emit(SigninState());
    }catch(e){

    }
  }

 /* final DataServices data;
  late final candidates;
  void vote() async{
    try {
      emit(LoadingState());
      candidates = await data.getInfo();
      emit(VotingState(candidates));
    }catch(e){

    }
  }*/

  void errorpage() async{
    try {
      emit(ErrorState());
    }catch(e){

    }
  }
}
