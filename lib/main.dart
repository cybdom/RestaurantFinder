import 'package:flutter/material.dart';
import 'package:restaurant_booking/restaurant.dart';
import 'package:restaurant_booking/starDisplay.dart';

void main() => runApp(MyApp());
List<String> buttonsTitle = ["All", "Popular", "Dessert", "Snack", "Fast Food"];
List<String> restaurantList = [
  "American Restaurant",
  "Turkish Restaurant",
  "Indian Restaurant",
  "Japanese Restaurant"
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Montserrat',
      ),
      home: RestaurantPage(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("13/07/2019"),
                          Text(
                            "What would you like to EAT ?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/imgs/profile.jpg"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search for a dish",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 275,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, id) {
                      return LargeContainer();
                    },
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
                          color: Colors.grey[100]),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: LinearGradient(
                              colors: [Colors.orangeAccent, Colors.pinkAccent]),
                        ),
                        child: Text(
                          "Sale",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "# Gourmet food in summer",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 55,
                  child: ListView.builder(
                    itemCount: buttonsTitle.length,
                    itemBuilder: (BuildContext context, int id) {
                      return MyCustomButton(
                        title: buttonsTitle[id],
                        active: id == 0 ? true : false,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 181,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurantList.length,
                    itemBuilder: (context, id) {
                      return SmallContainer(text: restaurantList[id]);
                    },
                  ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LargeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(0, 3),
            color: Colors.grey[300],
          ),
        ],
      ),
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            child: Image.asset("assets/imgs/lobster.jpg"),
            borderRadius: BorderRadius.circular(15.0),
          ),
          SizedBox(
            height: 9.0,
          ),
          Text(
            "Australian Lobster stewed rice",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19.0,
            ),
          ),
          SizedBox(
            height: 9.0,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.pin_drop,
                color: Colors.grey[400],
              ),
              Text(
                "3KM Until Arrival",
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              Spacer(),
              Flexible(
                flex: 3,
                child: FittedBox(
                  child: StarDisplay(
                    value: 4,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SmallContainer extends StatelessWidget {
  final String text;
  const SmallContainer({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 179,
          width: MediaQuery.of(context).size.width / 2.5,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                offset: Offset(0, 3),
                color: Colors.grey[300],
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                child: Image.asset("assets/imgs/meat.jpg"),
                borderRadius: BorderRadius.circular(15.0),
              ),
              SizedBox(
                height: 9.0,
              ),
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 9.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                    width: 15,
                    height: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "5.0",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite,
                    color: Colors.grey[400],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomButton extends StatelessWidget {
  final bool active;
  final String title;
  const MyCustomButton({Key key, this.active, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 115,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: !active ? Border.all(color: Colors.grey[100]) : null,
            borderRadius: BorderRadius.circular(21.0),
            gradient: active
                ? LinearGradient(colors: [Colors.yellow, Colors.orange])
                : null,
            color: active ? null : Colors.white,
            boxShadow: [
              active
                  ? BoxShadow(
                      color: Colors.yellow,
                      offset: Offset(0, 3),
                      blurRadius: 5.0,
                    )
                  : BoxShadow()
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 21.0, vertical: 5.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
          child: Text(
            title,
            style: TextStyle(color: active ? Colors.white : Colors.grey[500]),
          ),
        ),
      ),
    );
  }
}
