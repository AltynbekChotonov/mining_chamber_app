import 'package:flutter/material.dart';

import 'global.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool library = true;
  bool services = false;
  bool lottery = false;
  late Widget tab;
  @override
  Widget build(BuildContext context) {
    getTab();
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 20, bottom: 20, right: 20, top: 60),
              margin: EdgeInsets.only(top: 160),
              constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height - 160),
              decoration: BoxDecoration(
                  color: darkBlueColor,
                  gradient: LinearGradient(
                    colors: [darkBlueColor, lightBlueColor],
                    stops: [0.5, 1],
                    begin: const FractionalOffset(0.5, 0.2),
                    end: const FractionalOffset(1, 1),
                    // center: Alignment(0.0, 1),
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey,
                      blurRadius: 30.0,
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  tab,
                  Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 90,
                            width: 50,
                            child: FloatingActionButton(
                              child: Icon(Icons.library_books),
                              onPressed: () {
                                setState(() {
                                  library = true;
                                  services = false;
                                  lottery = false;
                                  getTab();
                                });
                              },
                              backgroundColor: darkBlueColor,
                            ),
                          ),
                          Container(
                            height: 90,
                            width: 50,
                            child: FloatingActionButton(
                              child: Icon(Icons.monetization_on),
                              onPressed: () {
                                setState(() {
                                  library = false;
                                  services = false;
                                  lottery = true;
                                  getTab();
                                });
                              },
                              backgroundColor: darkBlueColor,
                            ),
                          ),
                          Container(
                            height: 90,
                            width: 50,
                            child: FloatingActionButton(
                              child: Icon(Icons.settings),
                              onPressed: () {
                                setState(() {
                                  library = false;
                                  services = true;
                                  lottery = false;
                                  getTab();
                                });
                              },
                              backgroundColor: darkBlueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.08,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, top: 30),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Text("МАЙНИНГ\n  ПАЛАТАСЫ", style: pageTitleStyle),
            ),
          ],
        ),
      ),
    );
  }

  void getTab() {
    if (library) {
      tab = cryptoLibrary();
    }
    if (lottery) {
      tab = cryptoLottery();
    }
    if (services) {
      tab = cryptoServices();
    }
  }

  Widget cryptoLottery() {
    return Container(
      height: 100,
    );
  }

  Widget cryptoServices() {
    return Container(
      height: 100,
    );
  }

  Widget cryptoLibrary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Крипто китепкана",
          style: tabTitleStyle,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView(
            padding: EdgeInsets.only(top: 20),
            children: getLatestArticles(),
          ),
        ),
      ],
    );
  }

  List<Widget> getLatestArticles() {
    List<Widget> articleCards = [];
    for (int i = 0; i < 10; i++) {
      articleCards.add(articleCard());
    }
    return articleCards;
  }

  Widget articleCard() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(
            color: lightBlueColor,
            thickness: 1,
          ),
          Text(
            "Ватт жана\nЭлектр энергиянын негиздери",
            style: blogTitleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("7-сентябрь, 2020-жыл", style: blogDateStyle),
            ],
          )
        ],
      ),
    );
  }
}
