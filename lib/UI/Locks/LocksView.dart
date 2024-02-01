import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseState.dart';
import 'package:heimdalladmin/Theme/MyTheme.dart';
import 'package:heimdalladmin/UI/Locks/LocksNavigator.dart';
import 'package:heimdalladmin/UI/Locks/LocksViewModel.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class LocksView extends StatefulWidget {
  const LocksView({super.key});
  static const String routeName = "Locks";
  @override
  State<LocksView> createState() => _LocksViewState();
}

class _LocksViewState extends BaseState<LocksView , LocksViewModel> implements LocksNavigator {

  @override
  void initState() {
    super.initState();
    viewModel.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Locks"),
        ),
        body: Consumer<LocksViewModel>(
          builder: (context, value, child) {
            if (value.errorMessage != null) {
              return Column(
                children: [
                  Text(
                    value.errorMessage!,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.loadData();
                      },
                      child: const Text("Reload"))
                ],
              );
            } else if (value.locks.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(20),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.9),
                        itemBuilder: (context, index) => InkWell(
                          onTap: (){
                            viewModel.onCardClick(lock: viewModel.locks[index]);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: MyTheme.cafe,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: QrImageView(
                                    data: viewModel.locks[index].id,
                                    size: double.infinity,
                                    dataModuleStyle: const QrDataModuleStyle(
                                      color: MyTheme.black,
                                      dataModuleShape: QrDataModuleShape.square
                                    ),
                                    eyeStyle:const QrEyeStyle(
                                      color: MyTheme.black,
                                      eyeShape: QrEyeShape.square
                                    ),

                                  ),
                                ),
                                Text(viewModel.locks[index].email ,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.black),)
                              ],
                            ),
                          ),
                        ),
                        itemCount: viewModel.locks.length,
                      )
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  LocksViewModel initViewModel() {
    return LocksViewModel();
  }
}
