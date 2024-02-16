import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/Firebase/FirebaseReportsDatabase.dart';
import 'package:heimdalladmin/Models/Reports/Report.dart';
import 'package:heimdalladmin/UI/Home/Reports/ReportsNavigator.dart';

class ReportsViewModel extends BaseViewModel <ReportsNavigator> {

  FirebaseReportsDatabase firebaseReportsDatabase = injectFirebaseReportsDatabase();

  List<Report> allReports = [];
  List<Report> reports = [];
  String ? errorMessage ;
  bool loading = true;

  loadData()async{
    reports = [];
    errorMessage = null;
    loading = true;
    notifyListeners();
    try{
      allReports =await firebaseReportsDatabase.getListOfReports();
      reports = copyList(allReports);
      loading = false;
      notifyListeners();
    }catch (e){
      errorMessage =e.toString();
      notifyListeners();
    }
  }
  // function to copy list to avoid any reference
  List<Report> copyList(List<Report> reports){
    List<Report> copy = [];
    for(int i = 0 ; i<reports.length ;i++){
      copy.add(reports[i]);
    }
    return copy;
  }

  search(String? query){
    reports = allReports.where((element) => element.id.contains(query??"")).toList();
    if (reports.isEmpty){
      reports = allReports.where((element) => element.id.toLowerCase().contains(query?.toLowerCase()??"")).toList();
    }
    if (reports.isEmpty) {
      reports = allReports.where((element) => element.id.toUpperCase().contains(query?.toUpperCase()??"")).toList();
    }
    notifyListeners();
  }

  onCardClick(){

  }

}