part of '../pages.dart';

class SuccessOrderPages extends StatelessWidget {
  const SuccessOrderPages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 100,
                ),
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bike.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                height: 100,
                width: 300,
                child: Column(
                  children: [
                    Text(
                      "You've Made Order",
                      style: blackFontstyle.copyWith(fontSize: 25),
                    ),
                    Text(
                      "Just stay at home while we are preparing your best foods",
                      style: greyFontstyle.copyWith(fontSize: 20),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: 300,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kprimary,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Order Other Foods',
                    style:
                        blackFontstyle2.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: 300,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ksecondary2.withOpacity(0.7),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'View My Order',
                    style: blackFontstyle2.copyWith(
                        fontWeight: FontWeight.w500, color: ksecondary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
