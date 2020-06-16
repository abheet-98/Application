
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_rtmp_publisher/flutter_rtmp_publisher.dart';
import 'package:flutterapp/Loading.dart';
import 'package:screen_keep_on/screen_keep_on.dart';
import 'Appdrawer.dart';
import 'launchscreen.dart';
import 'main.dart';
import 'Tiimer.dart';
import 'Loading.dart';
import 'package:flutter/services.dart';
import 'Middlepage.dart';
import 'Exitpage.dart';

final controller = RtmpLiveViewController();

class Homepage extends StatefulWidget {
 
  
  @override
  _HomepageState createState() => _HomepageState();

}





class _HomepageState extends State<Homepage> {




var vaalue='HD';
/*   var _hint=" 192.168.0.111 ";
  TextEditingController _textFieldController = TextEditingController(); */

  


  @override
  void initState() {
    super.initState();
    print("START START START");
    ScreenKeepOn.turnOn(true);
    initAsync();
  }

  @override
  void dispose() {

    print("OVER OVER OVER");
    ScreenKeepOn.turnOn(false);
    controller.dispose();
    super.dispose();
  }

  Future initAsync() async {
    print("eeeeerereee"+width.toString());
    await controller.initialize(width: ww, height: hh, fps: 30, cameraPosition: RtmpLiveViewCameraPosition.back);
    print(controller.status.value.audiobitrate);
  }
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

Future<bool> _onBackPressed() {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to exit this App'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    //Navigator.popUntil(context, ModalRoute.withName('/MiddlePage'));
                    //Navigator.pushReplacementNamed(context, "/Exitpage");
                    Navigator.of(context).pushNamedAndRemoveUntil('/Exitpage', (Route<dynamic> route) => false);
                  },
                )
              ],
            );
          },
        ) ?? false;
}


  @override
  Widget build(BuildContext context) {
    /* WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight
      ]); */
    return 
         WillPopScope(
           onWillPop: _onBackPressed,
                    child: Scaffold(
            key: _scaffoldKey,
            endDrawer: AppDrawer(),
            body: 
            
            Stack(
              fit: StackFit.expand,
              children:<Widget>[
                Container(
                  margin: EdgeInsets.all(2),
                  child: ValueListenableBuilder<RtmpStatus>(
                    valueListenable: controller.status,
                    builder: (context, status, child) => Column(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: deviceRatio ?? 1.0,
                          child: RtmpLiveView(controller: controller)
                        ),
                      ]
                    )
                  ),
                ),
                
                Builder(
                  builder: (BuildContext context){
                    return Demo1();
                }),
                Align(
                  alignment: Alignment.topCenter,
                  
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                    height: 106.0,
                    width: double.infinity,
                    
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        /* IconButton(
                              icon: Icon(Icons.flash_off , color: Colors.white,),
                              iconSize:30,  
                              onPressed: () { 
                                
                          
                              },
                            ), */
                            ValueListenableBuilder<RtmpStatus>(
                              valueListenable: controller.status,
                              builder: (context, status, child) => 
                              Container( child: status?.isStreaming == true  ? 
                              Container(
                                height: 70.0,
                                color: Colors.transparent,
                                child: new Container(
                                  decoration: new BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(10.0),
                                      topRight: const Radius.circular(10.0),
                                      bottomLeft: const Radius.circular(10.0),
                                      bottomRight: const Radius.circular(10.0),
                                    )
                                  ),
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: new Center(
                                    
                                  child: new Text('LIVE',style: TextStyle(color: Colors.white,fontSize: 20),)
                                )
                              ),
                              )
                               : Container(height: 0,),) 
                            ),
                            ValueListenableBuilder<RtmpStatus>(
                              valueListenable: controller.status,
                              builder: (context, status, child) => 
                              Container( child: status?.isStreaming == true  ? 
                              Container(
                                height: 70.0,
                                color: Colors.transparent,
                                child: new Container(
                                  decoration: new BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(10.0),
                                      topRight: const Radius.circular(10.0),
                                      bottomLeft: const Radius.circular(10.0),
                                      bottomRight: const Radius.circular(10.0),
                                    )
                                  ),
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: new Center(
                                    
                                  child: new TimerPage()
                                )
                              ),
                              )
                               : Container(height:0),) //or any other widget but not null)
                            ),

                            /* Container(
                              height: 70,
                              width: 80,
                              decoration: BoxDecoration(
                                color: new Color.fromRGBO(0, 0, 0, 0.5),
                                borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(10.0),
                                      topRight: const Radius.circular(10.0),
                                      bottomLeft: const Radius.circular(10.0),
                                      bottomRight: const Radius.circular(10.0),
                                    )),
                              child:Column(
                                children: <Widget>[
                                
                                  PopupMenuButton<int>(
                                    itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: 1,
                                            child: Text("SD"),
                                          ),
                                          PopupMenuItem(
                                            value: 2,
                                            child: Text("HD"),
                                          ),
                                          PopupMenuItem(
                                            value: 3,
                                            child: Text("UHD"),
                                          ),
                                        ],
                                        
                                        elevation: 4,
                                        onSelected: (value) {
                                          setState(() {
                                            if(value==1){
                                              vaalue='SD';
                                            }
                                            else if(value==2){
                                              vaalue='HD';
                                            }
                                            else if(value==3){
                                              vaalue='UHD';
                                              ww = 1280;
                                              hh = 720; 


                                            }
                                          }); 
                                          } ,
                                        icon: Icon(Icons.videocam, color: Colors.white),
                                        offset: Offset(0, 150),
                                      ),
                                  
                                  Text(vaalue,style: TextStyle(color: Colors.white),)
                                ],
                              )
                              
                            ) */


                             
                      ],
                    )
                  )
                
                  
                ),

                
                
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 100.0,
                    width: double.infinity,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ValueListenableBuilder<RtmpStatus>(
                          valueListenable: controller.status,
                          builder: (context, status, child) => 
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 24,
                            child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(status == null ? Icons.camera : status.cameraPosition == RtmpLiveViewCameraPosition.back ? Icons.sync : Icons.sync),
                            iconSize: 40,
                            color: Colors.black,
                            onPressed: status == null ? null : () {
                              controller.swapCamera();
                            }
                          )
                          )
                          
                        ),

                        ValueListenableBuilder<RtmpStatus>(
                          valueListenable: controller.status,
                          builder: (context, status, child) => 
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            child:IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(status?.isStreaming == true ? Icons.stop  : Icons.fiber_manual_record),
                              iconSize: 70,
                              color: Colors.red,
                              onPressed: () {
                                if (!status.isStreaming){
                                  //t.rightButtonPressed();
                                  controller.connect(rtmpUrl: 'rtmp://'+servervalue+':'+portvalue+'/live/app', streamName: 'live');
                                }
                                else
                                  //t.rightButtonPressed();
                                  controller.disconnect();
                              }
                            )
                          ),
                        ),
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          child:IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.settings, color: Colors.black,),
                              iconSize:40,  
                              onPressed: () { 
                                //_scaffoldKey.currentState.openEndDrawer();
                          
                              },
                            ),
                        )
                        
                      ],
                    )
                  )
                
                  
                ),
              ]
            )
        
        ),
         );
    
  }

}