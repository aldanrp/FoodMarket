part of 'pages.dart';

class PaymentPage extends StatelessWidget {
  final Food transaction;
  const PaymentPage({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralPage(
          title: "Payment",
          subtitle: "You deserve better meal",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                child: Text(
                  "Item Ordered",
                  style: blackFontstyle2,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    height: 80,
                    color: kfalse,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(transaction.picturePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          color: ksecondary,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 180,
                                child: Text(
                                  transaction.name,
                                  style: blackFontstyle2.copyWith(fontSize: 16),
                                ),
                              ),
                              Text(
                                NumberFormat.currency(
                                        locale: 'id-ID',
                                        symbol: 'IDR ',
                                        decimalDigits: 0)
                                    .format(transaction.price),
                                style: greyFontstyle.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.fromLTRB(0, 8, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "14 items",
                          style: greyFontstyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                child: Text(
                  "Detail Transaction",
                  style: blackFontstyle2,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(),
            ],
          ),
          backColor: ksecondary,
          leftcallback: true),
    );
  }
}
