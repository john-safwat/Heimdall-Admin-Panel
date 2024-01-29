import 'package:flutter/material.dart';
class DialogUtils{
  static void showDialogMessage({required String message ,required BuildContext context , bool idDismissible = false}){
    showDialog(context: context, builder: (buildContext){
      return AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 10,),
            Text(message , style: Theme.of(context).textTheme.titleLarge,),
          ],
        ),
      );
    },
    barrierDismissible: idDismissible,
    );
  }

  static void hideDialogMessage ({required BuildContext context}){Navigator.pop(context);}

  static void showMessage ({required String message , required BuildContext context , bool idDismissible = false ,
    String? posActionTitle , VoidCallback? posAction, String? nigActionTitle , VoidCallback? nigAction}) {
    showDialog(context: context, builder: (context) {
      List<Widget> actionsList = [] ;
      if(posActionTitle != null){
        actionsList.add(TextButton (
            onPressed: (){
              Navigator.pop(context);
              if (posAction !=  null) {
                posAction();
              }
            },
            child: Text(posActionTitle , style: Theme.of(context).textTheme.titleLarge,)
          )
        );
      }
      if(nigActionTitle != null){
        actionsList.add(TextButton (
            onPressed: (){
              Navigator.pop(context);
              if (nigAction != null) {
                nigAction();
              }
            },
            child: Text(nigActionTitle , style: Theme.of(context).textTheme.titleLarge,)
        )
        );
      }
        return AlertDialog(
          content: Text(message , style: Theme.of(context).textTheme.titleLarge,),
          actions: actionsList,
        );
      },
      barrierDismissible: idDismissible,
    );
  }
}