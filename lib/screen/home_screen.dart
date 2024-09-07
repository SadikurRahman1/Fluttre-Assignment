
import 'package:flutter/material.dart';

class MyBagScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'name': 'Pullover',
      'color': 'Black',
      'size': 'S',
      'price': 51,
      'image': 'assets/images/t_black.jpeg',
    },
    {
      'name': 'T-Shirt',
      'color': 'Red',
      'size': 'M',
      'price': 30,
      'image': 'assets/images/t_red.jpeg',
    },
    {
      'name': 'Sport Dress',
      'color': 'Blue',
      'size': 'L',
      'price': 43,
      'image': 'assets/images/t_blue.jpeg',
    },
    {
      'name': 'Sport Dress',
      'color': 'Orange',
      'size': 'XL',
      'price': 70,
      'image': 'assets/images/t_orange.jpeg',
    },
  ];

  double totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    for (var item in items) {
      totalAmount += item['price'];
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag',
            style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 1,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    leading: Image.asset(item['image'], width: 70),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item['name'],
                            style:
                            const TextStyle(fontWeight: FontWeight.bold)),
                        const Icon(Icons.menu),
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                                'Color: ${item['color']}  Size: ${item['size']}'),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        icon: const Icon(
                                            Icons.remove_circle_outline),
                                        onPressed: () {}),
                                    const Text('1'),
                                    IconButton(
                                        icon: const Icon(
                                            Icons.add_circle_outline),
                                        onPressed: () {}),
                                  ],
                                ),
                                Text('${item['price']}\$',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total amount:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    Text('${totalAmount.toString()}\$',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('CHECK OUT',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


