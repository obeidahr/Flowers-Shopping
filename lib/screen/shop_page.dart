import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_shop/screen/plant_page.dart';
import '../constants.dart';

class ShopPage extends StatefulWidget {
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  _plantSelector(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * .3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (c)=>PlantPage(plant: plant[index])));
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 80.0),
              child: Stack(
                children: [
                  Center(
                    child: Hero(
                      tag: plant[index].imageUrl,
                      child: Image(
                          height: 280,
                          width: 280,
                          image: AssetImage(
                            'assets/images/photo$index.jpg',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                      top: 30,
                      right: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'FROM',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            '\$${plant[index].price}',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )),
                  Positioned(
                      left: 30,
                      bottom: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            plant[index].category.toUpperCase(),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            plant[index].name,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Positioned(
                bottom: 50.0,
                child: RawMaterialButton(
                    padding: EdgeInsets.all(15),
                    shape: CircleBorder(),
                    elevation: 2,
                    fillColor: Colors.black,
                    child: Icon(
                      Icons.add_shopping_cart,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print('add to cart');
                    }))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 50.0),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.withOpacity(.6),
                labelPadding: EdgeInsets.symmetric(horizontal: 35),
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Top',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Outdoor',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Indoor',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'New Arrvals',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Limited Edition',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 500,
              width: double.infinity,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedPage = index;
                    });
                  },
                  itemCount: plant.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _plantSelector(index);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(plant[_selectedPage].description,
                  style: TextStyle(color: Colors.black87,fontSize: 16),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}