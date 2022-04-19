class Node implements Comparable<Node> {
  int id;
  String? name;
  late Map<dynamic, dynamic> extraInfo;
  late List<int> parents; // storing all parents of a node
  late List<int> children; // storing all childrent of a node
  Node(this.id, this.name) {
    parents = [];
    children = [];
    extraInfo = {};
  }
  @override
  int compareTo(other) {
    return id.compareTo(other.id);
  }

  String? getName() {
    return name;
  }

  int getId() {
    return id;
  }

  void addChild(int childId) {
    children.add(childId);
  }

  void addParent(int parentId) {
    parents.add(parentId);
  }

  void removeChild(int childId) {
    children.removeWhere((element) => element == childId);
  }

  void removeParent(int parentId) {
    parents.removeWhere((element) => element == parentId);
  }

  List<int>? getParents() {
    // all parent node of a currentnode(with id -> nodid)
    return parents;
  }

  List<int>? getChilds() {
    return children;
  }
}
