import 'package:flutter/material.dart';

import 'Yemekler.dart';

class YemekDetay extends StatefulWidget {

  Yemekler yemek; //Yemekler sınıfından bir referans oluşturduk.
  YemekDetay({required this.yemek});//Constr. oluşturduk yani ; Yemekdetay nesnesi oluşturduğumuzda içinde refaransı kullanmak zorundayız.


  @override
  State<YemekDetay> createState() => _YemekDetayState();
}

class _YemekDetayState extends State<YemekDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.yemek.yemek_adi),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 300,
                height: 300,
                child: Image.asset("images/${widget.yemek.yemek_resim_adi}")),
            Text("${widget.yemek.yemek_fiyat} ₺",style: TextStyle(
              fontSize: 32,
              color: Colors.blue,
            ),),
            ElevatedButton(onPressed: (){
              print("${widget.yemek.yemek_adi} Sipariş verildi !");
            },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("SİPARİŞ VER",style: TextStyle(fontSize: 18,
                ),),
              ),style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.orange,
            ),),
          ],
        ),
      ),
    );
  }
}
