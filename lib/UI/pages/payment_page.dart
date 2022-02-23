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
          child: Container(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Item Ordered",
                  style: blackFontstyle2,
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
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
                                    style:
                                        blackFontstyle2.copyWith(fontSize: 16),
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
                  height: 15,
                ),
                Text(
                  "Detail Transaction",
                  style: blackFontstyle2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        transaction.name,
                        style: greyFontstyle.copyWith(fontSize: 18),
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0)
                          .format(transaction.price),
                      style: blackFontstyle2.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        "Driver",
                        style: greyFontstyle.copyWith(fontSize: 18),
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0)
                          .format(transaction.price),
                      style: blackFontstyle2.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        "Tax 10%",
                        style: greyFontstyle.copyWith(fontSize: 18),
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0)
                          .format(transaction.price),
                      style: blackFontstyle2.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        "Total Price :",
                        style: greyFontstyle.copyWith(fontSize: 18),
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0)
                          .format(transaction.price),
                      style: blackFontstyle2.copyWith(
                        fontSize: 16,
                        color: const Color(0xff1abc9c),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  height: 25,
                  color: kfalse,
                ),
                Text(
                  "Deliver to : ",
                  style: blackFontstyle2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        "Name :",
                        style: greyFontstyle.copyWith(fontSize: 18),
                      ),
                    ),
                    Text(
                      "Aldan",
                      style: blackFontstyle2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        "Phone Number : ",
                        style: greyFontstyle.copyWith(fontSize: 18),
                      ),
                    ),
                    Text(
                      "0856953643423",
                      style: blackFontstyle2.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        "Address :",
                        style: greyFontstyle.copyWith(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      child: Text(
                        "Jln.Margi Utami Rt.03/07 no.60, Bantargebang, Bekasi",
                        style: blackFontstyle3,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kprimary,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Checkout Now',
                      style:
                          blackFontstyle3.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          backColor: ksecondary,
          leftcallback: true),
    );
  }
}
