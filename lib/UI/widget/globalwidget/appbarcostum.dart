import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_food/shared/shared.dart';

class AppbarCostum extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool leftcallback;

  const AppbarCostum({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.leftcallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (leftcallback == true)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const ImageIcon(
                  AssetImage("assets/images/back_arrow.png"),
                  size: 20,
                  color: kblack,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      color: ksecondary2,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      color: ksecondary2,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
