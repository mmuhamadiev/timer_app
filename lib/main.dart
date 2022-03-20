import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int slider = 1;
  int maxSeconds = 30;
  int seconds = 30;
  int milliseconds = 10;
  Timer? timerSeconds;
  Timer? timerMilliseconds;

  bool buttonStart = false;
  bool buttonStop = false;

  List<Padding> timerIndicator = [
  ];

  void numOfList(int num) {
      if (num == 1) {
        timerIndicator = [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          )
        ];
      } else if (num == 2) {
        timerIndicator = [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          )
        ];
      } else if (num == 3) {
        timerIndicator = [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
        ];
      } else if (num == 4) {
        timerIndicator = [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
        ];
      } else if (num == 5) {
        timerIndicator = [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
        ];
      } else if (num == 6) {
        timerIndicator = [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('assets/images/img_3.png'),
          ),
        ];
      }
  }

  void startTimer() {
    if (seconds != 0) {
      timerSeconds = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (seconds != 0) {
            seconds--;
          } else if (seconds == 0) {
            seconds = 30;
            milliseconds = 10;
            maxSeconds = 30;
            slider = 1;
            timer.cancel();
            timerMilliseconds?.cancel();
            timer.isActive;
            numOfList(1);
          }
        });
      });
      timerMilliseconds = Timer.periodic(Duration(milliseconds: 99), (timer) {
        setState(() {
          if (milliseconds == 0) {
            milliseconds = 10;
            milliseconds--;
          } else {
            milliseconds--;
          }
        });
      });
    }
  }

  void stopTimer() {
    timerSeconds = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        timerSeconds?.cancel();
      });
    });
    timerMilliseconds = Timer.periodic(Duration(milliseconds: 99), (_) {
      setState(() {
        timerMilliseconds?.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    numOfList(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Color(0xFF76D89B),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text('INSTRUMENTS',
                        style: GoogleFonts.montserrat(
                          decoration: TextDecoration.underline,
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8,top: 8),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xc4ffffff),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    child: ListTile(
                      leading: const Icon(Icons.home_outlined,size: 35,),
                      title: Text('Home',style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                      )),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.bar_chart,size: 35,),
                  title: Text('Success',style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                  )),
                ),
                ListTile(
                  leading: Icon(Icons.settings,size: 35,),
                  title: Text('Settings',style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                  )),
                ),
                ListTile(
                  leading: Icon(Icons.chat_bubble_outline,size: 35,),
                  title: Text('Review',style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                  )),
                ),
                ListTile(
                  leading: Icon(Icons.announcement_outlined,size: 35,),
                  title: Text('Prompt',style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                  )),
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share this',style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF76D89B), Color(0xFF3FAC9C)])),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Text(
                'Completed ${((1 - seconds / maxSeconds) * 100).toInt()}%',style: GoogleFonts.montserrat(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(30)),
                    width: 250,
                    height: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 1 - seconds / maxSeconds,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xff00AF64),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration:const  BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/img_2.png'))),
                  ),
                  Container(
                    margin:const EdgeInsets.only(bottom: 100, left: 330),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:const RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Slider(
                          activeColor: Color(0xFFFFFF70),
                          inactiveColor: Color(0x6FFFFFFF),
                          value: slider.toDouble(),
                          divisions: 5,
                          min: 1,
                          max: 6,
                          onChanged: (double newValue) {
                            setState(() {
                              numOfList(newValue.toInt());
                              seconds = newValue.round() * 30;
                              maxSeconds = newValue.round() * 30;
                              milliseconds = 10;
                              slider = newValue.round();
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(top: 350),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: timerIndicator,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '$seconds:$milliseconds',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 70,
                    fontWeight: FontWeight.w200,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 80,
                  width: 50,
                  decoration:const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img_1.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          buildFloatingActionButtonStop(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  FloatingActionButton buildFloatingActionButtonStop() {
    if (timerSeconds?.isActive == true) {
      return FloatingActionButton.extended(
        backgroundColor: Color(0xFFFFFCAF),
        label: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Text(
            'STOP',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        onPressed: () {
          timerSeconds?.cancel();
          timerMilliseconds?.cancel();
          setState(() {
            buttonStop == true;
            buttonStart == false;
            timerSeconds?.isActive;
          });
        },
      );
    } else if (timerSeconds?.isActive == false) {
      return FloatingActionButton.extended(
        backgroundColor: Color(0xFFFFFCAF),
        label: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Text(
            'FOCUS',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        onPressed: () {
          startTimer();
          setState(() {
            buttonStop == false;
            buttonStart == true;
          });
        },
      );
    }
    return FloatingActionButton.extended(
      backgroundColor: const Color(0xFFFFFCAF),
      label: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Text(
          'FOCUS',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      onPressed: () {
        startTimer();
        setState(() {
          buttonStop == false;
          buttonStart == true;
        });
      },
    );
  }
}
