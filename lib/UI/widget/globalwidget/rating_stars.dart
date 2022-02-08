import 'package:flutter/material.dart';
import 'package:restaurant_food/shared/shared.dart';

class RatingStars extends StatelessWidget {
  final double rate;
  const RatingStars({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberofState = rate.round();
    return Row(
      children: List<Widget>.generate(
            5,
            (index) => Icon(
                (index < numberofState)
                    ? Icons.star
                    : Icons.star_border_outlined,
                size: 16,
                color: kprimary),
          ) +
          [
            const SizedBox(
              width: 4,
            ),
            Text(
              rate.toString(),
              style: greyFontstyle.copyWith(fontSize: 14),
            ),
          ],
    );
  }
}
