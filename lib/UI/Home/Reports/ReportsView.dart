import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseState.dart';
import 'package:heimdalladmin/UI/Home/Reports/ReportsNavigator.dart';
import 'package:heimdalladmin/UI/Home/Reports/ReportsViewModel.dart';
import 'package:heimdalladmin/UI/Home/Reports/Widgets/ReportCard.dart';
import 'package:provider/provider.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends BaseState<ReportsView , ReportsViewModel> implements ReportsNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.loadData();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<ReportsViewModel>(
        builder: (context, value, child) {
          if(value. errorMessage != null){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value.errorMessage!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      viewModel.loadData();
                    },
                    child: const Text("Try Again"))
              ],
            );
          }else if (value.loading){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyLarge,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Theme.of(context).primaryColor,
                    keyboardType: TextInputType.name,
                    cursorHeight: 20,
                    onChanged: (value) {
                      viewModel.search(value);
                    },
                    decoration: const InputDecoration(
                        hintText: "Search",
                        contentPadding: EdgeInsets.all(20)
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      crossAxisSpacing: 20 ,
                      mainAxisSpacing: 20 ,
                    ),
                    itemBuilder: (context, index) => ReportCard(
                        report: viewModel.reports[index],
                        onPress: viewModel.onCardClick
                    ),
                    itemCount: viewModel.reports.length,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  @override
  ReportsViewModel initViewModel() {
    return ReportsViewModel();
  }
}
