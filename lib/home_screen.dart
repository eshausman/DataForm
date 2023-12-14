import 'dart:js';

import 'package:flutter/material.dart';

class DataForm extends StatefulWidget {
  
  @override
  State<DataForm> createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> {
  var nameController = TextEditingController();

  var idController = TextEditingController();

  var materialController = TextEditingController();

  var purchaseController = TextEditingController();

  var retailController = TextEditingController();

  var descriptionController = TextEditingController();

  var allUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Product Information', style: TextStyle(fontSize: MediaQuery.of(context).size.width/16, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
              
              SizedBox(height: 20,),

              TextField(keyboardType: TextInputType.name,
                controller: nameController,
                decoration: InputDecoration(
                border: OutlineInputBorder( borderSide: BorderSide(color: Colors.deepOrange), 
                  borderRadius: BorderRadius.circular(50)
                ),
                label: Text('Product name', style: TextStyle(color: Colors.deepOrange),),
              ),),

                  SizedBox(height: 10,),
              
              TextField(keyboardType: TextInputType.number,
                controller: idController,
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)),
                label: Text('Product Id', style: TextStyle(color: Colors.deepOrange),),
              ),),

               SizedBox(height: 10,),
              
              TextField(keyboardType: TextInputType.text,
                controller: materialController,
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                label: Text('Material', style: TextStyle(color: Colors.deepOrange),),
              ),),

               SizedBox(height: 10,),
              
              TextField(keyboardType: TextInputType.number,
                controller: purchaseController,
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                label: Text('Purchase Price', style: TextStyle(color: Colors.deepOrange),),
              ),),

               SizedBox(height: 10,),
              
              TextField(keyboardType: TextInputType.number,
                controller: retailController,
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                label: Text('Retail Price', style: TextStyle(color: Colors.deepOrange),),
              ),),

               SizedBox(height: 10,),
              
              TextField(keyboardType: TextInputType.text,
                controller: descriptionController,
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                label: Text('Description', style: TextStyle(color: Colors.deepOrange),),
              ),),

               SizedBox(height: 25,),
              
               MaterialButton(onPressed: (){
                var user = {
                  "name": nameController.text,
                  "id": idController.text,
                  "material": materialController.text,
                  "purchaseprice": purchaseController.text,
                  "retailprice": retailController.text,
                };
      
                allUsers.add(user);
                nameController.clear();
                idController.clear();
                materialController.clear();
                purchaseController.clear();
                retailController.clear();
                descriptionController.clear();
                setState(() {
                  
                });
      
               }, 
               color: Colors.grey[300], 
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text('SUBMIT', style: TextStyle( color: Colors.deepOrange,fontWeight: FontWeight.bold),),
               ),),
              
               SizedBox(height: 25,),
              
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child: DataTable(border: TableBorder.all(color: Colors.grey.shade300),
                  
                  columns: [
                  DataColumn(label: Text('Product Name', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),)),
                  DataColumn(label: Text('Product Id', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),)),
                  DataColumn(label: Text('Material', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),)),
                  DataColumn(label: Text('Purchase Price', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),)),
                  DataColumn(label: Text('Retail Price', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),)),
                  DataColumn(label: Text('Delete', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),)),
                 ],
                 
                  rows:[
                  for ( var user in allUsers)
                  DataRow(cells: 
                  [
                    DataCell(Text(user["name"].toString())),
                    DataCell(Text(user["id"].toString())),
                    DataCell(Text(user["material"].toString())),
                    DataCell(Text(user["purchaseprice"].toString())),
                    DataCell(Text(user["retailprice"].toString())),
                    DataCell(
                      IconButton(
                        onPressed: () {
                          allUsers.remove(user);
                          setState(() {
                            
                          });
                        },
                        icon: Icon(Icons.delete, color: Colors.deepOrange,))),
                  ])
                     
                 ]),
               )
      
      
          ],),
        ),
      ),
    );
  }
}