import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:bhawik/utilities/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
//    return Scaffold(
//      backgroundColor: Colors.lightBlueAccent,
//      body: AnnotatedRegion<SystemUiOverlayStyle>(
//        value: SystemUiOverlayStyle.light,
//        child: Container(
//          width: double.infinity,
////          decoration: BoxDecoration(
////            color: Colors.lightBlueAccent,
////            image: DecorationImage(
////            image: AssetImage("assets/images/onboarding0.png"),
////            alignment: Alignment.topRight,
////            ),
////          ),
//          child: Column(
//            children: <Widget>[
//              ListView(
//                  shrinkWrap: true,
//                  children: <Widget>[
//                    Container(
//                        height: MediaQuery.of(context).size.height*0.3,
//                        child: Carousel(
//                          boxFit: BoxFit.fill,
//                          images: [
//                            NetworkImage('https://mk0analyticsindf35n9.kinstacdn.com/wp-content/uploads/2020/05/data-science-bubble.jpg'),
//                            NetworkImage('https://cdn.searchenginejournal.com/wp-content/uploads/2020/05/6-reasons-to-keep-creating-content-during-covid-19-5eabf45610f59-1520x800.jpg'),
//                            NetworkImage("https://mms.businesswire.com/media/20200528005053/en/794301/5/How_can_data_analytics_help_in_food_waste.jpg?download=1")
//                          ],
//                          dotSize: 4.0,
//                          dotSpacing: 15.0,
//                          dotColor: Colors.white,
//                          indicatorBgPadding: 4.0,
//                          dotBgColor: Color(0xFF4563DB).withOpacity(0.1),
//                          borderRadius: false,
//                        )
//                    ),
//                  ]
//              ),
//              Padding(
//                padding: EdgeInsets.only(left: 20, top: 0, right: 20),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    SizedBox(height: 10),
//                    ClipPath(
//                      clipper: BestSellerClipper(),
//                      child: Container(
//                        color: kBestSellerColor,
//                        padding: EdgeInsets.only(
//                            left: 10, top: 5, right: 20, bottom: 5),
//                        child: Text(
//                          "Top Courses".toUpperCase(),
//                          style: TextStyle(
//                            fontWeight: FontWeight.w600,
//                          ),
//                        ),
//                      ),
//                    ),
//                    SizedBox(height: 16),
//                    Text("Most recommended", style: kHeadingextStyle),
//                    Text("courses from all", style: kHeadingextStyle),
//                    Text("over the market.", style: kHeadingextStyle),
//                    Row(
//                      children: <Widget>[
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//              SizedBox(height: 15),
//              Expanded(
//                child: Container(
//                  width: double.infinity,
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.only(topRight:  Radius.circular(50), topLeft:  Radius.circular(50)),
//                    color: Colors.white,
//                  ),
//                  child: Stack(
//                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.all(20),
//                        child: StaggeredGridView.countBuilder(
//                          padding: EdgeInsets.all(0),
//                          crossAxisCount: 2,
//                          itemCount: categories.length,
//                          crossAxisSpacing: 20,
//                          mainAxisSpacing: 20,
//                          itemBuilder: (context, index) {
//                            return Container(
//                              padding: EdgeInsets.all(20),
//                              height: index.isEven ? 200 : 200,
//                              decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(16),
//                                image: DecorationImage(
//                                  image: AssetImage(categories[index].image),
//                                  fit: BoxFit.fill,
//                                ),
//                              ),
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Text(
//                                    categories[index].name,
//                                    style: kTitleTextStyle,
//                                  ),
//                                  Text(
//                                    '${categories[index].numOfCourses} Courses',
//                                    style: TextStyle(
//                                      color: kTextColor.withOpacity(.5),
//                                    ),
//                                  )
//                                ],
//                              ),
//                            );
//                          },
//                          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                color: Colors.white,
                height: double.infinity,
                child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
//                    padding: EdgeInsets.symmetric(
//                      horizontal: 20.0,
//                      vertical: 5.0,
//                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ListView(shrinkWrap: true, children: <Widget>[
                          Container(
                            //padding: EdgeInsets.only(left: 10, right: 10),
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Carousel(
                                boxFit: BoxFit.fill,
                                images: [
                                  NetworkImage(
                                      'https://mk0analyticsindf35n9.kinstacdn.com/wp-content/uploads/2020/05/data-science-bubble.jpg'),
                                  NetworkImage(
                                      'https://cdn.searchenginejournal.com/wp-content/uploads/2020/05/6-reasons-to-keep-creating-content-during-covid-19-5eabf45610f59-1520x800.jpg'),
                                  NetworkImage(
                                      "https://mms.businesswire.com/media/20200528005053/en/794301/5/How_can_data_analytics_help_in_food_waste.jpg?download=1")
                                ],
                                dotSize: 4.0,
                                dotSpacing: 15.0,
                                dotColor: Colors.white,
                                indicatorBgPadding: 4.0,
                                dotBgColor: Color(0xFF4563DB).withOpacity(0.1),
                                borderRadius: false,
                              )),
                        ]),
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 0, right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
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
                                  Text("Top 5 Courses based", style: kTitleTextStyle),
                                  Text("on your profile from", style: kTitleTextStyle),
                                  Text("all over the market.", style: kTitleTextStyle),
                                  Row(
                                    children: <Widget>[],
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Image.asset("assets/images/ux_design.png", height:135, width: 130,),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                topLeft: Radius.circular(50)),
                            color: Color(0xFF4563DB),
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(" UDEMY ", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 15, color: Colors.orange),),
                              PreventCard(
                                text:
                                "Students Enrolled : 1,13,134",
                                image: "assets/images/course1.jpg",
                                title: "Learn to Code in Python 3: Programming beginner to advanced",
                              ),
                              Text(" COURSERA ", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 15, color: Colors.orange),),
                              PreventCard(
                                text:
                                "Students Enrolled : 1,13,134",
                                image: "assets/images/course1.jpg",
                                title: "Learn to Code in Python 3: Programming beginner to advanced",
                              ),
                              Text(" EDX ", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 15, color: Colors.orange),),
                              PreventCard(
                                text:
                                "Students Enrolled : 1,13,134",
                                image: "assets/images/course1.jpg",
                                title: "Learn to Code in Python 3: Programming beginner to advanced",
                              ),
                              Text(" SKILL SHARE ", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 15, color: Colors.orange),),
                              PreventCard(
                                text:
                                "Students Enrolled : 1,13,134",
                                image: "assets/images/course1.jpg",
                                title: "Learn to Code in Python 3: Programming beginner to advanced",
                              ),
                              Text(" SIMPLI LEARN ", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 15, color: Colors.orange),),
                              PreventCard(
                                text:
                                "Students Enrolled : 1,13,134",
                                image: "assets/images/course1.jpg",
                                title: "Learn to Code in Python 3: Programming beginner to advanced",
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    )),
              )
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

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Image.asset(image, width: MediaQuery.of(context).size.width*0.4, height: MediaQuery.of(context).size.height*0.4),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 10),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12, color: Colors.red
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}