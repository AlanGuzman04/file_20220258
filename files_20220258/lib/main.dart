// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final PageController _controlapagina = PageController(initialPage: 2);

  int _indiceactuali = 2;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title:  const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ButtonBar(
              children: <Widget>[
              
              Icon(Icons.more_horiz_rounded)

              ],
            ),
            
          
          ],
        ),
      ),
      body: PageView(
        controller: _controlapagina,
        children: const [
          
          PaginaRecents(),
          PaginaShared(),
          PaginaBrowse(),
          
        ],

        onPageChanged: (index) {
          setState(() {
            _indiceactuali = index;
          });
        },


      ),






      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'Recents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload),
            label: 'Shared',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_file_move_rounded),
            label: 'Browse',
          ),
        ],

        selectedItemColor: _colorpaelitem(),

        currentIndex: _indiceactuali,

        onTap: (index) {
          _controlapagina.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
      ),

      
    );
  }




  Color _colorpaelitem() {
    switch (_indiceactuali) {
      case 0:
        return Colors.amber[800]!;
      case 1:
        return Colors.amber[800]!;
      case 2:
        return Colors.amber[800]!;
      default:
        return Colors.amber[800]!;
    }
  }


}











class PaginaBrowse extends StatelessWidget {
  const PaginaBrowse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0), 
        child: ListView(
          
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Text("Browse",
                  style: TextStyle(
                    fontSize: 34.0, 
                    fontWeight: FontWeight.bold, 
                  ),
                
                ),

              ],
            ),

            


            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color.fromARGB(255, 165, 161, 161), 
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8.0), 
              child: const Row(
                children: [
                  Icon(Icons.search), 
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(

                        hintText: "Search", 
                        border: InputBorder.none, 
                        
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0), 
                  Icon(Icons.mic), 
                ],
              ),
            ),

            const SizedBox(height: 30.0),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                SizedBox(width: 30.0),

                Text("Locations",
                  style: TextStyle(
                    fontSize: 20.0, 
                    
                  ),
                
                ),
                SizedBox(width: 310.0),
                Icon(Icons.arrow_drop_down_circle_outlined), 

              ],
            ),


            const Expanded(
              child: Column(
                
                children: <Widget>[
                  
                    ListTile(
                      leading: Icon(Icons.cloud),
                      title: Text('¡Cloud drive'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    
                  

                  ListTile(
                    leading: Icon(Icons.phone_android),
                    title: Text('On My Iphone'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                    
                  

                  ListTile(
                    leading: Icon(Icons.drive_file_move),
                    title: Text('Drive'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  

                  ListTile(
                    leading: Icon(Icons.cloud_queue),
                    title: Text('pCloud'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  

                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Recently Deleted'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  

                ],
              ),
            ),
            


            const SizedBox(height: 30.0),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                SizedBox(width: 30.0),

                Text("Favorites",
                  style: TextStyle(
                    fontSize: 20.0, 
                    
                  ),
                
                ),
                SizedBox(width: 310.0),
                Icon(Icons.arrow_drop_down_circle_outlined), 

              ],
            ),


            const Expanded(
              child: Column(
                
                children: <Widget>[
                  
                    ListTile(
                      leading: Icon(Icons.download_done_rounded),
                      title: Text('Dowloands'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
         
                  

                ],
              ),
            ),

            const SizedBox(height: 30.0),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                SizedBox(width: 30.0),

                Text("Tags",
                  style: TextStyle(
                    fontSize: 20.0, 
                    
                  ),
                
                ),
                SizedBox(width: 355.0),
                Icon(Icons.arrow_drop_down_circle_outlined), 

              ],
            ),


            const Expanded(
              child: Column(
                
                children: <Widget>[
                  
                    ListTile(
                      leading: Icon(Icons.circle_outlined),
                      title: Text('Work'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      leading: Icon(Icons.circle_outlined),
                      title: Text('Home'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
         
                  

                ],
              ),
            ),










          ],
        ),
      );
  }
}












class PaginaRecents extends StatelessWidget {
  const PaginaRecents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Text('Soy el recienteeee'),
    );

  }
}

class PaginaShared extends StatelessWidget {
  const PaginaShared({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Text('Soy compartir creo'),
    );

  }
}


      
      
      
      
      
      
      
 
      
   