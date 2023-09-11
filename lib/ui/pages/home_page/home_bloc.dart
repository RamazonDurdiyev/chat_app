import 'package:chat_app/ui/pages/home_page/home_event.dart';
import 'package:chat_app/ui/pages/home_page/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc():super(Initial());


 // Data
 TextEditingController searchCtrl = TextEditingController();
}