import 'package:cli/dependency_graph.dart';
import 'package:cli/models/node.dart';
import 'dart:io';

class GraphInput {
  static void takeInput() {
    final dependencyGraph = Singleton.instance!;
    Map<int, Node> idToNode = dependencyGraph.getIdToNode();
    print("\n1.Add a new node :");
    print("2.Add dependency(childnodeID,parentnodeID) :");
    print("3.Delete dependency(childnodeID,parentnodeID) :");
    print("4.Print all parents of a node :");
    print("5.Print all children of a node :");
    print("6.Print all ancestors of a node :");
    print("7.Print all descendents of a node :");
    print("8.Delete a node :");
    print("9.Exit\n");
    print("Enter choice : ");
    int userChoice = 1;
    try {
      userChoice = int.parse(stdin.readLineSync()!);
    } on FormatException {
      print("Can't convert to a numerical value");
    }
    while (true) {
      switch (userChoice) {
        case 1:
          print("Enter node id :");
          int nodeId = int.parse(stdin.readLineSync()!);
          print("Enter node name :");
          String nodeName = stdin.readLineSync()!;
          dependencyGraph.addNode(nodeId, nodeName);
          break;
        case 2:
          print("Enter child node id :");
          int childNodeId = int.parse(stdin.readLineSync()!);
          print("Enter parent node id :");
          int parentNodeId = int.parse(stdin.readLineSync()!);
          dependencyGraph.addDependency(childNodeId, parentNodeId);
          break;
        case 3:
          print("Enter child node id :");
          int childNodeId = int.parse(stdin.readLineSync()!);
          print("Enter parent node id :");
          int parentNodeId = int.parse(stdin.readLineSync()!);
          dependencyGraph.deleteDependency(childNodeId, parentNodeId);
          break;
        case 4:
          print("Enter node id :");
          int nodeId = int.parse(stdin.readLineSync()!);
          List<int>? parent = dependencyGraph.getParentsList(nodeId);
          if (parent == null || parent.isEmpty) {
            print("No parent exists");
          }
          parent?.forEach((element) {
            print("$element,${idToNode[element]!.getName()}");
          });
          break;
        case 5:
          print("Enter node id :");
          int nodeId = int.parse(stdin.readLineSync()!);
          List<int>? children = dependencyGraph.getChildsList(nodeId);
          if (children == null || children.isEmpty) {
            print("No Child exists");
          }
          children?.forEach((element) {
            print("$element,${idToNode[element]!.getName()}");
          });
          break;
        case 6:
          print("Enter node id :");
          int nodeId = int.parse(stdin.readLineSync()!);
          Set<int> ancestors = dependencyGraph.getAncestors(nodeId);
          if (ancestors.isEmpty) {
            print("No ancestor exists");
          }
          for (var element in ancestors) {
            print("$element,${idToNode[element]!.getName()}");
          }
          break;
        case 7:
          print("Enter node id :");
          int nodeId = int.parse(stdin.readLineSync()!);
          Set<int>? descendents = dependencyGraph.getDescendents(nodeId);
          if (descendents.isEmpty) {
            print("No descendent exists");
          }
          for (var element in descendents) {
            print("$element,${idToNode[element]!.getName()}");
          }
          break;
        case 8:
          print("Enter node id :");
          int nodeId = int.parse(stdin.readLineSync()!);
          dependencyGraph.deleteNode(nodeId);
          break;
        case 9:
          exit(0);
        default:
          exit(0);
      }
      print("Enter choice:");
      userChoice = int.parse(stdin.readLineSync()!);
    }
  }
}
