import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';


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
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: ListView(
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
                  borderRadius: true,
                )
              ),
            ]
        ),
      ),
    );
  }
}