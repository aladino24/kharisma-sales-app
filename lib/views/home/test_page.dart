import 'package:flutter/material.dart';
import 'package:kharisma_sales_app/models/cart_offline.dart';
import 'package:kharisma_sales_app/services/database_helper.dart';

// Assuming you have the CartOffline and DatabaseHelper classes defined

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Future<List<CartOffline>>? _cartOfflineFuture;

  @override
  void initState() {
    super.initState();
    _fetchCartOfflineData();
  }

  Future<void> _fetchCartOfflineData() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    _cartOfflineFuture = databaseHelper.getCartOffline();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Offline'),
      ),
      body: FutureBuilder<List<CartOffline>>(
        future: _cartOfflineFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the data is being fetched, show a loading indicator
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // If an error occurred while fetching data, show an error message
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            // If the data is available, display the ListView
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                CartOffline cartOffline = snapshot.data![index];

                // looping dan tampilkan isi CartOffline.product

                
                // Display the data from the CartOffline object
                return ListTile(
                  title: Text(cartOffline.productName),
                  subtitle: Text('Price: ${cartOffline.price}'),
                  // Add more widgets to display other fields as needed
                );
              },
            );
          } else {
            // If there is no data, display a message
            return Center(
              child: Text('No data available.'),
            );
          }
        },
      ),
    );
  }
}
