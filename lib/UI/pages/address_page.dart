part of 'pages.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isLoading = false;
  var _valFriends;

  final List _city = ["Jakarta", "Bandung", "Surabaya", "Bali"];

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
                  value: _valFriends,
                  items: _city.map((value) {
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
                      _valFriends = value;
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
                      onPressed: () {
                        print('Sign Up now');
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
