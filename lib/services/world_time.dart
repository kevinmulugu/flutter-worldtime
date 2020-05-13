import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time; //time of the location
  String flag; //Url to asset flag item
  String url;
  bool isDaytime;

  WorldTime({this.location, this.time, this.flag,
      this.url}); //this is the location url for API endpoint
  
  

  Future<void> getTime() async {
    try {
      Response response = await get('https://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].toString().substring(1, 3);

      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      time = DateFormat.jm().format(now);
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    }
    catch(e) {
      DateTime now = DateTime.parse('2020-03-26 06:00:46');

      time =  time = DateFormat.jm().format(now);
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    }
  }
}
