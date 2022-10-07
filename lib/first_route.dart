import 'package:flutter/material.dart';
import 'package:week4_routes_and_navigation/selection_button.dart';
import 'second_route.dart';
import 'extract_arguments.dart';
import 'screen_arguments.dart';
import 'pass_arguments.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Second Screen'),
              onTap: () {
                // Update the state of the app.
                // ...copy paste here the navigator.push method here
                //you may navigate to SecondScreen
                Navigator.pop(context);

                Navigator.pushNamed(context, '/second');
              },
            ),
            ListTile(
              title: const Text('Passed Argument'),
              onTap: () {
                // Update the state of the app.
                // ...copy paste here the navigator.push method
                Navigator.pop(context);

                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute '
                        'function.',
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //second route
            ElevatedButton(
              child: const Text('Go to Second route'),
              onPressed: () {
                // Navigate to second route when tapped.
                Navigator.pushNamed(context, '/second');
              },
            ),
            //go to extract_arguments.dart
            ElevatedButton(
              child: const Text('Go to Extract Arguments'),
              onPressed: () {
                // When the user taps the button,
                // navigate to a named route and
                // provide the arguments as an optional
                // parameter.
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'This is the title argument',
                    'This is the message argument',
                  ),
                );
              },
            ),
            // go to pass arguments.dart
            ElevatedButton(
              child: const Text('Go to Pass Arguments'),
              onPressed: () {
                // Navigate to second route when tapped.
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute '
                        'function.',
                  ),
                );
              },
            ),
            //go to selection screen
            SelectionButton(),
          ],
        ),
      ),
    );
  }
}
