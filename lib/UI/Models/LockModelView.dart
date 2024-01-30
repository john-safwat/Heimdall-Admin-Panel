import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseState.dart';
import 'package:heimdalladmin/Models/Model/Model.dart';
import 'package:heimdalladmin/UI/AddModel/AddModelView.dart';
import 'package:heimdalladmin/UI/Models/LockModelNavigator.dart';
import 'package:heimdalladmin/UI/Models/LockModelViewModel.dart';
import 'package:heimdalladmin/UI/Widgets/ModelCard.dart';
import 'package:provider/provider.dart';

class LockModelView extends StatefulWidget {

  static const String routeName = "LockModel";
  const LockModelView({super.key});

  @override
  State<LockModelView> createState() => _LockModelViewState();
}

class _LockModelViewState extends BaseState<LockModelView , LockModelViewModel> implements LockModelNavigator {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title: const Text("Lock Model"),),
        body : StreamBuilder<QuerySnapshot<Model>>(
          stream: viewModel.database.getModelsStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error!.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text(
                  "There is No Components To Show",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            } else {
              viewModel.models = snapshot.data!.docs.map((e) => e.data()).toList();
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 20,),
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) => ModelCard(
                    model: viewModel.models[index],
                    onCardClick: viewModel.goToAddHardwareScreen),
                itemCount: viewModel.models.length,
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            viewModel.onFloatingActionButtonPress();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  LockModelViewModel initViewModel() {
    return LockModelViewModel();
  }

  @override
  goToAddModelScreen() {
    Navigator.pushNamed(context, AddModelView.routeName);
  }

  @override
  goToAddModelScreenWithData(Model model) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddModelView(
              model: model,
            )));
  }
}
