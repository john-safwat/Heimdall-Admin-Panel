import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/Firebase/FirebaseFeedbackDatabase.dart';
import 'package:heimdalladmin/Models/Feedback/Feedback.dart';
import 'package:heimdalladmin/UI/Home/Reports/FeedbacksNavigator.dart';

class FeedbacksViewModel extends BaseViewModel<FeedbacksNavigator> {

  FirebaseFeedbackDatabase database = injectFirebaseFeedbackDatabase();

  String? errorMessage;
  List<UserFeedback> feedbacks=[];

  Future<void> loadData()async{
    errorMessage = null;
    feedbacks = [];
    notifyListeners();

    try {
      feedbacks =await database.getAllFeedbacks();
      notifyListeners();
    }catch(e){
      errorMessage = e.toString();
      notifyListeners();
    }

  }

  onCardClick(){}

}