import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/controller/States.dart';
import 'package:newsapp/data/data_source/remote_data_source.dart';
import 'package:newsapp/data/models/news.dart';
import 'package:newsapp/presentation/screens/business.dart';
import 'package:newsapp/presentation/screens/science.dart';
import 'package:newsapp/presentation/screens/sports.dart';

class AppCubit extends Cubit<Appstates>{
  AppCubit():super(AppInitState());
  final DataSource _dataSource = DataSource();
 static AppCubit i (BuildContext context)=> BlocProvider.of(context);

  NewsModel? businessNews;
  NewsModel? scienceNews;
  NewsModel? sportsNews;
  ThemeMode? mode=ThemeMode.system;
int currentIndex=0;
void ChangeIndex(int newIndex){
  currentIndex=newIndex;
  emit(ChangeIndexState());
}
void handleMode(){
  if(mode==ThemeMode.light){
    mode=ThemeMode.dark;
  }
  else{
    mode=ThemeMode.light;
  }
  emit(ChangeModeState());
}
Future<void> getNews(String category)async{
  emit(GetNewsLoadingState());
  try{
    switch(category){
      case 'business':
        businessNews=await _dataSource.getNews(category);
        break;
      case 'science':
        scienceNews=await _dataSource.getNews(category);
        break;
      default:
        sportsNews=await _dataSource.getNews(category);
    }
    emit(GetNewsLoadedState());
  }

  catch(e){
    emit(GetNewsFailedState());
    rethrow;
  }
}

}
