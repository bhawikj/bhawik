import 'package:flutter/material.dart';

class PrefList extends StatefulWidget {
  @override
  _PrefListState createState() => _PrefListState();
}

class _PrefListState extends State<PrefList> {
  List<String> items = [];
  TextEditingController controller = new TextEditingController();
  String filter;
  @override
  void initState() {
    items.add('Machine Learning');
    items.add('App Development');
    items.add('Web Development');
    items.add('Cyber Security');
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

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
                TextField(
                  decoration: new InputDecoration(labelText: "Search"),
                  controller: controller,
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
