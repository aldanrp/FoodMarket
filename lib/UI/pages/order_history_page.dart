part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsCubit, TransactionsState>(
      builder: (context, state) {
        if (state is TransactionsLoaded) {
          if (state.transactions.isEmpty) {
            return const OrderEmptyPages();
          } else {
            return GeneralPage(
                title: 'You Orders',
                subtitle: 'wait for the best meal',
                child: RefreshIndicator(
                  onRefresh: () async {
                    await context.read<TransactionsCubit>().getTransactions();
                  },
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
                            Builder(
                              builder: (_) {
                                List<Transaction> transaction = (selectIndex ==
                                        0)
                                    ? state.transactions
                                        .where((element) =>
                                            element.status ==
                                                TransactionStatus.on_delivery ||
                                            element.status ==
                                                TransactionStatus.pending)
                                        .toList()
                                    : state.transactions
                                        .where((element) =>
                                            element.status ==
                                                TransactionStatus.delivered ||
                                            element.status ==
                                                TransactionStatus.cancelled)
                                        .toList();
                                return Column(
                                  children: transaction
                                      .map(
                                        (e) => Padding(
                                          padding: const EdgeInsets.only(
                                            right: defaultmargin,
                                            bottom: 16,
                                          ),
                                          child: GestureDetector(
                                              onTap: () async {
                                                if (e.status ==
                                                    TransactionStatus.pending) {
                                                  await launchUrl(
                                                    Uri.parse(
                                                      e.paymentUrl.toString(),
                                                    ),
                                                  );
                                                }
                                              },
                                              child: OrderItemsFood(
                                                  transactionfood: e)),
                                        ),
                                      )
                                      .toList(),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 60,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                backColor: ksecondary,
                leftcallback: false);
          }
        } else {
          return Center(
            child: loadingIndicator,
          );
        }
      },
    );
  }
}
