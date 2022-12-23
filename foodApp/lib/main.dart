import 'package:flutter/material.dart';
import 'package:flutter_ornek11/YemekDetay.dart';

import 'Yemekler.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Yemekler>> yemekleriGetir() async {

    var yemekListesi = <Yemekler>[]; // Yemekler sinifından Yemekleri(nesneleri) tutan bir liste tanımladık.

    var yemek1=Yemekler(yemek_id: 1, yemek_adi: "Köfte", yemek_resim_adi: "kofte.png", yemek_fiyat: 70);
    var yemek2=Yemekler(yemek_id: 2, yemek_adi: "Ayran", yemek_resim_adi: "ayran.png", yemek_fiyat: 6);
    var yemek3=Yemekler(yemek_id: 3, yemek_adi: "Kola", yemek_resim_adi: "kola.png", yemek_fiyat: 11.5);
    var yemek4=Yemekler(yemek_id: 4, yemek_adi: "Makarna", yemek_resim_adi: "makarna.png", yemek_fiyat: 50);
    var yemek5=Yemekler(yemek_id: 5, yemek_adi: "Baklava", yemek_resim_adi: "baklava.png", yemek_fiyat: 35);
    var yemek6=Yemekler(yemek_id: 6, yemek_adi: "Kadayif", yemek_resim_adi: "kadayif.png", yemek_fiyat: 30);
   

    yemekListesi.add(yemek1);
    yemekListesi.add(yemek2);
    yemekListesi.add(yemek3);
    yemekListesi.add(yemek4);
    yemekListesi.add(yemek5);
    yemekListesi.add(yemek6);

    return yemekListesi;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemekler"),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var yemekListesi=snapshot.data;//Bu snapshot.data future:yemekleriGetir() metodu çalışığında return eden değeri temsil eder.Bu sonucu almış olduk.

            return ListView.builder(
              itemCount: yemekListesi!.length,//Liste içerisindeki boyutlandırma.
              itemBuilder: (context,index){//context bu sayfayı, index gelen liste içerindeki elamının her bir tanesini temsil eder(döngü mantığı)
                var gelenYemekIndexi=yemekListesi[index];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>YemekDetay(yemek: gelenYemekIndexi)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset("images/${gelenYemekIndexi.yemek_resim_adi}")),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Padding(
                              padding: const EdgeInsets.only(top:10),
                              child: Text(gelenYemekIndexi.yemek_adi,style: TextStyle(
                                fontSize: 20,
                              ),),
                            ),
                            SizedBox(height: 40,),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text("${gelenYemekIndexi.yemek_fiyat} ₺",style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),),
                            ),
                          ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_right_alt_rounded),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          else{
            return Center();//Bilgi gelmezse boş bir tasarım gösterir.
          }
        },
      ),
    );
  }
}
