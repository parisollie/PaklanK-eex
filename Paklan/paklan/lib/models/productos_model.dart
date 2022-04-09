import 'package:flutter/material.dart';

class ProductosModel {
  // le pones late para que no cause problemas en variables no inicializadas
  late final String name;
  late final String image;
  late final int price;
  late final int quantity;

   //ProductosModel({this.name, this.image, this.price, this.quantity = 1});
   //  this.name="", this.image="", required this.price, this.quantity = 1});
   ProductosModel({
    //  this.name="", this.image="", required this.price, this.quantity = 1});
    required this.name, required this.image,required  this.price, this.quantity = 1}); 
}

