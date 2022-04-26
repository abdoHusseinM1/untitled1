import 'package:flutter/material.dart';
import 'package:untitled/shared/styles/colors.dart';

Widget getDefaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? hint,
  Icon? prefixIcon,
  required String? Function(String? value) validate,
  int maxLines = 1,
  bool isPassword = false,
}) =>
    TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
        prefixIcon: prefixIcon,
      ),
      validator: validate,
      controller: controller,
      maxLines: maxLines,
      obscureText: isPassword,
    );

Widget getDefaultButton({
  required String? text,
  required void Function() function,
  double? width = double.infinity,
  Color? background = Colors.indigo,
  double radius = 10,
  Color? textColor = Colors.white,
  double fontSize = 20,
}) =>
    Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextButton(
        onPressed: function,
        child: Text(
          '$text',
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

Widget getHeadlineText({
  required String text,
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.bold,
  double fontSize = 50,
  int maxLines = 1,
}) =>
    Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
    );

Widget getListTile(
        {required String? text,
        int? index = -1,
        int? choseIndex = 0,
        double? fontSize = 16,
        bool? isBold = true,
        required Function() onPressed,
        Color? textColor = Colors.white}) =>
    Column(
      children: [
        ListTile(
          title: Text(
            '$text',
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: (isBold!) ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          onTap: onPressed,
        ),
        Divider(
          height: 2,
          color: getDarkColor(),
        ),
      ],
    );

Widget getDashboardElement({
  required Function() function,
  required String mainText,
  required String smallText,
  required int height,
  required int width,
  double smallTextSize = 16,
  double mainTextSize = 20,
  Color? background = Colors.white,
  double radius = 10,
}) {
  return Container(
      width: width.toDouble(),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(1, 2), // Shadow position
          ),
        ],
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextButton(
        onPressed: function,
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: height / 4, horizontal: width / 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              getHeadlineText(
                  text: mainText,
                  color: getDarkColor(),
                  fontSize: mainTextSize),
              SizedBox(
                height: height / 6,
              ),
              getHeadlineText(
                  text: smallText,
                  color: getLightColor(),
                  fontSize: smallTextSize),
            ],
          ),
        ),
      ));
}

Widget getOriginalButton({
  required text,
  required onPressed,
  color = Colors.blue,
  required textColor,
  required BuildContext context,
  bool disabled = false ,
})=> SizedBox(
  width: MediaQuery.of(context).size.width*0.2,

  height: MediaQuery.of(context).size.height*0.09,
  child:MaterialButton (
    onPressed: disabled ? (){} : onPressed ,
    child: Text(
      text,
      style: TextStyle(
          color: textColor,
          fontSize: 20
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    color: disabled? Colors.grey : color,
  ),
);

Widget getListItemPart({
  backgroundColor = Colors.white,
  required String? text1,
  required String? text2,

}){
  return Expanded(
    child: Container(
      decoration: BoxDecoration(color: backgroundColor),
      padding:const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text('$text1',
              style: TextStyle(
                color: getDarkColor(),
                fontSize: 20.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          const SizedBox(
            height: 5.0,
          ),
          Text('$text2',
              style: TextStyle(
                color: getLightColor(),
                fontSize: 20.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis)
        ],
      ),
    ),
  );
}