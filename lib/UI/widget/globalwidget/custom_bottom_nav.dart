import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectIndex;
  final Function(int index) onTap;
  const CustomBottomNavigation(
      {Key? key, required this.onTap, this.selectIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onTap(0);
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: (selectIndex == 0)
                      ? const AssetImage('assets/images/ic_home.png')
                      : const AssetImage('assets/images/ic_home_normal.png'),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(1);
            },
            child: Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.symmetric(horizontal: 83),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: (selectIndex == 1)
                      ? const AssetImage('assets/images/ic_order.png')
                      : const AssetImage('assets/images/ic_order_normal.png'),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(2);
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: (selectIndex == 2)
                      ? const AssetImage('assets/images/ic_profile.png')
                      : const AssetImage('assets/images/ic_profile_normal.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
