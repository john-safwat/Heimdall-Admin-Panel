import 'package:flutter/material.dart';
import 'package:heimdalladmin/Models/Reports/Report.dart';
import 'package:heimdalladmin/Theme/MyTheme.dart';

class ReportCard extends StatelessWidget {
  Report report;
  Function onPress;
  ReportCard({required this.report, required this.onPress , super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyTheme.cafe,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Report Id : ${report.id}" , style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.black),),
          Text("Email : ${report.email}"  , style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.black),),
          Text("Message : ${report.message}"  , style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.black),),
          Text("At : ${report.dateTime}"  , style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.black),),
        ],
      ),
    );
  }
}
