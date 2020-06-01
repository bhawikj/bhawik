import 'package:bhawik/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  SliderPage({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            width: width * 0.6,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              description,
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: 14,
                letterSpacing: 0.7,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: "Internships",
        description:
            "Hello peeps! Onbaording itni imp hai ki tum 10sec me apna product sell kr sakte ho",
        image: "assets/images/onboarding0.png"),
    SliderPage(
        title: "CV Builder",
        description:
            "Hello peeps! Onbaording itni imp hai ki tum 10sec me apna product sell kr sakte ho",
        image: "assets/images/onboarding1.png"),
    SliderPage(
        title: "Career Insights",
        description:
            "Hello peeps! Onbaording itni imp hai ki tum 10sec me apna product sell kr sakte ho",
        image: "assets/images/onboarding2.png"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onchanged,
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (context, int index) {
                return _pages[index];
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(_pages.length, (int index) {
                      return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 10,
                          width: (index == _currentPage) ? 30 : 10,
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == _currentPage)
                                  ? Color(0xFF4563DB)
                                  : Color(0xFF4563DB).withOpacity(0.5)));
                    })),
                InkWell(
                  onTap: () {
                    (_currentPage == (_pages.length - 1))
                        ? Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()),
                            (Route<dynamic> route) => false,
                          )
                        : _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOutQuint);
                  },
                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 200),
                    height: 70,
                    width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                    decoration: BoxDecoration(
                        color: Color(0xFF4563DB),
                        borderRadius: BorderRadius.circular(35)),
                    child: (_currentPage == (_pages.length - 1))
                        ? Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        : Icon(
                            Icons.navigate_next,
                            size: 50,
                            color: Colors.white,
                          ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
