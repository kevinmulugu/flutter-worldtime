import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImage = data['isDaytime'] ? 'assets/day.png' : 'assets/night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'location': result['location'],
                            'time': result['time'],
                            'flag': result['flag'],
                            'isDaytime': result['isDaytime']
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                        color: Colors.grey[200],
                      ),
                      label: Text(
                          'Edit location',
                        style: TextStyle(
                          color: Colors.grey[300]
                        ),
                      )
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          letterSpacing: 2.0
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 66.0
                    ),
                  )
                ],
              ),
      ),
          )),
    );
  }
}
