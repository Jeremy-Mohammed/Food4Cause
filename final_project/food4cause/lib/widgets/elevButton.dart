import 'package:flutter/material.dart';
import 'options.dart';

class elevButton extends StatelessWidget {
  final String text;
  final Color color;
  final Widget pageName;
  final BuildContext context;
  final int index;

  const elevButton({
    Key? key,
    required this.text,
    required this.color,
    required this.pageName,
    required this.context,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            openPage(pageName, context);
          },
          child: Container(
              width: 400,
              height: 135,
              //adds dropshadow
              decoration: BoxDecoration(
                  color: this.color,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 2),
                        spreadRadius: 1,
                        blurRadius: 4)
                  ]),
              //Actual button
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: option[index]['icon'],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      children: [
                        Text(
                          this.text,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  void openPage(page, context) {
    if (page == null) {
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
