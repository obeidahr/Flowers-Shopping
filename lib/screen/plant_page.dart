import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_shop/constants.dart';

class PlantPage extends StatefulWidget {
  final Plant plant;
  PlantPage({this.plant});

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 60),
                    height: 520,
                    color: Colors.grey[400],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.shopping_cart,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.plant.category.toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.plant.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'FORM',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$${widget.plant.price}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'SIZE',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.plant.size,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        RawMaterialButton(
                          padding: EdgeInsets.all(15),
                          shape: CircleBorder(),
                          elevation: 2,
                          fillColor: Colors.black,
                          child: Icon(
                            Icons.add_shopping_cart,
                            size: 35,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print('add to cart');
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      right: 20,
                      bottom: 30,
                      child: Hero(
                        tag: widget.plant.imageUrl,
                        child: Image(
                          height: 200,
                          width: 200,
                          image: AssetImage(
                            widget.plant.imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      )),
                ],
              ),
              Container(
                height: 400,
                transform: Matrix4.translationValues(0, -20, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 40,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'All to know...',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 24),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.plant.description,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Details',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 24)),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Flower heigth 20-30cm',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 16)),
                          Text('Nursary with per 12cm',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 16))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}