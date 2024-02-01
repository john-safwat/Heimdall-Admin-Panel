import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseState.dart';
import 'package:heimdalladmin/Models/Lock/Lock.dart';
import 'package:heimdalladmin/Models/Model/Model.dart';
import 'package:heimdalladmin/Theme/MyTheme.dart';
import 'package:heimdalladmin/UI/RegisterLock/RegisterLockNavigator.dart';
import 'package:heimdalladmin/UI/RegisterLock/RegisterLockViewModel.dart';
import 'package:provider/provider.dart';

class RegisterLockView extends StatefulWidget {
  static const String routeName = "RegisterLock";
  const RegisterLockView({super.key});

  @override
  State<RegisterLockView> createState() => _RegisterLockViewState();
}

class _RegisterLockViewState
    extends BaseState<RegisterLockView, RegisterLockViewModel>
    implements RegisterLockNavigator {

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
          title: const Text("Register New Lock"),
        ),
        body: Consumer<RegisterLockViewModel>(
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
            } else if (value.models.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                Form(
                                  key: viewModel.formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        style: Theme.of(context).textTheme.bodyLarge,
                                        controller: value.emailController,
                                        validator: (value) {
                                          return viewModel.emailValidation(value ?? "");
                                        },
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        cursorColor: Theme.of(context).primaryColor,
                                        keyboardType: TextInputType.emailAddress,
                                        cursorHeight: 20,
                                        decoration: const InputDecoration(
                                            hintText: "Email",
                                            contentPadding: EdgeInsets.all(20)),
                                      ),
                                      const SizedBox(height: 20,),
                                      TextFormField(
                                        style: Theme.of(context).textTheme.bodyLarge,
                                        controller: value.passwordController,
                                        validator: (value) {
                                          return viewModel.passwordValidation(value ?? "");
                                        },
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        cursorColor: Theme.of(context).primaryColor,
                                        keyboardType: TextInputType.emailAddress,
                                        cursorHeight: 20,
                                        decoration: const InputDecoration(
                                            hintText: "Password",
                                            contentPadding: EdgeInsets.all(20)),
                                      ),
                                      const SizedBox(height: 20,),
                                      Text("Model", style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleLarge,),
                                      const SizedBox(height: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: MyTheme.cafe, width: 2),
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: DropdownButton<Model>(
                                          dropdownColor: MyTheme.black,
                                          isExpanded: true,
                                          icon: const Icon(
                                            Icons.arrow_drop_down_rounded, size: 30, color: MyTheme.cafe,),
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                          borderRadius: BorderRadius.circular(20),
                                          value: viewModel.selectedModel,
                                          underline: Container(
                                            height: 0,
                                            color: Colors.transparent,
                                          ),
                                          items: viewModel.models.map<DropdownMenuItem<Model>>((
                                              model) {
                                            return DropdownMenuItem<Model>(
                                                value: model,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Image.network(
                                                        model.image!,
                                                        height: 50,
                                                        fit: BoxFit.contain,
                                                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error , color: Colors.red , size: 50,),
                                                      ),
                                                      const SizedBox(width: 15,),
                                                      Text(model.name!, style: Theme.of(context).textTheme.titleLarge,)
                                                    ],
                                                  ),
                                                )
                                            );
                                          },).toList(),
                                          onChanged: (value) => viewModel.changeSelectedModel(value!),
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                                const SizedBox(height: 20,),
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
                        ],
                      ),
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
  RegisterLockViewModel initViewModel() {
    return RegisterLockViewModel();
  }
}
