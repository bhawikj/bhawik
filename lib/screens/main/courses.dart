import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:bhawik/models/category.dart';
import 'package:bhawik/utilities/constants.dart';


void main() => runApp(Courses());

class Courses extends StatefulWidget {
//  final String image;
//  final String textTop;
//  final String textBottom;
//  final double offset;
//  const Courses(
//      {Key key, this.image, this.textTop, this.textBottom, this.offset})
//      : super(key: key);

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          width: double.infinity,
//          decoration: BoxDecoration(
//            color: Colors.lightBlueAccent,
//            image: DecorationImage(
//            image: AssetImage("assets/images/onboarding0.png"),
//            alignment: Alignment.topRight,
//            ),
//          ),
          child: Column(
            children: <Widget>[
              ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height*0.3,
                        child: Carousel(
                          boxFit: BoxFit.fill,
                          images: [
                            NetworkImage('https://mk0analyticsindf35n9.kinstacdn.com/wp-content/uploads/2020/05/data-science-bubble.jpg'),
                            NetworkImage('https://cdn.searchenginejournal.com/wp-content/uploads/2020/05/6-reasons-to-keep-creating-content-during-covid-19-5eabf45610f59-1520x800.jpg'),
                            NetworkImage("https://mms.businesswire.com/media/20200528005053/en/794301/5/How_can_data_analytics_help_in_food_waste.jpg?download=1")
                          ],
                          dotSize: 4.0,
                          dotSpacing: 15.0,
                          dotColor: Colors.white,
                          indicatorBgPadding: 4.0,
                          dotBgColor: Color(0xFF4563DB).withOpacity(0.1),
                          borderRadius: false,
                        )
                    ),
                  ]
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 0, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    ClipPath(
                      clipper: BestSellerClipper(),
                      child: Container(
                        color: kBestSellerColor,
                        padding: EdgeInsets.only(
                            left: 10, top: 5, right: 20, bottom: 5),
                        child: Text(
                          "Top Courses".toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("Most recommended", style: kHeadingextStyle),
                    Text("courses from all", style: kHeadingextStyle),
                    Text("over the market.", style: kHeadingextStyle),
                    Row(
                      children: <Widget>[
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight:  Radius.circular(50), topLeft:  Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: StaggeredGridView.countBuilder(
                          padding: EdgeInsets.all(0),
                          crossAxisCount: 2,
                          itemCount: categories.length,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(20),
                              height: index.isEven ? 200 : 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: AssetImage(categories[index].image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    categories[index].name,
                                    style: kTitleTextStyle,
                                  ),
                                  Text(
                                    '${categories[index].numOfCourses} Courses',
                                    style: TextStyle(
                                      color: kTextColor.withOpacity(.5),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
