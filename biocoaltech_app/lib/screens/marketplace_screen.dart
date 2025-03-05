import 'package:flutter/material.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Marketplace'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Buy'),
              Tab(text: 'Sell'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _BuyTab(),
            _SellTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO: Add new listing
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _BuyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5, // Sample data count
      itemBuilder: (context, index) {
        return _ProductCard(
          title: 'Premium Biocoal',
          seller: 'Green Energy Ltd.',
          price: '₹5,000/ton',
          quantity: '10 tons available',
          rating: 4.5,
          location: 'Punjab, India',
          imageUrl: 'https://example.com/biocoal.jpg', // Placeholder image URL
        );
      },
    );
  }
}

class _SellTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ListingForm(),
        const SizedBox(height: 24),
        Text(
          'Your Active Listings',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        _ActiveListing(
          product: 'Agricultural Waste',
          quantity: '5 tons',
          price: '₹2,000/ton',
          status: 'Active',
          onEdit: () {
            // TODO: Edit listing
          },
          onDelete: () {
            // TODO: Delete listing
          },
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String title;
  final String seller;
  final String price;
  final String quantity;
  final double rating;
  final String location;
  final String imageUrl;

  const _ProductCard({
    required this.title,
    required this.seller,
    required this.price,
    required this.quantity,
    required this.rating,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey[300],
            child: const Center(
              child: Icon(Icons.image, size: 48, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  seller,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text(rating.toString()),
                    const SizedBox(width: 16),
                    Icon(Icons.location_on, color: Colors.grey, size: 20),
                    const SizedBox(width: 4),
                    Text(location),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          price,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          quantity,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Handle buy action
                      },
                      child: const Text('Contact Seller'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ListingForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create New Listing',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Product Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Quantity (tons)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Price per ton (₹)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Handle form submission
                },
                child: const Text('Create Listing'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActiveListing extends StatelessWidget {
  final String product;
  final String quantity;
  final String price;
  final String status;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ActiveListing({
    required this.product,
    required this.quantity,
    required this.price,
    required this.status,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Quantity: $quantity'),
            Text('Price: $price'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit'),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
