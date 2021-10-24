import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const ImageWidget(
      {Key? key, required this.imageUrl, this.width, this.height, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: BoxFit.fitHeight,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          alignment: Alignment.center,
          height: 150,
          width: 150,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.red[100]),
          child: Text("Image Failed To Load"),
        );
      },
    );
  }
}
