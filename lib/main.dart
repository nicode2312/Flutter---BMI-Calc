import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController=TextEditingController();

  var ftController=TextEditingController();

  var inchController=TextEditingController();

  var result="";
  var msg="";

  var bgcolour; 


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
        title: Text('YourBMI')
      ),
      body: Container(
        color: bgcolour,
        child: Center(
          child: Container(
        
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI",style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w700
                ),),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your Weight in KG'),
                    prefixIcon: Icon(Icons.line_weight_outlined)
                  ),
                  keyboardType: TextInputType.number,
                  
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in ft'),
                    prefixIcon: Icon(Icons.height_outlined)
                  ),
                  keyboardType: TextInputType.number,
                  
                ),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in inch'),
                    prefixIcon: Icon(Icons.height_outlined)
                  ),
                  keyboardType: TextInputType.number,
                  
                ),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: (){
                  var wt=wtController.text.toString();
                  var ft=ftController.text.toString();
                  var inch=inchController.text.toString();
        
                  if (wt!="" && ft!="" && inch!=""){
                    var iwt=int.parse(wt);
                      var ift=int.parse(ft);
                      var iinch=int.parse(inch);
                      var tinch=(ift*12)+iinch;
                      var tcm=tinch*2.54;
                      var tm=tcm/100;
                      var bmi=iwt/(tm*tm); 

                      if (bmi > 25)
                      {
                        msg="You are overweight";
                        bgcolour=Colors.orange;
                      }
                      else if (bmi < 18 )
                      {
                        msg="You are underweight";
                        bgcolour=Colors.red.shade200;
                      
                      }
                      else {
                        msg="You are healthy";
                        bgcolour=Colors.green;
                      }
                    setState(() {
                      
                      result="$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                    });
        
                  }
                  else{
        
                    setState(() {
                      result= "Please fill all of the required blanks";
                    });
        
                  }
                }, child: Text('Calculate')),
                Text(result,style: TextStyle(fontSize: 16),)
        
            
              ],),
          ),
        ),
      )
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
