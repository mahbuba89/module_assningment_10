import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> with WidgetsBindingObserver {



  @override
  Widget build(BuildContext context) => Scaffold(

        appBar: AppBar(
          title: Text('Profile'),
        backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: OrientationBuilder(
            builder: (context, orientation) =>
                orientation == Orientation.portrait
                    ? buildPortrait()
                    : buildLandscape(),
          ),
        ),
      );

  Future setPortrait() async => await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

  Future setLandscape() async => await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);

  Future setPortraitAndLandscape() =>
      SystemChrome.setPreferredOrientations(DeviceOrientation.values);

  Widget buildPortrait() => ListView(
        children: [
          buildImage(),
          const SizedBox(height: 16),
          buildText(),
        ],
      );

  Widget buildLandscape() => Row(
        children: [
          buildImage(),
          const SizedBox(width: 16),
          Expanded(child: SingleChildScrollView(child: buildText())),
        ],
      );

  Widget buildImage() => CircleAvatar(
    radius: 150,
    backgroundColor: Colors.white,
    child: ClipPath(

      child: Image.asset('assets/bgcamera.png'),
    ),
  );

  Widget buildText() => Column(
        children: [
          Text(
            'John Doe',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
           SizedBox(height: 16),
            Container(
              height: 400,
              width: double.infinity,

              child:  Stack(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                      mainAxisSpacing: 5
                       ),
                    itemCount: 10,
                    itemBuilder: (context,index){
                      return Container(
                        height: 300,
                        width: double.infinity,
                        child: Image.asset('assets/apple.jpg'),
                      );
                    },

                  ),
                ],

              ),
            ),


        ],
      );
}
