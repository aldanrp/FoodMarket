part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Food transaction;
  final int quantiy;
  const PaymentPage(
      {Key? key, required this.transaction, required this.quantiy})
      : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  int driver = 25000;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var total = widget.transaction.price * widget.quantiy;
    var tax = total * 10 / 100;
    User user = (context.read<UserCubit>().state as UserLoaded).user;

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
                                image: NetworkImage(
                                    widget.transaction.picturePath),
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
                                    widget.transaction.name,
                                    style:
                                        blackFontstyle2.copyWith(fontSize: 16),
                                  ),
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'IDR ',
                                          decimalDigits: 0)
                                      .format(widget.transaction.price),
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
                            widget.quantiy.toString(),
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
                        widget.transaction.name,
                        style: greyFontstyle.copyWith(fontSize: 18),
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0)
                          .format(total),
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
                          .format(driver),
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
                          .format(tax),
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
                          .format(total + tax + driver),
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
                      user.name,
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
                      user.phoneNumber,
                      style: blackFontstyle2.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        "Address :",
                        style: greyFontstyle.copyWith(fontSize: 18),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          user.address,
                          style: blackFontstyle3,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                (isLoading == true)
                    ? Center(child: loadingIndicator)
                    : Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kprimary,
                        ),
                        child: TextButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            bool result = await context
                                .read<TransactionsCubit>()
                                .submitTransaction(Transaction(
                                    id: 1,
                                    food: widget.transaction,
                                    quantity: widget.quantiy,
                                    total: total,
                                    dateTime: DateTime.now(),
                                    status: TransactionStatus.pending,
                                    user: user));
                            if (result == true) {
                              Get.to(() => const SuccessOrderPages());
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              Get.snackbar("", "",
                                  backgroundColor: const Color(0xFFD9435E),
                                  icon: const Icon(Icons.close_rounded,
                                      color: Colors.white),
                                  titleText: Text(
                                    "Transaction Failde",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  messageText: Text(
                                    "Please Try again later...",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ));
                            }
                          },
                          child: Text(
                            'Checkout Now',
                            style: blackFontstyle3.copyWith(
                                fontWeight: FontWeight.w500),
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
