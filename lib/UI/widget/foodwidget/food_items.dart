import 'package:flutter/material.dart';
import 'package:restaurant_food/UI/widget/globalwidget/rating_stars.dart';
import 'package:restaurant_food/models/models.dart';
import 'package:restaurant_food/shared/shared.dart';

class ItemsFood extends StatelessWidget {
  final Food itemsFood;
  const ItemsFood({Key? key, required this.itemsFood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(20, 2, 20, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(itemsFood.picturePath),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemsFood.name,
                  style: blackFontstyle3.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  "IDR " + itemsFood.price.toString(),
                  style: greyFontstyle,
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: RatingStars(rate: itemsFood.rate))
        ],
      ),
    );
  }
}
