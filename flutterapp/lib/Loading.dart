import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        return Stack(
          fit: StackFit.expand,
          children: [
            child,
            Positioned(
              height: 32.0,
              left: 0.0,
              top: 32.0,
              
              right: 0.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                color: connected ? null : Color(0xFFEE4400),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  child: connected
                      ? null 
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('OFFLINE',style: TextStyle(color: Colors.white),),
                            SizedBox(width: 8.0),
                            SizedBox(
                              width: 12.0,
                              height: 12.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        );
      },
      child:Container(height: 0,)
    );
  }
}