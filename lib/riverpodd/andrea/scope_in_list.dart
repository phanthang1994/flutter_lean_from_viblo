import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Declare a Provider for the current product index
final currentProductIndex = Provider<int>((_) => throw UnimplementedError());

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // For demonstration, assume 5 products
      itemBuilder: (context, index) {
        // Add a parent ProviderScope for each item
        return ProviderScope(
          overrides: [
            // Add a dependency override on the product index
            currentProductIndex.overrideWithValue(index),
          ],
          // Return a ProductItem with no constructor arguments
          child: const ProductItem(),
        );
      },
    );
  }
}

class ProductItem extends ConsumerWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the index via WidgetRef
    final index = ref.watch(currentProductIndex);

    // Build a product item based on the index
    return ListTile(
      title: Text('Product $index'),
    );
  }
}

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: ProductList(),
        ),
      ),
    ),
  );
}

