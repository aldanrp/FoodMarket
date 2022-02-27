part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 130,
                  width: 130,
                  margin: const EdgeInsets.only(top: 26),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/photo_border.png"),
                    ),
                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(widget.user.picturePath),
                        fit: BoxFit.cover,
                      ),
                      color: ksecondary2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  widget.user.name,
                  style: blackFontstyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  widget.user.email,
                  style: greyFontstyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 24,
            color: ksecondary2.withOpacity(0.1),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
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
                  height: 3,
                ),
                Builder(builder: (_) {
                  List<String> profileSettings = [
                    'Edit Profile',
                    'Home Address',
                    'Security',
                    'Payments',
                  ];

                  List<String> foodMarketSettings = [
                    'Rate App',
                    'Help Center',
                    'Privacy & Policy',
                    'Terms & Conditions',
                  ];
                  Widget body = (selectIndex == 0)
                      ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: profileSettings.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 10,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  print(profileSettings[index]);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      profileSettings[index],
                                      style: GoogleFonts.poppins(
                                        color: kblack,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const ImageIcon(
                                      AssetImage(
                                          'assets/images/right_arrow.png'),
                                      size: 20,
                                      color: kblack,
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: foodMarketSettings.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 10,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  print(foodMarketSettings[index]);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      foodMarketSettings[index],
                                      style: GoogleFonts.poppins(
                                        color: kblack,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const ImageIcon(
                                      AssetImage(
                                          'assets/images/right_arrow.png'),
                                      size: 20,
                                      color: kblack,
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                  return body;
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
