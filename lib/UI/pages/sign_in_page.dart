part of 'pages.dart';

class SignInpage extends StatefulWidget {
  const SignInpage({Key? key}) : super(key: key);

  @override
  _SignInpageState createState() => _SignInpageState();
}

class _SignInpageState extends State<SignInpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: "Sign In",
        subtitle: "Find your best ever meal",
        child: Column(
          children: [
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
                        print("Sign In");
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
                        'Sign Up',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
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
                        Get.to(() => const SignUppage());
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(5),
                        minimumSize:
                            Size.fromWidth(MediaQuery.of(context).size.width),
                        primary: kblack,
                        backgroundColor: ksecondary2,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'Create New Account',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
            ),
          ],
        ),
        backColor: ksecondary,
        leftcallback: false);
  }
}
