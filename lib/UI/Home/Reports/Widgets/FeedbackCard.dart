import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:heimdalladmin/Models/Feedback/Feedback.dart';
import 'package:heimdalladmin/Theme/MyTheme.dart';

class FeedbackCard extends StatelessWidget {

  Function onItemPress;
  UserFeedback feedback;

  FeedbackCard({required this.feedback , required this.onItemPress , super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyTheme.cafe,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                feedback.image ,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>const Icon(Icons.error , color: MyTheme.black , size: 40,),
              ),
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(feedback.userName , style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.black),),
                Text(feedback.message , style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.black),),
                RatingBar.builder(
                  initialRating: feedback.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemPadding:const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) =>const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                  updateOnDrag: false,
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
