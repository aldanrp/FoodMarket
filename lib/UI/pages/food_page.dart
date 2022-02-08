part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
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
                      // image: const DecorationImage(
                      //   image: NetworkImage(
                      //       'https://i.pinimg.com/474x/8a/f4/7e/8af47e18b14b741f6be2ae499d23fcbe.jpg'),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                ],
              ),
            ),
            //* list of food
            SizedBox(
              height: 258,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: mockFoods.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: (index == 0) ? defaultmargin : 0,
                      right: defaultmargin,
                    ),
                    child: FoodCard(
                      food: mockFoods[index],
                    ),
                  );
                },
              ),
            ),
            //* List Tabbar
          ],
        ),
      ],
    );
  }
}
