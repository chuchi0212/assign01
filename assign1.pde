
//basic data

PImage bg;
PImage soil;
PImage heart;
PImage groundhog;
PImage robot;
PImage soldier;

float robotX, robotY;
float soldierX, soldierY;
float laserX , laserY;
float laserXStart , laserXFinal;
float laserXMove = 0;
float laserMaxLength = 40;
float laserPosition;
float laserSpeed = 2;


float heartWidth = 50;

void setup() {
  
	size(640, 480, P2D);
	bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  heart = loadImage("img/life.png");
  groundhog = loadImage("img/groundhog.png");
  robot = loadImage("img/robot.png");
  soldier = loadImage("img/soldier.png");
  
  //sodier Y position
  soldierY = floor(random(2,6))*80;
  
  //robot position
  robotX = random(160,560);
  robotY = floor(random(2,6))*80;
  
  //background
  background(bg);
  
  //grass
  noStroke();
  colorMode(RGB);
  fill(104,204,25);
  rect(0,145,640,15);
  
  //groundhog
  image(groundhog,280,80);
  
  //solar
  strokeWeight(5);
  stroke(255,255,0);
  fill(253,184,19);
  ellipse(590,50,120,120);
  
  
}

void draw() {
  
  //soil
  image(soil,0,160);
  
	//heart
  image(heart,10,10); // heart1
  image(heart,30+heartWidth,10); // heart2
  image(heart,50+2*heartWidth,10); // heart3

  //soldier
  image(soldier, soldierX - 80, soldierY);
  soldierX += 4;
  soldierX %= 800;
  
  //robot
  image(robot,robotX,robotY);
  
  //laser
  laserPosition -= 2;
  if(laserPosition < -185){
    laserPosition = 0;
  }
  
  strokeWeight(10);
  stroke(255,0,0); //color red
  laserX = robotX + 25;
  laserY = robotY + 37;
  laserXStart = min (laserX, laserX + laserPosition);
  laserXFinal = min (laserX, laserXStart + laserMaxLength);
  line(laserXStart,laserY,laserXFinal,laserY);

}
