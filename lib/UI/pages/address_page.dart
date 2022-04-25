part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final String name;
  final String email;
  final String password;
  final File pictureFile;

  const AddressPage(
      {Key? key,
      required this.name,
      required this.email,
      required this.password,
      required this.pictureFile})
      : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isLoading = false;
  late List<String> cities;
  var selectedCity;

  @override
  void initState() {
    super.initState();

    cities = ["Jakarta", "Bandung", "Surabaya", "Bali"];

    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: 'Address',
        subtitle: "make sure it's valid",
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                  defaultmargin, 26, defaultmargin, 6),
              child: Text(
                "Phone No.",
                style: blackFontstyle2,
              ),
            ),
            const SizedBox(height: 1),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: defaultmargin),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kblack),
              ),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontstyle,
                  hintText: 'type your phone number',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                  defaultmargin, 26, defaultmargin, 6),
              child: Text(
                "Address",
                style: blackFontstyle2,
              ),
            ),
            const SizedBox(height: 1),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: defaultmargin),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kblack),
              ),
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontstyle,
                  hintText: 'type your address',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                  defaultmargin, 26, defaultmargin, 6),
              child: Text(
                "House No.",
                style: blackFontstyle2,
              ),
            ),
            const SizedBox(height: 1),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: defaultmargin),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kblack),
              ),
              child: TextField(
                controller: houseController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontstyle,
                  hintText: 'type your home number',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                  defaultmargin, 26, defaultmargin, 6),
              child: Text(
                "City",
                style: blackFontstyle2,
              ),
            ),
            const SizedBox(height: 1),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: defaultmargin),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: kblack),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  underline: const SizedBox(),
                  borderRadius: BorderRadius.circular(10),
                  hint: Text(
                    "Select your city",
                    style: greyFontstyle,
                  ),
                  value: selectedCity,
                  items: cities.map((value) {
                    return DropdownMenuItem(
                      child: Text(
                        value,
                        style: blackFontstyle2,
                      ),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                  },
                )),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 24),
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: defaultmargin),
              child: isLoading
                  ? const SpinKitFadingCircle(
                      size: 45,
                      color: kprimary,
                    )
                  : TextButton(
                      onPressed: () async {
                        User user = User(
                          name: widget.name,
                          email: widget.email,
                          address: addressController.text,
                          houseNumber: houseController.text,
                          phoneNumber: phoneController.text,
                          city: selectedCity,
                        );

                        setState(() {
                          isLoading = true;
                        });

                        await context.read<UserCubit>().signUp(
                            user, widget.password,
                            pictureFile: widget.pictureFile);

                        UserState state = context.read<UserCubit>().state;

                        if (state is UserLoaded) {
                          context.read<FoodCubit>().getFoods();
                          context.read<TransactionsCubit>().getTransactions();
                          Get.to(() => const MainPage(
                                selectedPage: 0,
                              ));
                          //Get.to(() => const MainPage());
                        } else {
                          Get.snackbar(
                            '',
                            '',
                            backgroundColor: const Color(0xFFD9435E),
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              "Sign In Failed ",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            messageText: Text(
                              (state as UserLoadingFailed).message,
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          );
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(5),
                        minimumSize:
                            Size.fromWidth(MediaQuery.of(context).size.width),
                        primary: kblack,
                        backgroundColor: kprimary,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'Sign Up Now',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
            ),
          ],
        ),
        backColor: kfalse,
        leftcallback: true);
  }
}
