import 'package:flutter/material.dart';

class CoverWidget extends StatelessWidget {
  final widget;
  const CoverWidget({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        padding: EdgeInsets.only(
          top: 15,
          left: w * 0.05,
          right: w * 0.05,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey[300]!, blurRadius: 10, offset: Offset(3, 3))
          ],
        ),
        child: widget);
  }
}
