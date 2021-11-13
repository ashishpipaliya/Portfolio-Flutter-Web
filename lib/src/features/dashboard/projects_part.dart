import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/src/features/dashboard/dashboard_provider.dart';
import 'package:portfolio/src/widgets/image_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPart extends StatefulWidget {
  const ProjectsPart({Key? key}) : super(key: key);

  @override
  _ProjectsPartState createState() => _ProjectsPartState();
}

class _ProjectsPartState extends State<ProjectsPart> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, value, child) {
        return value.isLoading
            ? Center(child: CircularProgressIndicator(color: Colors.black))
            : value.projects.isNotEmpty
                ? ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Latest App - ${value.projects.first['name']}'
                                .toUpperCase(),
                            style: GoogleFonts.lato(
                                letterSpacing: 1.3,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () => _leftClick(),
                                      icon: Icon(Icons.arrow_back_ios)),
                                  Expanded(
                                    child: CarouselSlider(
                                        carouselController:
                                            buttonCarouselController,
                                        items: (value.projects.first['images']
                                                as List)
                                            .map((e) => ImageWidget(
                                                  imageUrl: e,
                                                  height: 500,
                                                  width: 300,
                                                ))
                                            .toList(),
                                        options: CarouselOptions(
                                          height: 500,
                                          pauseAutoPlayOnTouch: true,
                                          enlargeStrategy:
                                              CenterPageEnlargeStrategy.scale,
                                          aspectRatio: 9 / 16,
                                          initialPage: 0,
                                          enableInfiniteScroll: true,
                                          reverse: false,
                                          autoPlay: true,
                                          autoPlayInterval:
                                              Duration(seconds: 3),
                                          autoPlayAnimationDuration:
                                              Duration(milliseconds: 800),
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          enlargeCenterPage: true,
                                          scrollDirection: Axis.horizontal,
                                        )),
                                  ),
                                  IconButton(
                                      onPressed: () => _rightClick(),
                                      icon: Icon(Icons.arrow_forward_ios)),
                                ],
                              )),
                          SizedBox(height: 30),
                          Text(
                            "All Apps".toUpperCase(),
                            style: GoogleFonts.lato(
                                letterSpacing: 1.3,
                                fontWeight: FontWeight.bold),
                          ),
                          Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: value.projects
                                  .map((item) => GestureDetector(
                                        onTap: () =>
                                            _handleAppDetailOpenClickEvent(
                                                item),
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 25),
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey[300]!,
                                                  blurRadius: 10,
                                                  offset: Offset(3, 3))
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircleAvatar(
                                                radius: 60,
                                                backgroundColor:
                                                    Colors.transparent,
                                                foregroundColor:
                                                    Colors.transparent,
                                                foregroundImage:
                                                    NetworkImage(item['logo']),
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                item['name'].toString(),
                                                style: GoogleFonts.poppins(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: SizedBox(
                      child: Text(
                        "No Projects Yet",
                        style: GoogleFonts.poppins(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
      },
    );
  }

  _leftClick() {
    buttonCarouselController.previousPage();
  }

  _rightClick() {
    buttonCarouselController.nextPage();
  }

  _handleAppDetailOpenClickEvent(item) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              width: 700,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 45 + 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 20),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: ImageWidget(
                                  imageUrl: item['logo'],
                                  width: 100,
                                  height: 100,
                                ))),
                        Flexible(
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'size : ${item['size']} M',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: MaterialButton(
                                      color: Colors.green[100],
                                      onPressed: () =>
                                          _downloadApp(url: item['url']),
                                      child: Text("Download App")),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      constraints: BoxConstraints(maxHeight: 500),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        }),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: item['images'].length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 20),
                          itemBuilder: (context, index) {
                            var singleImage = item['images'][index];
                            return ImageWidget(
                              imageUrl: singleImage,
                              height: 500,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Html(
                      data: item['description'],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            MaterialButton(
                color: Colors.red[100],
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("close"))
          ],
        );
      },
    );
  }

  void _downloadApp({required String url}) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
