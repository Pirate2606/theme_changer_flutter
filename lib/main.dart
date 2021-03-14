import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
          home: Scaffold(
            appBar: AppBar(
              title: Text("Theme Switching"),
            ),
            body: Center(
              child: Text("My name is Aditya"),
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  Container(
                    color: Colors.black,
                    height: 150,
                    width: double.infinity,
                    child: Center(
                        child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                        ),
                        Text("Aditya ",
                            style: TextStyle(fontSize: 22, color: Colors.white))
                      ],
                    )),
                  ),
                  ListTile(
                    title: Text(
                      "Dark Theme",
                    ),
                    trailing: Switch(
                      value: snapshot.data,
                      onChanged: bloc.changeTheme,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Profile"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_back),
                    title: Text("Logout"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();
