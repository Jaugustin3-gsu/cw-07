import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      home: FadingTextAnimation(),
    );
  }
}




class FadingTextAnimation extends StatefulWidget {
@override
_FadingTextAnimationState createState() => _FadingTextAnimationState();
}




class _FadingTextAnimationState extends State<FadingTextAnimation> with SingleTickerProviderStateMixin {


    
  late AnimationController _animationController; 
  
  @override 
  void initState() { 
    super.initState(); 
    _animationController = AnimationController( 
      vsync: this, 
      duration: Duration(seconds: 3), 
    )..repeat(); 
  } 
  
  @override 
  void dispose() { 
    _animationController.dispose(); 
    super.dispose(); 
  } 


bool _isVisible = true;
void toggleVisibility() {
setState(() {
_isVisible = !_isVisible;
});
}

 bool _toggle = true; 



 

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Fading Text Animation'),
),
body: Center(

  
    child: Column(
      children: [
    
    
    AnimatedOpacity(
    opacity: _isVisible ? 1.0 : 0.0,
    duration: Duration(seconds: 1),
    child: Text(
      'Hello, Flutter!',
      style: TextStyle(fontSize: 24),
    ),
  ),
     GestureDetector( 
              onTap: () { 
                _animationController.isAnimating 
                    ? _animationController.stop() 
                    : _animationController.repeat(); 
              }, 
              child: Padding( 
                padding: const EdgeInsets.all(8.0), 
                child: Center( 
                  child: Column( 
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [ 
                        
                      // defining the animation type 
                      RotationTransition( 
                        child: Image.asset('assets/falcons-logo.png', 
                            height: 150, width: 150), 
                        alignment: Alignment.center, 
                        turns: _animationController, 
                      ), 
                      SizedBox( 
                        height: 20, 
                      ), 
                      Text('Tap to STOP/ START') 
                    ], 
                  )
                )
              )
     )
  
    ]
),
),



floatingActionButton: FloatingActionButton(
onPressed: toggleVisibility,
child: Icon(Icons.play_arrow),
),
);
}
}