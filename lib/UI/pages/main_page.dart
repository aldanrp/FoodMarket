part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int selectedPage;
  const MainPage({Key? key, required this.selectedPage}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  bool pageSelect = true;
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.selectedPage);
    if (pageSelect == true) {
      selectedPage = widget.selectedPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: kfalse,
            ),
          ),
          SafeArea(
              child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedPage = index;
                pageSelect = false;
              });
            },
            children: [
              const Center(
                child: FoodPage(),
              ),
              const Center(child: OrderHistoryPage()),
              ProfilePage(
                user: (context.read<UserCubit>().state as UserLoaded).user,
              ),
            ],
          )),
          Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavigation(
                selectIndex: selectedPage,
                onTap: (index) {
                  setState(() {
                    selectedPage = index;
                    pageSelect = false;
                  });

                  pageController.jumpToPage(selectedPage);
                },
              ))
        ],
      ),
    );
  }
}
