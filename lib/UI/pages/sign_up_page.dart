part of 'pages.dart';

class SignUppage extends StatefulWidget {
  const SignUppage({Key? key}) : super(key: key);

  @override
  _SignUppageState createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {
  late User user;
  String picture = "assets/images/photo_border.png";
  File? pictureFile;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: "Sign Up",
        subtitle: "Register and eat",
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                XFile? pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  setState(() {
                    pictureFile = File(pickedFile.path);
                  });
                }
              },
              child: Container(
                height: 110,
                width: 110,
                margin: const EdgeInsets.only(top: 26),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/photo_border.png"),
                  ),
                ),
                child: (pictureFile != null)
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(File(pictureFile!.path)),
                            fit: BoxFit.cover,
                          ),
                          color: ksecondary2,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(picture),
                            fit: BoxFit.cover,
                          ),
                          color: ksecondary2,
                        ),
                      ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                  defaultmargin, 26, defaultmargin, 6),
              child: Text(
                "Full Name",
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
                controller: usernameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontstyle,
                  hintText: 'type your full name',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                  defaultmargin, 26, defaultmargin, 6),
              child: Text(
                "Email Address",
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
                controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontstyle,
                  hintText: 'type your email address',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                  defaultmargin, 16, defaultmargin, 6),
              child: Text(
                "Password",
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
                controller: passwordController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontstyle,
                  hintText: 'type your password',
                ),
              ),
            ),
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
                        if (pictureFile == null) {
                          Get.to(() => AddressPage(
                                password: passwordController.text,
                                pictureFile: File(picture),
                                name: usernameController.text,
                                email: emailController.text,
                              ));
                        } else {
                          Get.to(() => AddressPage(
                                password: passwordController.text,
                                pictureFile: File(pictureFile!.path),
                                name: usernameController.text,
                                email: emailController.text,
                              ));
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
                        'Continue',
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
