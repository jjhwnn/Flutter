class Animal{
  String imagePath;
  String animalName;
  String kind;
  bool flyExist;

// constructor
  Animal(
    {
      required this.animalName,
      required this.kind,
      required this.imagePath,
      required this.flyExist
    }
  );
}