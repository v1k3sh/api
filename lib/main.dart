import 'dart:convert';

import 'package:api_integration/model_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

import 'data_model.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 // DataModel? dataModel;
  ProductDataModel? productDataModel;
  //ImageModel? imageModel;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    getProductApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("api"),
        centerTitle: true,
      ),
      body:productDataModel != null
          ? ListView.builder(
          //itemCount: productDataModel!.products!.length,
          itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
               leading: Text(productDataModel!.total.toString()),
            ),
          ),
        );
      }): Center(
    child: CircularProgressIndicator(),
    ));
  }

  // void Getapi() async {
  //   var uri = Uri.parse("https://dummyjson.com/quotes");
  //   var responce = await httpClient.get(uri);
  //
  //   if(responce.statusCode==200){
  //   var mdata = jsonDecode(responce.body);
  //   dataModel = DataModel.fromJson(mdata);
  //   setState(() {
  //
    //   });
  //   print(dataModel);
  //   }
  //
  //   // print('status code: ${responce.statusCode}');
  //   // //print(mdata['quotes'][0]['quote']);
  ///print

   void getProductApi() async {
   var uri = Uri.parse("https://dummyjson.com/products");
     var responce = await httpClient.get(uri);

     if(responce.statusCode==200){
     var mdataP = jsonDecode(responce.body);
     productDataModel = ProductDataModel.fromJson(mdataP);

    print('status code: ${responce.statusCode}');
    setState(() {

     });

   }


   }
}
