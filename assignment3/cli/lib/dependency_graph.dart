import 'package:cli/models/node.dart';
import 'package:cli/exceptions/exceptions.dart';

class Singleton {
  late Map<int, Node> idToNode;
  static Singleton? _instance;
  Singleton._internal() {
    idToNode = {};
  }
  static Singleton? get instance {
    _instance ??= Singleton._internal();
    return _instance;
  }

  Node? getNode(int nodeId) {
    if (!idToNode.containsKey(nodeId)) throw NoSuchNodeException();
    return idToNode[nodeId];
  }

  Map<int, Node> getIdToNode() {
    return idToNode;
  }

  void addNode(int nodeId, String nodeName) {
    if (idToNode.containsKey(nodeId)) throw IdAlreadyExistsException();
    Node newNode = Node(nodeId, nodeName);
    idToNode[nodeId] = newNode;
  }

  void deleteNode(int nodeId) {
    if (!idToNode.containsKey(nodeId)) throw NoSuchNodeException();
    deleteAllDependency(nodeId);
    idToNode.remove(nodeId);
  }

  List<int>? getParentsList(int nodeId) {
    if (!idToNode.containsKey(nodeId)) throw NoSuchNodeException();
    Node node = idToNode[nodeId]!;
    return node.getParents();
  }

  List<int>? getChildsList(int nodeId) {
    if (!idToNode.containsKey(nodeId)) throw NoSuchNodeException();
    Node node = idToNode[nodeId]!;
    return node.getChilds();
  }

  Set<int> getAncestors(int nodeId) {
    if (!idToNode.containsKey(nodeId)) throw NoSuchNodeException();
    Set<int> ancestors = {};
    for (var id in idToNode[nodeId]!.getParents() ?? []) {
      ancestors.add(id);
      ancestors.addAll(getAncestors(id));
    }
    return ancestors;
  }

  Set<int> getDescendents(int nodeId) {
    if (!idToNode.containsKey(nodeId)) throw NoSuchNodeException();
    Set<int> ancestors = {};
    for (var id in idToNode[nodeId]!.getChilds() ?? []) {
      ancestors.add(id);
      ancestors.addAll(getDescendents(id));
    }
    return ancestors;
  }

  void addDependency(int childId, int parentId) {
    if (!idToNode.containsKey(parentId)) throw NoSuchNodeException();
    if (!idToNode.containsKey(childId)) throw NoSuchNodeException();
    Node child = idToNode[childId]!;
    Node parent = idToNode[parentId]!;

    if (getDescendents(childId).contains(parentId)) {
      throw CyclicDependencyException();
    }
    if (getAncestors(parentId).contains(childId)) {
      throw CyclicDependencyException();
    }
    parent.addChild(childId);
    child.addParent(parentId);
  }

  void deleteDependency(int childId, int parentId) {
    if (!idToNode.containsKey(parentId)) throw NoSuchNodeException();
    if (!idToNode.containsKey(childId)) throw NoSuchNodeException();
    Node child = idToNode[childId]!;
    Node parent = idToNode[parentId]!;
    parent.removeChild(childId);
    child.removeParent(parentId);
  }

  void deleteAllDependency(int nodeId) {
    if (!idToNode.containsKey(nodeId)) throw NoSuchNodeException();
    Node currentNode = idToNode[nodeId]!;
    List<int>? currentNodeChildsId = [];
    for (int childId in currentNode.getChilds() ?? []) {
      currentNodeChildsId.add(childId);
    }
    for (var childID in currentNodeChildsId) {
      deleteDependency(childID, nodeId);
    }
    List<int>? currentNodeParentsId = [];
    for (int parentId in currentNode.getParents() ?? []) {
      currentNodeParentsId.add(parentId);
    }
    for (var childID in currentNodeParentsId) {
      deleteDependency(childID, nodeId);
    }
  }
}
