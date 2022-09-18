import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../modules/news_app/web_view/web_view_screen.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  Color textColor = Colors.white,
  required VoidCallback function,
  required String text,
  double radius = 0.0,
  double fontSize = 20.0,
  bool isUpperCase = false,
  bool isBold = false,
}) =>
    Container(
      height: 40.0,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text : text.toUpperCase(),
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );

Widget defaultTextButton({
  required VoidCallback function,
  required String text,
  bool isUpperCase = true,
  bool isBold = true,
  Color fontColor = Colors.blue,
  double fontSize = 20.0,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onChange,
  ValueChanged<String>? onSubmit,
  VoidCallback? onTap,
  FormFieldValidator<String>? validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isPassword = false,
  double radius = 0.0,
  bool clickable = true,
  bool border = true,
}) =>
    TextFormField(
      enabled: clickable,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                ),
                onPressed: suffixPressed,
              )
            : null,
        border: border? OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(radius),
            topLeft: Radius.circular(radius),
          ),
        ): InputBorder.none,
        hintText: label,
      ),
      obscureText: isPassword,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      validator: validate,
      onTap: onTap,
    );



Widget buildArticleItem(article, context) => InkWell(
      onTap: () => navigateTo(context, WebViewScreen(url: article['url'])),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: article['urlToImage'] == null ? NetworkImage('https://media.istockphoto.com/vectors/world-news-flat-vector-icon-news-symbol-logo-illustration-business-vector-id929047972?k=20&m=929047972&s=612x612&w=0&h=L6vCAocE3TPfe69oyE-lBBt9mXaK---09K7oi730uW0='):NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: SizedBox(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${article['title']}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Text(
                        "${article['publishedAt']}",
                      //'${article['publishedAt']}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget articleBuilder(list, context, {bool isSearch = false}) =>
    ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsetsDirectional.only(start: 15.0),
          child: Divider(thickness: 1.5),
        ),
        itemCount: list.length,
      ),
      fallback: (context) => isSearch
          ? Container()
          : const Center(child: CircularProgressIndicator()),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (route) {
      return false;
    });


