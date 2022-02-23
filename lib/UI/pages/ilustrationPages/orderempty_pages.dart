part of '../pages.dart';

class OrderEmptyPages extends StatelessWidget {
  const OrderEmptyPages({Key? key}) : super(key: key);

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
                height: 250,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/love_burger.png'),
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
                      "Ouch! Hungry",
                      style: blackFontstyle.copyWith(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Seems like you have not ordered any food yet",
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
                    'Finds Foods',
                    style:
                        blackFontstyle2.copyWith(fontWeight: FontWeight.w600),
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
