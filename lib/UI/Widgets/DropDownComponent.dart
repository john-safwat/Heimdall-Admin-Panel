import 'package:flutter/material.dart';
import 'package:heimdalladmin/Models/Component/Component.dart';

class DropDownComponent extends StatelessWidget {
  Component component;
  DropDownComponent({required this.component , super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(
            component.image,
            height: 50,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.error , color: Colors.red , size: 50,),
          ),
          const SizedBox(width: 15,),
          Text(component.name , style: Theme.of(context).textTheme.titleLarge,)
        ],
      ),
    );
  }
}
