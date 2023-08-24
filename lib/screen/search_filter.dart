import 'package:flutter/material.dart';

import '../config/colors.dart';


class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  double start = 0;
  double end = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Search',
            style: TextStyle(
                color: ColorConstants.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            color: ColorConstants.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.tune_sharp,
                  color: ColorConstants.primaryColor,
                  size: 22,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text('Filter profiles by',
                    style: TextStyle(
                        color: ColorConstants.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Age',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                SizedBox(
                  width: 10,
                ),
                Text('Any age',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    )),
              ],
            ),
            const SizedBox(height: 20.0),
            RangeSlider(
              activeColor: Colors.black,
              values: RangeValues(start, end),
              labels: RangeLabels(start.toString(), end.toString()),
              onChanged: (value) {
                setState(() {
                  start = value.start;
                  end = value.end;
                });
              },
              min: 0.0,
              max: 60.0,
            ),
            const ListTile(
              title: Text(
                "Location",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              subtitle: Text("near me "),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            Divider(
              color: Colors.black12,
            ),
            const ListTile(
              title: Text(
                "Sect",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              subtitle: Text(
                "shia",
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            Divider(
              color: Colors.black12,
            ),
            const ListTile(
              title: Text(
                "Ethnicity",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              subtitle: Text("no"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
