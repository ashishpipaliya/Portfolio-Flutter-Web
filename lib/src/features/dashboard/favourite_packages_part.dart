import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/src/features/dashboard/dashboard_provider.dart';
import 'package:portfolio/src/models/fav_pub_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FavouritePackagesPart extends StatefulWidget {
  const FavouritePackagesPart({Key? key}) : super(key: key);

  @override
  _FavouritePackagesPartState createState() => _FavouritePackagesPartState();
}

class _FavouritePackagesPartState extends State<FavouritePackagesPart> {
  ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white,
      width: double.infinity,
      height: double.maxFinite,
      child: Consumer<DashboardProvider>(
        builder: (context, value, child) {
          return value.isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.black))
              : value.packages.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My  Favourite  Flutter  Packages'.toUpperCase(),
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Expanded(
                          child: ListView.separated(
                            controller: _controller,
                            itemBuilder: (context, index) {
                              FavPub singlePub = value.packages[index];

                              return GestureDetector(
                                onTap: () => _openPubDev(url: singlePub.url!),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: kElevationToShadow[1],
                                      color: Colors.white),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(5),
                                  constraints: BoxConstraints(maxHeight: 200),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        singlePub.name!,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        singlePub.description!,
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10),
                            itemCount: value.packages.length,
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: SizedBox(
                        child: Text(
                          "No Data",
                          style: GoogleFonts.poppins(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
        },
      ),
    );
  }

  void _openPubDev({required String url}) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
