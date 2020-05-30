import 'package:flutter/material.dart';

class PrefList extends StatefulWidget {
  final List<String> prefs;

  const PrefList({Key key, this.prefs}) : super(key: key);
  @override
  _PrefListState createState() => _PrefListState(prefs);
}

class _PrefListState extends State<PrefList> {
  final List<String> prefs;
  List<String> items = [];
  TextEditingController controller = new TextEditingController();
  String filter;

  _PrefListState(this.prefs);
  @override
  void initState() {
    items.add('Machine Learning');
    items.add('App Development');
    items.add('Web Development');
    items.add('HR');
    items.add('Data Science');
    items.add('Data Analytics');
    items.add('Digital Marketing');
    items.add('Operations');
    items.add('Graphic Designer');
    items.add('Content Writing');
    for (var item in prefs) {
      items.remove(item);
    }
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, "");
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Choose"),
            backgroundColor: Color(0xFF4563DB),
            leading: InkWell(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Navigator.of(context).pop("");
              },
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width * 0.95,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  height: 60.0,
                  child: TextField(
                    decoration: new InputDecoration(
                      labelText: "Search",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 20.0),
                    ),
                    controller: controller,
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return filter == null || filter == ""
                              ? _listTile(index)
                              : items[index]
                                      .toLowerCase()
                                      .contains(filter.toLowerCase())
                                  ? _listTile(index)
                                  : Container();
                        }))
              ],
            ),
          ),
        ));
  }

  Widget _listTile(int index) {
    return ListTile(
      title: Text(items[index]),
      onTap: () {
        debugPrint(items[index]);
        Navigator.pop(context, items[index]);
      },
    );
  }
}
