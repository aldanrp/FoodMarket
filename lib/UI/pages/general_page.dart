part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final bool leftcallback;
  final Color backColor;

  const GeneralPage(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.child,
      required this.backColor,
      required this.leftcallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          SafeArea(
            child: Container(
              color: backColor,
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: defaultmargin),
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultmargin),
                        width: double.infinity,
                        height: 80,
                        color: Colors.white,
                        child: (leftcallback == true)
                            ? AppbarCostum(
                                title: title,
                                subtitle: subtitle,
                                leftcallback: leftcallback)
                            : AppbarCostum(
                                title: title,
                                subtitle: subtitle,
                                leftcallback: leftcallback)),
                    child,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
