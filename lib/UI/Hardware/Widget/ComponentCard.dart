import 'package:flutter/material.dart';
import 'package:heimdalladmin/Models/Component.dart';
import 'package:heimdalladmin/Theme/MyTheme.dart';

class ComponentCard extends StatelessWidget {

  Component component;
  Function onCardClick;
  ComponentCard({required this.component, required this.onCardClick , super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){onCardClick(component);},
      child: Container(
        decoration: BoxDecoration(
          color: MyTheme.cafe,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2 , color: MyTheme.cafe)
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  component.image,
                  height: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error , color: Colors.red , size: 50,),
                ),
              )
            ),
            Container(
              width: double.infinity,
              padding:const EdgeInsets.symmetric(horizontal:20 , vertical: 10),
              decoration: BoxDecoration(
                color: MyTheme.black,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text(component.name , style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,)
            )
          ],
        ),
      ),
    );
  }
}
