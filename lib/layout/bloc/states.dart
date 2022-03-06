abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsChangeBottomNavState extends NewsStates {}

class GetBusinessSuccessState extends NewsStates {}
class GetBusinessErrorState extends NewsStates {
  String error;
  GetBusinessErrorState(this.error);
}

class GetScienceSuccessState extends NewsStates {}
class GetScienceErrorState extends NewsStates {
  String error;
  GetScienceErrorState(this.error);
}

class GetSportsSuccessState extends NewsStates {}
class GetSportsErrorState extends NewsStates {
  String error;
  GetSportsErrorState(this.error);
}

class ChangeModeState extends NewsStates {}

class GetSearchSuccessState extends NewsStates {}
class GetSearchErrorState extends NewsStates {
  String error;
  GetSearchErrorState(this.error);
}

class ChangeSelectedItemState extends NewsStates {}
class ChangePlatformValueState extends NewsStates {}
