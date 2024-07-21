import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth>1200){
          return DesktopNavBar();
        } else if(constraints.maxWidth>800 && constraints.maxWidth<1200){
          return DesktopNavBar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Binfin8",
              style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 40)
              ),
            Row(children: <Widget>[
              Text("Home",
              style: TextStyle(color:Colors.white),
              ),
              SizedBox(
                width: 40,
              ),
              Text("About",
              style: TextStyle(color:Colors.white),
              ),
              SizedBox(
                width: 40,
              ),
              Text("Our AI Assistant",
              style: TextStyle(color:Colors.white),
              ),
              SizedBox(
                width: 40,
              ),
              Text("News",
              style: TextStyle(color:Colors.white),
              ),
              SizedBox(
                width: 40,
              ),
              Text("Movers",
              style: TextStyle(color:Colors.white),
              ),
              SizedBox(
                width: 40,
              ),
              Text("Wallet",
              style: TextStyle(color:Colors.white),
              ),
              SizedBox(
                width: 40,
              ),
              Text("Login",
              style: TextStyle(color:Colors.white),
              ),
              SizedBox(
                width: 40,
              ),
              MaterialButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  onPressed: () {}, 
                  child: Text("Get Started",
                  style: TextStyle(color:Colors.white))
                )
            ],)
          ],),
      ),
    );
  }
}





class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Binfin8",
                style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 40)
                ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text("Home",
                  style: TextStyle(color:Colors.white),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text("About",
                  style: TextStyle(color:Colors.white),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text("Our AI Assistant",
                  style: TextStyle(color:Colors.white),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text("News",
                  style: TextStyle(color:Colors.white),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text("Movers",
                  style: TextStyle(color:Colors.white),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text("Wallet",
                  style: TextStyle(color:Colors.white),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text("Account",
                  style: TextStyle(color:Colors.white),
                  ),
                ],),
              )
            ],),
          ),
    );
  }
}