import 'package:e_commerse_application/data/model/product_model/product_model.dart';
import 'package:e_commerse_application/service/api_repository/db_repositories.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  ProductRepository productRepository = ProductRepository();
   late List<ProductModel> items=[];
   List<int>  countProducts = [];

  _init()async{
    items = await productRepository.getAllProduct();
    for(int i =0; i <= items.length;i++ ){
      countProducts.add(1);
    }
    setState(() {
    });
  }

@override
  void initState() {
    _init();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){setState(() {
        _init();
      });},child:const Icon(Icons.refresh,color: Colors.yellow),),
      appBar: AppBar(title: const Text("basket page")),
      body:items.isEmpty?Center(child: Text("basket isEmpty"),) :ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin:const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.c060302,width: 2.0 ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              onLongPress: (){
                productRepository.deleteProduct(items[index].id);
                _init();
              },
              leading: Image.network(items[index].image,height: 150,width: 50,),
              title:Text( items[index].category,style: const TextStyle(color: Colors.black),),
              subtitle:Text( "${items[index].price * countProducts[index] }\$",style: const TextStyle(color: Colors.black),),
              isThreeLine: true,
              trailing:
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${countProducts[index]}"),
                    IconButton(onPressed: (){
                      setState(() {
                        if(countProducts[index]<30) {
                          countProducts[index]++;
                        }
                      });
                    }, icon:const Icon(Icons.add,color: Colors.yellow,),),
                    IconButton(onPressed: (){
                      setState(() {
                        if(countProducts[index] > 1) {
                          countProducts[index]--;
                        }else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("sizda bir dona mahsulot qoldi xaridni bekor qilish uchun ustiga bosib turing")));
                        }
                      });
                    }, icon:const Icon(Icons.remove,color: Colors.red,),)
                  ],),
            ),
          );
        },

      )
    );
  }
}
