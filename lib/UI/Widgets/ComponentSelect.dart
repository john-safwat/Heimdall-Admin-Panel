import 'package:flutter/material.dart';
import 'package:heimdalladmin/Models/Component/Component.dart';
import 'package:heimdalladmin/Theme/MyTheme.dart';
import 'package:heimdalladmin/UI/Widgets/DropDownComponent.dart';

class ComponentSelect extends StatefulWidget {
  List<Component> components;
  Component component;
  Function changeSelectedComponent;
  String title;

  ComponentSelect(
      {required this.component, required this.components, required this.title, required this.changeSelectedComponent, super.key});

  @override
  State<ComponentSelect> createState() => _ComponentSelectState();
}

class _ComponentSelectState extends State<ComponentSelect> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: Theme
            .of(context)
            .textTheme
            .titleLarge,),
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: MyTheme.cafe, width: 2),
              borderRadius: BorderRadius.circular(20)
          ),
          child: DropdownButton<Component>(
            dropdownColor: MyTheme.black,
            isExpanded: true,
            icon: const Icon(
              Icons.arrow_drop_down_rounded, size: 30, color: MyTheme.cafe,),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            borderRadius: BorderRadius.circular(20),
            value: widget.component,
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            items: widget.components.map<DropdownMenuItem<Component>>((
                component) {
              return DropdownMenuItem<Component>(
                  value: component,
                  child: DropDownComponent(component: component,)
              );
            },).toList(),
            onChanged: (value) => widget.changeSelectedComponent(value!),
          ),
        ),
      ],
    );
  }
}
