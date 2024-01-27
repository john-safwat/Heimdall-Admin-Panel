import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heimdalladmin/Base/BaseState.dart';
import 'package:heimdalladmin/UI/AddComponent/AddHardwareComponentNavigator.dart';
import 'package:heimdalladmin/UI/AddComponent/AddHardwareComponentViewModel.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class AddHardwareView extends StatefulWidget {
  static const String routeName = 'AddHardware';

  const AddHardwareView({super.key});

  @override
  State<AddHardwareView> createState() => _AddHardwareViewState();
}

class _AddHardwareViewState
    extends BaseState<AddHardwareView, AddHardwareComponentViewModel>
    implements AddHardwareComponentNavigator {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<AddHardwareComponentViewModel>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: const Text("Add New Component"),
          ),
          body: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: viewModel.pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: viewModel.image != null
                          ? Image.memory(
                              Uint8List.fromList(viewModel.image!.bytes!),
                              height: double.infinity,
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
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Form(
                    child: Column(
                      children: [
                        TextFormField(
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
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: Theme.of(context).textTheme.bodyLarge,
                          controller: value.descriptionController,
                          validator: (value) {
                            return viewModel.descriptionValidation(value ?? "");
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Theme.of(context).primaryColor,
                          keyboardType: TextInputType.emailAddress,
                          cursorHeight: 20,
                          maxLines: 10,
                          decoration: const InputDecoration(
                            hintText: "Description",
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: Theme.of(context).textTheme.bodyLarge,
                          controller: value.costController,
                          validator: (value) {
                            return viewModel.costValidation(value ?? "");
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Theme.of(context).primaryColor,
                          keyboardType: TextInputType.number,
                          cursorHeight: 20,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9,.,-]+')),
                          ],
                          decoration: const InputDecoration(
                            hintText: "Cost",
                          ),
                        ),
                        const SizedBox(height: 20),
                        // drop down to select the gender
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 2 , color: Theme.of(context).primaryColor)
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: const SizedBox(),
                            // Initial Value
                            value: value.selectedType,
                            style: Theme.of(context).textTheme.titleMedium,
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                            // Down Arrow Icon
                            icon: Icon(EvaIcons.arrow_down , color: Theme.of(context).primaryColor,),
                            // Array list of items
                            items: value.types.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2),
                                  child: Text(items),
                                ),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (type) => value.changeSelectedType(type??"none"),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        ElevatedButton(
                            onPressed: (){},
                            child:const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Add Component"),
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  AddHardwareComponentViewModel initViewModel() {
    return AddHardwareComponentViewModel();
  }
}
