class Shape {

  ArrayList<Point> silhouette;

  Shape() {
    silhouette = new ArrayList<Point>();
  }

  int size() {
    return silhouette.size();
  }

  void add(Point punto) {
    silhouette.add(punto);
  }

  void set(ArrayList<Point> puntos) {
    silhouette  = puntos;
  }

  Point get(int index) {
    return silhouette.get(index);
  }

  void clear() {
    silhouette.clear();
  }

  void centerShape() {
    ArrayList<Point> nuevo = new ArrayList<Point>();
    int bY = silhouette.get(0).getY();

    for(int i = 1; i < silhouette.size(); i++){
      if(bY < silhouette.get(i).getY()){
        bY = silhouette.get(i).getY();
      }
    }
    
    for(int i = 0; i < silhouette.size(); i++){
      nuevo.add(new Point(silhouette.get(i).getX(),silhouette.get(i).getY()-bY,silhouette.get(i).getZ()));
    }
    
    silhouette = nuevo;
  }

    ArrayList<Point> copy() {
      return (ArrayList)silhouette.clone();
    }
}
