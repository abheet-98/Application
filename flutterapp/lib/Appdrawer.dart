import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async';
import 'Homepage.dart';
import 'launchscreen.dart';
import 'Middlepage.dart';

Homepage h = new Homepage();
class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}
/*   String dropdownValue = '1920x1080';
  String servervalue ;
  String portvalue ; */
  String audioSvalue;
  int audiovalue;
class _AppDrawerState extends State<AppDrawer> {
  
  final _scontroller = TextEditingController(text: servervalue );
  final _pcontroller = TextEditingController(text: portvalue);
  final _acontroller = TextEditingController(text: audioSvalue);

  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
              DrawerHeader(
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 3.0,
                        color: Colors.white,
                        fontSize: 30,
                        ),
                      ),
                  ),

                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
            Expanded(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child:
                      Text(
                        'Resolution',
                        style: TextStyle(fontSize: 20, ),
                        ),
                    ),
                    
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['1920x1080','720x576', '1280x720']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                
                
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child:Text('Server',style: TextStyle(fontSize: 20, ),),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      child: TextFormField(
                        
                        controller: _scontroller,
                        decoration: const InputDecoration(
                          hintText: 'Server value',
                        ),
                        /* validator: (String value) {
                          if (value.trim().isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        }, */
                        onSaved: (String value) {
                            servervalue = value;
                          }
                      ),
                    ),
                    
                    
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0,20.0,40.0,20.0),
                      child:Text('Port',style: TextStyle(fontSize: 20, ),),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      child: TextFormField(
                        
                        controller: _pcontroller,
                        decoration: const InputDecoration(
                          hintText: 'Port value',
                        ),
                        /* validator: (String value) {
                          if (value.trim().isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        }, */
                        onSaved: (String value) {
                            portvalue = value;
                          }
                      ),
                    ),
                    
                    
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0,20.0,20.0,20.0),
                      child:Text('Audio',style: TextStyle(fontSize: 20, ),),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      child: TextFormField(
                        
                        controller: _acontroller,
                        decoration: const InputDecoration(
                          hintText: 'Bitrate value',
                        ),
                        /* validator: (String value) {
                          if (value.trim().isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        }, */
                        onSaved: (String value) {
                            audioSvalue = value;
                          }
                      ),
                    ),
                    
                    
                  ],
                ),
              ],
            ),
            ),
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 0.1,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    height: 100,
                    child: FlatButton(
                      onPressed  :  ()  {
                        /*...*/
                        servervalue = _scontroller.text.toString();
                        print(servervalue);
                        portvalue = _pcontroller.text.toString();
                        audioSvalue = _acontroller.text.toString();
                        /* print(controller.status.value.audiobitrate);
                        
                        
                        print(controller.status.value.audiobitrate); */
                        
                        
                      },
                      child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold),)
                    
                    )
                )
                
              ],
            ),// Populate the Drawer in the next step.
        );
  }
}