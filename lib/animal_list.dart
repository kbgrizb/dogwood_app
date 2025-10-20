import 'package:cloud_firestore/cloud_firestore.dart';

import 'animal.dart';

class AnimalListController {
  final List<Animal> animals = [
    Animal(
      name: "Dog", 
      vaccineStatus: false, 
      dewormStatus: false, 
      fleaStatus: false, 
      fecalStatus: false)
    ];

  Future<void> loadAnimals() async {
    final snapshot = await FirebaseFirestore.instance.collection('animals').get();
    animals.clear();
    animals.addAll(snapshot.docs.map((doc) => Animal.fromMap(doc.data(), id: doc.id)));
  }

  void addAnimal(Animal animal) {
    animals.add(animal);
  }

}