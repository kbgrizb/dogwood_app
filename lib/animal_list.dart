import 'animal.dart';

class AnimalListController {
  final List<Animal> animals = [Animal(name: "Dog", vaccineStatus: false)];

  void addAnimal(String name) {
    animals.add(Animal(name: name, vaccineStatus: false));
  }

  void removeAnimal(Animal animal) { //not implemented yet
    animals.remove(animal);
  }

  void updateVaccine(Animal animal, bool status){
    animal.vaccineStatus = status;
  }
}