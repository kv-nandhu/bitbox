// ignore: file_names
import 'package:bitebox/cart.dart';
import 'package:bitebox/rec_detailScreen.dart';
import 'package:flutter/material.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  List<AssetImage> image = [
    AssetImage('images/biri.jpg'),
    AssetImage('images/bur.jpg'),
    AssetImage('images/burg.jpg'),
    AssetImage('images/chick.jpg'),
    AssetImage('images/masa.jpg'),
    AssetImage('images/piza.jpg'),
    AssetImage('images/burge.jpg'),
    AssetImage('images/drink.jpg'),
    AssetImage('images/piza.jpg'),
    AssetImage('images/biri.jpg'),
  ];
  List<String> name = [
    'Biriyani',
    'Fluff Screamer',
    'Slugburger',
    'chicken',
    'Masala Dosa',
    'Neapolitan Piza',
    'Luther Burger',
    'Fritz Kola & Fritz Limo',
    'Detroit Pizza',
    'chicken Biriyani',
  ];

  List<String> rate = [
    '₹100.0',
    '₹250.0',
    '₹200.0',
    '₹650.0',
    '₹60.0',
    '₹600.0',
    '₹300.0',
    '₹40.0',
    '₹750.0',
    '₹100.0',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade700,
        title: Text("Favorite"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,bottom: 10),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  mainAxisExtent: 290,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            itemName: name[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Image(
                  image: image[index],
                  height: 170,
                  width: constraints.maxWidth,
                  fit: BoxFit.cover,
                );
              },
            ),
            
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .merge(
                                        const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(rate[index]),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.favorite,color: Colors.red,),
                                      onPressed: () {
                                        // Handle favorite button tap
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.shopping_cart_outlined),
                                      onPressed: () {
                                         Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CartScreen()));
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
      
            //
          ],
        ),
      ),
    );
  }
}
