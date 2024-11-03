import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(125, 0, 0, 0),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Color.fromARGB(255, 200, 0, 0),
                          size: 25,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Text(
                      'Cart',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(125, 0, 0, 0),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 25,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                // Item pertama
                CartItem(
                  image: 'assets/burger.png',
                  name: 'Burger King Medium',
                  price: '50.000',
                  quantity: '1',
                ),
                // Item kedua
                CartItem(
                  image: 'assets/coke.png',
                  name: 'Teh Botol',
                  price: '4000',
                  quantity: '2',
                ),
                // Item ketiga
                CartItem(
                  image: 'assets/burger.png',
                  name: 'Burger King Small',
                  price: '35.000',
                  quantity: '1',
                ),
              ],
            ),
          ),
          const Divider(),
          
          // Ringkasan Belanja
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SummarySection(
              tax: '10.000',
              subtotal: '94.000',
              total: '104.000',
            ),
          ),
          const SizedBox(height: 16),
          
          // Tombol Checkout
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Checkout"),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String quantity;

  const CartItem({super.key, 
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Rp$price,00", style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () {},
                    ),
                    Text(quantity.toString(), style: const TextStyle(fontSize: 16)),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.pink),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class SummarySection extends StatelessWidget {
  final String tax;
  final String subtotal;
  final String total;

  const SummarySection({super.key, 
    required this.tax,
    required this.subtotal,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SummaryRow(label: 'PPN 11%', value: tax),
        SummaryRow(label: 'Total belanja', value: subtotal),
        const Divider(),
        SummaryRow(
          label: 'Total Pembayaran',
          value: total,
          isBold: true,
        ),
      ],
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const SummaryRow({super.key, 
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text("Rp{value.toStringAsFixed(0)},00", style: TextStyle(fontSize: 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}