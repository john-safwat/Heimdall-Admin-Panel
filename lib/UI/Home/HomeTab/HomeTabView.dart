import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseState.dart';
import 'package:heimdalladmin/Theme/MyTheme.dart';
import 'package:heimdalladmin/UI/Hardware/HardwareView.dart';
import 'package:heimdalladmin/UI/Home/HomeTab/HomeTabNavigator.dart';
import 'package:heimdalladmin/UI/Home/HomeTab/HomeTabViewModel.dart';
import 'package:heimdalladmin/UI/Locks/LocksView.dart';
import 'package:heimdalladmin/UI/Models/LockModelView.dart';
import 'package:heimdalladmin/UI/RegisterLock/RegisterLockView.dart';

class HomeTabView extends StatefulWidget {
  static const String routeName = "Home";

  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends BaseState<HomeTabView, HomeTabViewModel>
    implements HomeTabNavigator {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                // the card of hardware components
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {goToHardwareComponentsScreen();},
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        decoration: BoxDecoration(
                            color: MyTheme.yellow,
                            borderRadius: BorderRadius.circular(40),
                            image: const DecorationImage(
                                alignment: Alignment.bottomCenter,
                                fit: BoxFit.fitWidth,
                                image: AssetImage(
                                    "assets/images/hardware_component.png"))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text(
                                "Hardware Components",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(width: 20),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        // card of register new lock data
                        Expanded(
                            child: InkWell(
                          onTap: () {viewModel.goToRegisterLockScreen();},
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            decoration: BoxDecoration(
                                color: MyTheme.pink,
                                borderRadius: BorderRadius.circular(40),
                                image: const DecorationImage(
                                    alignment: Alignment.centerLeft,
                                    fit: BoxFit.fitHeight,
                                    image: AssetImage(
                                        "assets/images/lock_registration.png"))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Expanded(child: SizedBox()),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Center(
                                      child: Text(
                                        "Register\nNew Lock\nData",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                        const SizedBox(height: 20),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {viewModel.goToLocksScreen();},
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                padding: const EdgeInsets.all(50),
                                decoration: BoxDecoration(
                                    color: MyTheme.red,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Column(
                                  children: [
                                    Text(
                                      "View\nLocks",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Expanded(
                                        child: Image.asset(
                                      "assets/images/view_locks.png",
                                      width: 300,
                                    ))
                                  ],
                                ),
                              ),
                            )),
                            const SizedBox(width: 20),
                            Expanded(
                                child: InkWell(
                              onTap: () {viewModel.goToLockModelScreen();},
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: MyTheme.cafe,
                                    borderRadius: BorderRadius.circular(40),
                                    image: const DecorationImage(
                                        alignment: Alignment.bottomCenter,
                                        image: AssetImage(
                                            "assets/images/lock_model.png"))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0, vertical: 45),
                                      child: Text(
                                        "Lock Models",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ))
                      ],
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  HomeTabViewModel initViewModel() {
    return HomeTabViewModel();
  }

  @override
  goToHardwareComponentsScreen() {
    Navigator.pushNamed(context, HardwareView.routeName);
  }

  @override
  goToLockModelScreen() {
    Navigator.pushNamed(context, LockModelView.routeName);
  }

  @override
  goToRegisterLockScreen() {
    Navigator.pushNamed(context, RegisterLockView.routeName);
  }

  @override
  goToLocksScreen() {
    Navigator.pushNamed(context, LocksView.routeName);
  }
}
