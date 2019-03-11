
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
float laserXStart , laserXfinal;
float laserXMove = 0;
float laserMaxWidth = 40;
float laserWidth = 0;


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
  soldierY = floor(random(3,6))*80;
  
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
  ellipse(600,50,120,120);
  
  
}

void draw() {
  
  //soil
  image(soil,0,160);
  
	//heart
  image(heart,10,10); // heart1
  image(heart,30+heartWidth,10); // heart2
  image(heart,50+2*heartWidth,10); // heart3

  //soldier
  image(soldier,soldierX,soldierY);
  soldierX += 4;
  soldierX %= 720;
  
  //robot
  image(robot,robotX,robotY);
  
  //laser
  strokeWeight(10);
  stroke(255,0,0); //color red
  line(laserXStart,laserY,laserXfinal,laserY);
  laserWidth = min(laserWidth+1,laserMaxWidth);
  laserX = robotX+25;
  laserXMove += 2;
  laserY = robotY+37;
  laserXStart = laserX-laserXMove;
  laserXfinal = laserXStart-laserWidth;
  if(laserXMove > 160){
    laserXMove=0;
    laserWidth=0;
     
  }
  
}
