import 'package:flutter/material.dart';
import 'package:restaurant_food/shared/shared.dart';

class CustomTabbar extends StatelessWidget {
  final int selectIndex;
  final List<String> titles;
  final Function(int) ontap;

  const CustomTabbar(
      {Key? key,
      required this.selectIndex,
      required this.titles,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 1,
            color: kwhite2,
          ),
          Row(
            children: titles
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(
                      left: defaultmargin,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ontap(titles.indexOf(e));
                          },
                          child: Text(
                            e,
                            style: (titles.indexOf(e) == selectIndex)
                                ? blackFontstyle2.copyWith(
                                    fontWeight: FontWeight.w600)
                                : greyFontstyle,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 3,
                          margin: const EdgeInsets.only(top: 13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.5),
                            color: (titles.indexOf(e) == selectIndex)
                                ? const Color(0xFF020202)
                                : Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
