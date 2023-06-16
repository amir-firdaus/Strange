import 'package:flutter/material.dart';
import 'package:strange/Strange/status.dart';
import 'package:strange/Strange/penalty.dart';


// ignore: must_be_immutable
class GridDashboard extends StatelessWidget {
  Items item1 = Items(
    title: "Parcel Arrival Status",
    subtitle: "March, Wednesday",
    event: "1 parcel arrived",
    img: "assets/delivery.png",
    link: "Status",
  );

  Items item2 = Items(
    title: "Penalty",
    subtitle: "See pending penalty",
    event: "1 penalty",
    img: "assets/money.png",
    link: "Penalty",
  );

  GridDashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2];
    var color = Colors.white;
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    data.img,
                    width: 82,
                  ),
                  onPressed: () {
                    if (data.link == "Status") {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Status()),
                      );
                    } else if (data.link == "Penalty") {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Penalty()),
                      );
                    }
                  },
                ),
                SizedBox(height: 14),
                Text(
                  data.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 8),
                Text(data.subtitle),
                SizedBox(height: 14),
                Text(data.event),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  String link;
 
  Items({required this.title, required this.subtitle, required this.event, required this.img,required this.link});
}