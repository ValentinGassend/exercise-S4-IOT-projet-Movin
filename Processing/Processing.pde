import processing.serial.*;
import ddf.minim.*;

Serial port;
Minim minim;
AudioPlayer dataAudio;
int xvalue = 0;
int yvalue = 0;
Balle MaBalle = new Balle(30,30);
PImage img_balle;

dataAudio = minim.loadFile("music.mp3");

void setup() {
    size(1024, 768);
    port = new Serial(this, "COM3", 9600);
    port.bufferUntil('\n');
    img_balle=loadImage("balle.jpg");
    minim = new Minim(this);
}

void draw() {
  text("ma balle vaut "+maBalle.X,width/2-100,200);
  image(img_balle,width,height);
    MaBalle.bouge();
    MaBalle.testEcran();
    MaBalle.display();
    println(xvalue,yvalue);
    dataAudio = minim.loadFile("music.mp3");
}

void serialEvent(Serial port) {
    String serialStr = port.readStringUntil('\n');
    serialStr = trim(serialStr);
    int values[] = int(split(serialStr, ','));
    if( values.length == 3 ) {
        xvalue =-calculate(values[1], 360);
        yvalue =-calculate(values[0], 365);
    }
}

int calculate (int currentvalue, int basevalue){
 int calc=(currentvalue-basevalue)/20;
  return calc;
}
void stop() {
 dataAudio.close(); 
 minim.stop();
 super.stop();
}
