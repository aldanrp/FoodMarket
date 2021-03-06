part of 'shared.dart';

const kprimary = Color(0xFFFFC700);
const ksecondary = Color(0xFFFFFFFF);
const ksecondary2 = Color(0xFF8D92A3);
const kblack = Color(0xFF020202);
const kfalse = Color(0xFFFAFAFC);
const kwhite2 = Color(0xFFF2F2F2);
const double defaultmargin = 24;

Widget loadingIndicator = const SpinKitFadingCircle(
  size: 45,
  color: kprimary,
);

TextStyle greyFontstyle = GoogleFonts.poppins().copyWith(color: ksecondary2);

TextStyle blackFontstyle = GoogleFonts.poppins().copyWith(
  color: Colors.black,
  fontSize: 24,
  fontWeight: FontWeight.w500,
);
TextStyle blackFontstyle2 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);
TextStyle blackFontstyle3 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
);
