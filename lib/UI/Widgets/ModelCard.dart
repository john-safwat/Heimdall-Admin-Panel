import 'package:flutter/material.dart';
import 'package:heimdalladmin/Models/Model/Model.dart';
import 'package:heimdalladmin/Theme/MyTheme.dart';

class ModelCard extends StatelessWidget {
  Model model;
  Function onCardClick;
  ModelCard({required this.model ,required this.onCardClick , super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onCardClick(model);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: MyTheme.cafe,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(model.name! , style: Theme.of(context).textTheme.displayMedium!.copyWith(color: MyTheme.black , fontWeight: FontWeight.bold)),
            Image.network(model.image!, width: 400 , fit:BoxFit.contain,),
            Text("ID : ${model.id!}" , style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.black)),

          ],
        ),
      ),
    );
  }
}
