import 'package:flutter/material.dart';
import 'donate.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: HomeLayout(),
    );
  }
}

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }

  Widget _myListView(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        context: context,
          tiles: [
            ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text(
                'Sun',
                style: TextStyle(color: Colors.black, fontSize: 20)  
              ),
              subtitle: Text('No'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                Navigator.push(  
                  context,
                  MaterialPageRoute(  
                    builder: (context) => LessonPage(),
                  )
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.brightness_3),
              title: Text(
                'Moon',
                style: TextStyle(color: Colors.black, fontSize: 20)  
              ),
              subtitle: Text('No'),
              trailing: Icon(Icons.keyboard_arrow_right), 
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'Star',
                style: TextStyle(color: Colors.black, fontSize: 20)  
              ),
              subtitle: Text('No'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ],
      ).toList(),
    );
  }
}

class LessonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lesson 1"),
      ),
      body: SunLayout(),
    );
  }
}

class SunLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }

  Widget _myListView(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        context: context,
          tiles: [
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text(
                'Lesson 1',
                style: TextStyle(color: Colors.black, fontSize: 20)  
              ),
              subtitle: Text('1'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                Navigator.push(  
                  context,
                  MaterialPageRoute(  
                    builder: (context) => DonatePage(),
                  )
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text(
                'Lesson 2',
                style: TextStyle(color: Colors.black, fontSize: 20)  
              ),
              subtitle: Text('2'),
              trailing: Icon(Icons.keyboard_arrow_right), 
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text(
                'Lesson 3',
                style: TextStyle(color: Colors.black, fontSize: 20)  
              ),
              subtitle: Text('3'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ],
      ).toList(),
    );
  }
}