part of 'pages.dart';

class PaymentMethodsPage extends StatelessWidget {
  final String paymentUrl;

  const PaymentMethodsPage({Key? key, required this.paymentUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: 'Finish your payment',
        subtitle: 'Please select your favourite \npayment method',
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
                    image: AssetImage('assets/images/Payment.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 100,
                width: 300,
                child: Column(
                  children: [
                    Text(
                      "Yuk langsung dibayar pesananannya \n Click Tombol ini yaaa...",
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
                  onPressed: () async {
                    await launchUrl(Uri.parse(paymentUrl));
                  },
                  child: Text(
                    'Bayar disini',
                    style:
                        blackFontstyle2.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: 100,
                width: 300,
                child: Column(
                  children: [
                    Text(
                      "Sudah dibayar pesananannya ? \n Yuk liat Status pesanan mu.. ",
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
                  color: ksecondary2.withOpacity(0.7),
                ),
                child: TextButton(
                  onPressed: () {
                    Get.offAll(() => const MainPage(
                          selectedPage: 1,
                        ));
                    //Get.offAll(() => const MainPage());
                  },
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
        backColor: ksecondary,
        leftcallback: true);
  }
}
