import processing.sound.*; 

AudioIn input;
Amplitude loudness;

float time = 0.5; 

void setup(){
  size(800, 800);
  stroke(255);
  frameRate(18);
  colorMode(HSB, 100); 
  smooth();
  
  input = new AudioIn(this, 0);
  input.start(); 
  //input.play(); 
  
  loudness = new Amplitude(this);
  loudness.input(input); 
  
}

void draw() {
  float volume = loudness.analyze();
  int size = int(map(volume, 0, 0.2, 1, 350));
  
  time += 0.0025; 
  background(#0D1339);
  translate(width/2, height/2);
  
  for (int i = 2; i < size; i++) {
    rotate(time);
    if(i % 2 == 0){
      stroke((100 * time) % 255, 50, 50, 80); 
      strokeWeight(i / 75); 
      line(i, (i-2), (i-2), 0); 
    } else {
      stroke((10 * time) % 225, 50, 50, 80);
      strokeWeight(i / 75);
      line(-i, (i-3), -(i-3), 0);
    }
  }  
}
  
