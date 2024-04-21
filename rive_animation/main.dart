import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Artboard? riveArtBoard;
  SMITrigger? doSquat;
  int sC = 0;

  @override
  void initState() {
    rootBundle.load('assets/lumberjack_squats.riv').then((value) async {
      try{
        final file = RiveFile.import(value);
        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(artboard, "Don't Skip Leg Day");
        if(controller != null)
          {
            artboard.addController(controller);
            doSquat = controller.findSMI("Squat");
          }
        setState(() {
          riveArtBoard = artboard;
        });
      }catch(e)
      {
        print(e);
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9F08E),
      body: riveArtBoard == null ? const SizedBox() : Column(
        children: [
          Expanded(child: Rive(artboard: riveArtBoard!,),),
          const SizedBox(height: 12,),
          Text("Squat $sC",style: TextStyle(
            color: Color(0xFFEF485E),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),),
          ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFB9F08E),

    ),
    onPressed: () {
            doSquat?.fire();
            setState(() {
              sC++;
            });
          }, child: Text("Lets Squat")),
        ],
      ),
    );
  }
}
