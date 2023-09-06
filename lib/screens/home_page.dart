import 'package:flutter/material.dart';
import 'package:foodpanda_ui/screens/food_list.dart';
import 'package:foodpanda_ui/widgets/card_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Food Panda',
          style: GoogleFonts.raleway(
            textStyle: Theme.of(context).textTheme.headlineMedium,
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardWidget(
                  text: 'Food Delivery',
                  imageUrl: 'assets/images/food_delivery1.jpeg',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FoodList(),
                        ));
                  }),
              CardWidget(
                  text: 'PandaMart',
                  imageUrl: 'assets/images/pandamart.jpeg',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FoodList(),
                        ));
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardWidget(
                  text: 'Pick-up',
                  imageUrl: 'assets/images/dinein.png',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FoodList(),
                        ));
                  }),
              CardWidget(
                  text: 'Dine-in',
                  imageUrl: 'assets/images/pickup.jpeg',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FoodList(),
                        ));
                  })
            ],
          ),
        ],
      ),
    );
  }
}
