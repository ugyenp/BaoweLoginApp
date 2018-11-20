import 'package:flutter/material.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget{
   @override
   Widget build(BuildContext context){
     return new MaterialApp(
       home: new LoginPage(),
       theme: new ThemeData(
         primarySwatch: Colors.blue
       )
     );
   }
}

class LoginPage extends StatefulWidget{
   @override
   State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController logoAnimationController;
  Animation<double> logoAnimation;

  @override
  void initState(){
    super.initState();
    logoAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500)
    );

    logoAnimation = new CurvedAnimation(
      parent: logoAnimationController,
      curve: Curves.bounceOut
    );

    logoAnimation.addListener(()=>this.setState((){}));
    logoAnimationController.forward();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
    backgroundColor: Colors.red,
    body: new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Image(
          image: new AssetImage("assets/farmer.jpg"),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),

        Container(
          padding: const EdgeInsets.all(40.0),
            child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: new AssetImage("assets/logo.png"),
              ),
              new Form(
                child: Theme(
                      data: new ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.teal,
                        inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                            color: Colors.teal,
                            fontSize:20.0,
                          )
                        )
                      ),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                          new TextFormField(
                         decoration: new InputDecoration(
                         labelText: "Enter Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                         ),

                         new TextFormField(
                         decoration: new InputDecoration(
                         labelText: "Password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                         ),
                         new Padding(
                           padding: const EdgeInsets.only(top:40.0),
                         ),
                         new MaterialButton(
                           height: 40.0,
                           minWidth: 100.0,
                           color: Colors.green,
                           textColor: Colors.white,
                           child: new Icon(Icons.arrow_forward_ios),
                           onPressed: ()=>{},
                           splashColor: Colors.redAccent,
                         )
                      ],
              ),
                ),
                
              )
            ],
          ),
        )
      ],
    ),
    );
  }
}