import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/Hidayat.jpg'),
                  radius: 50,
                ),
                Text(
                  'Hidayat',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Pacifico'
                  ),
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.teal[100],
                    letterSpacing:3,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 25,
                  width: 250,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.whatsapp,
                        color: Colors.teal.shade900,
                        size: 30,
                      ),
                      title: Text(
                        '+62-852-1799-5654',
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            color: Colors.teal.shade900,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:ListTile(
                      leading: Icon(
                        Icons.email_outlined,
                        color: Colors.teal.shade900,
                        size: 30,
                      ),
                      title: Text(
                        'elbert.herry11@gmail.com',
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            color: Colors.teal.shade900,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:ListTile(
                        leading: Icon(
                          Icons.school,
                          color: Colors.teal.shade900,
                          size: 30,
                        ),
                        title: Text(
                          'UIN Jakarta',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              color: Colors.teal.shade900,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.teal.shade900,
                          size: 30,
                        ),
                        title: Text(
                          'Indonesia',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              color: Colors.teal.shade900,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                  ),
                ),
              ],
            )),
        ),
      );
  }
}
