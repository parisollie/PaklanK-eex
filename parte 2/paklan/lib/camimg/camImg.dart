
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:async/async.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:dio/dio.dart';

class CamImg extends StatefulWidget {
 
  @override
  State<CamImg> createState() => _CamImgState();

}

class _CamImgState extends State<CamImg> {

  File? imagen=null;
  final picker = ImagePicker();

  Future selImagen (op)async{ 
    var pickedFile;
    if (op ==1 ) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
      
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
  
    }

    setState(() {
      if (pickedFile != null ) {
        //imagen = File(pickedFile.path);
        cortar ( File(pickedFile.path));

      } else {
        print('No seleccionaste nada');
      }
    });

    Navigator.of(context).pop();
    
  }

  cortar (picked)async{
     File? cortado = await ImageCropper().cropImage(
       sourcePath: picked.path,
       aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0)   
     );

     if (cortado != null ) {
       setState(() {
         imagen = cortado;
       });
        
     }
  }

  Dio dio = new Dio();
  Future<void> subir_imagen ()async{

    try {
      String filename = imagen!.path.split('/').last;
      FormData formData = new FormData.fromMap(
        { 
          //'usuario' : 'iddeUsuario',  
          //'nombre' : 'nombreUsuario',  
          'file' : await MultipartFile.fromFile(
            imagen!.path, filename: filename
          )
        });
       
         await dio.post('http://paul.com/etc.php',
          data: FormData).then((value){

            if (value.toString() == '1' ) {
               print('La foto se subio correctamente');
            } else {
              print('Hubo un error');
            }
            
            });
        
      
    } catch (e) {
      print(e.toString());
    }

  }


  opciones (context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: SingleChildScrollView(
           child:Column(
             children: [
               InkWell(
                 onTap:(){ 
                   selImagen(1);
                 },
                 child: Container(
                   padding: EdgeInsets.all(20),
                   decoration: BoxDecoration(
                     border: Border(bottom: BorderSide(width: 1,color: Colors.greenAccent))
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: Text('Tomar una foto',style: TextStyle(
                           fontSize: 16,
                         ),),
                       ),
                       Icon(Icons.camera_alt,color: Colors.blue)
                     ],
                   ),
                 ),
               ),

               InkWell(
                 onTap:(){ 
                   selImagen(2);
                 },
                 child: Container(
                   padding: EdgeInsets.all(20),
                   
                   child: Row(
                     children: [
                       Expanded(
                         child: Text('Seleccionar una foto',style: TextStyle(
                           fontSize: 16,
                         ),),
                       ),
                       Icon(Icons.image,color: Colors.blue)
                     ],
                   ),
                 ),
               ),

               InkWell(
                 onTap:(){ 
                   Navigator.of(context).pop();
                 },
                 child: Container(
                   padding: EdgeInsets.all(20),
                   decoration: BoxDecoration(
                     color: Colors.redAccent
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: Text('Cancelar',style: TextStyle(
                           fontSize: 16,
                           color: Colors.white
                         ),textAlign: TextAlign.center),
                       ),
                       //Icon(Icons.image,color: Colors.blue)
                     ],
                   ),
                 ),
               ),
              ],
            ),
          ),
        );
      }
    );  
  }
    

  @override
  Widget build(BuildContext context) {
    final shape = StadiumBorder();
    
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      appBar: AppBar(
        title: Text('Selecciona una imagen'),
      ),
      body:Container(
        decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(1920.0),
                          topRight: Radius.circular(10.0),
                        ),
                        color: Colors.white),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: ShapeDecoration(
                      shape: shape,
                      gradient:LinearGradient(
                        colors:[
                        Colors.greenAccent, 
                        Colors.indigo,
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                                tapTargetSize:MaterialTapTargetSize.shrinkWrap,
                                primary:Colors.transparent,
                                shadowColor:Colors.transparent,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                        ), 
                      onPressed:() {
                        opciones (context);
                      },
                      child: Text('Selecciona una imagen'),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(height: 10,),

                   Container(
                    margin: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: ShapeDecoration(
                      shape: shape,
                      gradient:LinearGradient(
                        colors:[
                        Colors.greenAccent, 
                        Colors.indigo,
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                                tapTargetSize:MaterialTapTargetSize.shrinkWrap,
                                primary:Colors.transparent,
                                shadowColor:Colors.transparent,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                        ), 
                      onPressed:() {
                        subir_imagen ();
                      },
                      child: Text('Subir imagen'),
                    ),
                  ),
                  SizedBox(height: 30,),
                  //Center()
                  imagen == null ? Center() :Image.file(imagen!) 
                ],
              ),
            )
          ],
        ),
      ),
      
    );
  }
}