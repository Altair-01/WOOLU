import 'package:equatable/equatable.dart';

import '../model/data_model.dart';
abstract class CubitStates extends Equatable{}
class InitialState extends CubitStates {
  @override
// TODO: implement props
  List<Object?> get props => [];
}
class WelcomeState extends CubitStates{
  @override
// TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends CubitStates{
  @override
// TODO: implement props
  List<Object?> get props => [];
}

class LoadedState extends CubitStates{
  LoadedState(this.candidates);
  final List<DataModel> candidates;
  @override
// TODO: implement props
  List<Object?> get props => [candidates];
}

class LoginState extends CubitStates{
  @override
// TODO: implement props
  List<Object?> get props => [];
}

class ErrorState extends CubitStates{
  @override
// TODO: implement props
  List<Object?> get props => [];
}

class SigninState extends CubitStates{
  @override
// TODO: implement props
  List<Object?> get props => [];
}

class VotedState extends CubitStates{
  @override
// TODO: implement props
  List<Object?> get props => [];
}
/*
class VotingState extends CubitStates{
  VotingState(this.candidates);
  final List<DataModel> candidates;
  @override
// TODO: implement props
  List<Object?> get props => [candidates];
}*/