import 'package:flutter/material.dart';

class Landingpage extends StatelessWidget {
  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0), // Adjust padding as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center the text column
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Web3 is here to take over",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  color: Colors.white, // Text color updated to green
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Start your Web3 blockchain Journey with our Eco-Friendly designs now.",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white, // Text color updated to green
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              MaterialButton(
                color: Colors.green, // Button color updated to green
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                  child: Text(
                    "Sign Up for Free",
                    style: TextStyle(color: Colors.white), // Text color updated to white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Center(
          child: Image.asset(
            "assets/images/blockchain.png",
            width: 300,
            height: 300,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 73, 61, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pageChildren(constraints.biggest.width / 2, context),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pageChildren(constraints.biggest.width, context),
                    );
                  }
                },
              ),
            ),
            AboutPage(),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  List<Widget> aboutSectionChildren(double width) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "About Us",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.green, // Text color updated to green
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Our goal is to provide a streamlined channel to serve retail and high-net worth individuals globally.",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green, // Text color updated to green
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white, // Background color updated to white
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: aboutSectionChildren(constraints.biggest.width / 2),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: aboutSectionChildren(constraints.biggest.width),
              );
            }
          },
        ),
      ),
    );
  }
}