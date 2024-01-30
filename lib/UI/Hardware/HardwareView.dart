import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseState.dart';
import 'package:heimdalladmin/Models/Component/Component.dart';
import 'package:heimdalladmin/UI/AddComponent/AddHardwareComponentView.dart';
import 'package:heimdalladmin/UI/Hardware/HardwareNavigator.dart';
import 'package:heimdalladmin/UI/Hardware/HardwareViewModel.dart';
import 'package:heimdalladmin/UI/Widgets/ComponentCard.dart';
import 'package:provider/provider.dart';

class HardwareView extends StatefulWidget {
  static const String routeName = "Hardware";

  const HardwareView({super.key});

  @override
  State<HardwareView> createState() => _HardwareViewState();
}

class _HardwareViewState extends BaseState<HardwareView, HardwareViewModel>
    implements HardwareNavigator {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hardware Components"),
        ),
        body: StreamBuilder<QuerySnapshot<Component>>(
          stream: viewModel.database.getComponentsStream(),
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
              viewModel.components =
                  snapshot.data!.docs.map((e) => e.data()).toList();
              return GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.2),
                itemBuilder: (context, index) => ComponentCard(
                    component: viewModel.components[index],
                    onCardClick: viewModel.goToAddHardwareScreen),
                itemCount: viewModel.components.length,
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
  HardwareViewModel initViewModel() {
    return HardwareViewModel();
  }

  @override
  goToAddComponentScreen() {
    Navigator.pushNamed(context, AddHardwareView.routeName);
  }

  @override
  goToAddComponentScreenWithData(Component component) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddHardwareView(
                  component: component,
                )));
  }
}
