PrintWriter output;

void setup(){
  size(200, 200);
  output = createWriter("output.csv");
}

void draw(){
  File[] file = new File("C:\\Users\\Utente\\Documents\\Processing\\PicToByte\\data").listFiles(); //replace with your path
  for(File f : file){
    StringBuilder csv = new StringBuilder();
    PImage foto = loadImage(f.getPath());
    foto.loadPixels();
    for(int i = 0; i < foto.pixels.length; i++){
      csv.append((int)brightness(foto.pixels[i])).append(";");
    }
    output.println(csv.toString());
    image(foto, 0, 0);
  }
  output.flush();
  output.close();
  exit();
}
