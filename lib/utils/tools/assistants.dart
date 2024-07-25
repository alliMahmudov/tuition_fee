import 'file_importers.dart';

bool checkMode(context) => Provider.of<ThemeProvider>(context).themeData == lightMode;
double height(context) => MediaQuery.of(context).size.height;
double width(context) => MediaQuery.of(context).size.width;

String checkFee(String fee){
  String price = "";
  switch(fee){
    case "6412610":
      price = "7472630";
      break;
    case "7091940":
      price = "8219893";
      break;
    case "7771270":
      price = "8967156";
      break;
    case "9129930":
      price = "10461682";
      break;
    case "9809260":
      price = "11208945";
      break;
  }
  return price;
}