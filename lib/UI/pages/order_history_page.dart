part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectIndex = 0;
  List<Transaction> inProgress = mockTransactions
      .where((element) =>
          element.status == TransactionStatus.on_delivery ||
          element.status == TransactionStatus.pending)
      .toList();
  List<Transaction> past = mockTransactions
      .where((element) =>
          element.status == TransactionStatus.delivered ||
          element.status == TransactionStatus.cancelled)
      .toList();

  @override
  Widget build(BuildContext context) {
    if (inProgress.isEmpty && past.isEmpty) {
      return const OrderEmptyPages();
    } else {
      return GeneralPage(
          title: 'You Orders',
          subtitle: 'wait for the best meal',
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    CustomTabbar(
                      selectIndex: selectIndex,
                      titles: const ['In Progress', 'Past Orders'],
                      ontap: (index) {
                        setState(() {
                          selectIndex = index;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: (selectIndex == 0 ? inProgress : past)
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(
                                    right: defaultmargin, bottom: 16),
                                child: OrderItemsFood(transactionfood: e),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              )
            ],
          ),
          backColor: ksecondary,
          leftcallback: false);
    }
  }
}
