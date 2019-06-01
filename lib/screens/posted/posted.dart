import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Posted extends StatefulWidget {
  Posted({Key key, this.item}) : super(key: key);

  final int item;

  @override
  _PostedState createState() => new _PostedState();
}

class _PostedState extends State<Posted> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
                child: Container(
                  height: 250.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://pbs.twimg.com/profile_images/760249570085314560/yCrkrbl3_400x400.jpg")),
                  ),
                ),
            ),
            OutlineButton(
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false,
                      )
	      ,
              child: Icon(Icons.close),
            ),
	    Align(
	      alignment: Alignment.bottomCenter,
	      child: 
	      Hero(
		tag:"posted",
		child:
	      Text("Posted!",
		style: TextStyle(
			fontSize: 80.0,
			)
		),
	      ),
            ),
	  ],
        ),
      ),
    );
  }
}
