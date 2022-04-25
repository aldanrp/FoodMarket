part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            //* HEADER
            Container(
              padding: const EdgeInsets.symmetric(horizontal: defaultmargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FoodMarket",
                        style: blackFontstyle,
                      ),
                      Text(
                        "Let's get some foods",
                        style:
                            greyFontstyle.copyWith(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                            (context.read<UserCubit>().state as UserLoaded)
                                .user
                                .picturePath
                                .toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //* list of food
            Container(
              height: 258,
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              width: double.infinity,
              child: BlocBuilder<FoodCubit, FoodState>(
                builder: (context, state) => (state is FoodLoaded)
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.foods.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => DetailsPage(
                                  transaction: state.foods[index],
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: (index == 0) ? defaultmargin : 0,
                                right: defaultmargin,
                              ),
                              child: FoodCard(
                                food: state.foods[index],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(child: loadingIndicator),
              ),
            ),
            //* List Tabbar
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabbar(
                    selectIndex: selectIndex,
                    titles: const ["New Taste", "Popular", "Recommended"],
                    ontap: (index) {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
                    if (state is FoodLoaded) {
                      List<Food> body = state.foods
                          .where((element) =>
                              element.types.contains((selectIndex == 0)
                                  ? FoodType.newfood
                                  : (selectIndex == 1)
                                      ? FoodType.popular
                                      : FoodType.recommended))
                          .toList();
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: body.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              top: (index == 0) ? 0 : 10,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => DetailsPage(
                                    transaction: body[index],
                                  ),
                                );
                              },
                              child: ItemsFood(itemsFood: body[index]),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(child: loadingIndicator);
                    }
                  }),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
