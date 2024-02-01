import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseState.dart';
import 'package:heimdalladmin/Models/Model/Model.dart';
import 'package:heimdalladmin/UI/AddModel/AddModelNavigator.dart';
import 'package:heimdalladmin/UI/AddModel/AddModelViewModel.dart';
import 'package:heimdalladmin/UI/Widgets/ComponentCard.dart';
import 'package:heimdalladmin/UI/Widgets/ComponentSelect.dart';
import 'package:provider/provider.dart';

class AddModelView extends StatefulWidget {
  static const String routeName = "AddModel";
  Model? model;

  AddModelView({this.model, super.key});

  @override
  State<AddModelView> createState() => _AddModelViewState();
}

class _AddModelViewState extends BaseState<AddModelView, AddModelViewModel>
    implements AddModelNavigator {
  @override
  void initState(){
    super.initState();
    viewModel.loadData();
    if(widget.model!= null){
      viewModel.initScreenData(widget.model!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Lock Model"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Consumer<AddModelViewModel>(
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
              }else if (value.components.isEmpty){
                return const Center(child: CircularProgressIndicator());
              }else {
                return Row(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          InkWell(
                            onTap: viewModel.pickImage,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).width*0.3,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: viewModel.image != null
                                  ? Image.memory(
                                Uint8List.fromList(viewModel.image!.bytes!),
                                height: double.infinity,
                              )
                                  : viewModel.model != null
                                  ? Image.network(
                                viewModel.model!.image!,
                                height: double.infinity,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 50,
                                ),
                              )
                                  : Center(
                                  child: Text(
                                    "Pick Image",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Form(
                            key: viewModel.formKey,
                            child: TextFormField(
                              style: Theme.of(context).textTheme.bodyLarge,
                              controller: value.nameController,
                              validator: (value) {
                                return viewModel.nameValidation(value ?? "");
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              cursorColor: Theme.of(context).primaryColor,
                              keyboardType: TextInputType.name,
                              cursorHeight: 20,
                              decoration: const InputDecoration(
                                  hintText: "Name",
                                  contentPadding: EdgeInsets.all(20)
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ComponentSelect(
                            component: viewModel.selectedBoard,
                            title: "Board",
                            changeSelectedComponent: viewModel.changeSelectedBoard,
                            components: viewModel.boards,
                          ),
                          const SizedBox(height: 15,),
                          ComponentSelect(
                            component: viewModel.selectedCamera,
                            title: "Camera",
                            changeSelectedComponent: viewModel.changeSelectedCamera,
                            components: viewModel.cameras,
                          ),
                          const SizedBox(height: 15,),
                          ComponentSelect(
                            component: viewModel.selectedSensor,
                            title: "Sensor",
                            changeSelectedComponent: viewModel.changeSelectedSensor,
                            components: viewModel.sensors,
                          ),
                          const SizedBox(height: 15,),
                          ComponentSelect(
                            component: viewModel.selectedLock,
                            title: "Lock",
                            changeSelectedComponent: viewModel.changeSelectedLock,
                            components: viewModel.locks,
                          ),
                          const SizedBox(height: 15,),
                          ComponentSelect(
                            component: viewModel.selectedKeypad,
                            title: "Keypad",
                            changeSelectedComponent: viewModel.changeSelectedKeypad,
                            components: viewModel.keypads,
                          ),
                          const SizedBox(height: 25,),
                          ElevatedButton(
                              onPressed: () {
                                viewModel.onSavePress();
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Save"),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(child: GridView.builder(

                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 1.2),
                      itemBuilder: (context, index) => ComponentCard(
                          component: viewModel.selectedComponents[index],
                          onCardClick: viewModel.removeComponent),
                      itemCount: viewModel.selectedComponents.length,
                    ))
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  AddModelViewModel initViewModel() {
    return AddModelViewModel();
  }
}
