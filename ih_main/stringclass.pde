class StringClass {

  String l;
  
  StringClass(){
    l = "";
  }
  
  void display(){
    textAlign(LEFT);
    text(l, 10,10,50,50);
  }
  
  
  void keyPressed(){
    if (canType == true) {
    if (keyCode == ENTER) {
        l = l +"\n";
      }
    else if (keyCode == BACKSPACE) {
      if (l.length()==0) {
      } else {
        l = l.substring( 0, l.length()-1 );
      } 
    } else {
      l= l+key;
    }
  }
  }

}