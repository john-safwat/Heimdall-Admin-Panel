import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseState.dart';
import 'package:heimdalladmin/UI/Home/Reports/FeedbacksNavigator.dart';
import 'package:heimdalladmin/UI/Home/Reports/FeedbacksViewModel.dart';
import 'package:heimdalladmin/UI/Home/Reports/Widgets/FeedbackCard.dart';
import 'package:provider/provider.dart';

class FeedbacksView extends StatefulWidget {
  const FeedbacksView({super.key});

  @override
  State<FeedbacksView> createState() => _FeedbacksViewState();
}

class _FeedbacksViewState extends BaseState<FeedbacksView, FeedbacksViewModel>
    implements FeedbacksNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      builder: (context, child) => Consumer<FeedbacksViewModel>(
        builder: (context, value, child) {
          if (value.errorMessage != null) {
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
          }else if (value.feedbacks.isEmpty){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            return GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4,
                crossAxisSpacing: 20 ,
                mainAxisSpacing: 20 ,
              ),
              itemBuilder: (context, index) => FeedbackCard(
                feedback: viewModel.feedbacks[index],
                onItemPress: viewModel.onCardClick
              ),
              itemCount: viewModel.feedbacks.length,
            );
          }
        },
      ),
    );
  }

  @override
  FeedbacksViewModel initViewModel() {
    return FeedbacksViewModel();
  }
}
