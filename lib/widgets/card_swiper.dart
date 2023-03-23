import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';


class CardSwiper extends StatelessWidget {
   
  CardSwiper({Key? key}) : super(key: key);


  List<String> images = [
    "http://www.gaceta.unam.mx/index/wp-content/uploads/2019/03/190307-aca2-des-f1-dia-internacional-mujer.jpg",
    "https://cdn-icons-png.flaticon.com/512/1973/1973739.png",
    "https://androidayuda.com/wp-content/uploads/2021/06/texto-a-voz-1.jpg"
  ];

  List<String> textImages = [
    "getvoices",
    "getlanguages",
    "postsynthesize"
  ];

  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Container(
      width: double.infinity,
      height: size.height * 0.6,
      child: Swiper (
        itemCount: 3,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.65,
        itemHeight: size.height *0.5,
        itemBuilder: (BuildContext context, int index) {
          
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, textImages[index], arguments: "movie-instance"),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder:  const AssetImage("assets/no-image.jpg"), 
                image: NetworkImage(images[index] ),
                fit: BoxFit.cover,
                
              ),
            ),
          );
        },
      ),
    );

  }
}