import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/api/api_manager.dart';
import 'package:news_app/Core/cubit/category_states.dart';
import 'package:news_app/Core/model/Source.dart';

class CategoryViewModel extends Cubit<CategoryWidgetState> {
  CategoryViewModel() : super(LoadingState());

  void loadSources(String categoryID) async {
    try {
      var response = await ApiManager.getSources(categoryID);

      if (response.status == 'error') {
        emit(ErrorState(response.message!));
      } else {
        emit(SourcesLoadedState(response.sources!));
        //emit(MessageAction('sources Loaded successfully'));
        //emit(NavigateToScreenAction(HomeView.routeName));
      }
    } catch (e) {
      emit(ErrorState('Error loadind news sources'));
    }
  }
}



class NavigateToScreenAction extends CategoryWidgetState {
  String routeName;

  NavigateToScreenAction(this.routeName);
}
