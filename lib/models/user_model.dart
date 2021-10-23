class Users {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  Users({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

// YOU - current user
final Users currentUser = Users(
  id: 0,
  name: 'Me',
  imageUrl: 'assets/images/nick-fury.jpg',
  isOnline: true,
);

// USERS
final Users ironMan = Users(
  id: 1,
  name: 'Nguyen A',
  imageUrl: 'assets/images/profile1.jpeg',
  isOnline: true,
);
final Users captainAmerica = Users(
  id: 2,
  name: 'Nguyen B',
  imageUrl: 'assets/images/profile2.jpg',
  isOnline: true,
);
final Users hulk = Users(
  id: 3,
  name: 'Nguyen C',
  imageUrl: 'assets/images/profile3.jpg',
  isOnline: false,
);
final Users scarletWitch = Users(
  id: 4,
  name: 'Nguyen D',
  imageUrl: 'assets/images/profile4.jpg',
  isOnline: false,
);
final Users spiderMan = Users(
  id: 5,
  name: 'Nguyen E',
  imageUrl: 'assets/images/profile5.jpg',
  isOnline: true,
);
final Users blackWindow = Users(
  id: 6,
  name: 'Nguyen F',
  imageUrl: 'assets/images/profile6.jpg',
  isOnline: false,
);
final Users thor = Users(
  id: 7,
  name: 'Nguyen G',
  imageUrl: 'assets/images/profile7.jpg',
  isOnline: false,
);
final Users captainMarvel = Users(
  id: 8,
  name: 'Nguyen H',
  imageUrl: 'assets/images/profile8.jpg',
  isOnline: false,
);