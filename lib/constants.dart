class Plant {
  final String imageUrl;
  final String name;
  final String category;
  final int price;
  final String size;
  final String description;

  Plant({
    this.imageUrl,
    this.name,
    this.category,
    this.price,
    this.size,
    this.description,
  });
}

final List<Plant> plant = [
  Plant(
    imageUrl: 'assets/images/photo0.jpg',
    name: 'Aloe Vera',
    category: 'Outdoor',
    price: 25,
    size: 'Small',
    description:
        'Aloe vera is a succulent plant species of the genus Aloe. It\'s medicinal uses and air purifying ability make it an awesome plant.',
  ),
  Plant(
    imageUrl: 'assets/images/photo1.jpg',
    name: 'Cool Flower',
    category: 'Indoor',
    price: 30,
    size: 'Medium',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur.',
  ),
  Plant(
    imageUrl: 'assets/images/photo2.jpg',
    name: 'Really Cool Flower',
    category: 'New Arrival',
    price: 42,
    size: 'Large',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',
  ),
];