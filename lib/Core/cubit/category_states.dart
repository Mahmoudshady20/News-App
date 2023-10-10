import 'package:news_app/Core/model/Source.dart';

abstract class CategoryWidgetState {}

class LoadingState extends CategoryWidgetState {}

class ErrorState extends CategoryWidgetState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class SourcesLoadedState extends CategoryWidgetState {
  List<Source> sources;

  SourcesLoadedState(this.sources);
}

class MessageAction extends CategoryWidgetState {
  String message;

  MessageAction(this.message);
}