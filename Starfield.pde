Particle[] particles;
void setup()
{
  background(0);
  size(2000, 2000);
  particles = new Particle[5000];
  for (int i=0; i<particles.length; i++) {
    particles[i]=new NormalParticle();
  }
  particles[4000]= new OddballParticle();
  particles[4999]= new JumboParticle();
}
void draw()
{
  background(0);
  for (int i=0; i<particles.length; i++) {
    particles[i].show();
    particles[i].move();
  }
}

class NormalParticle implements Particle
{
  double x, y;
  double speed;
  double angle;
  int mycolor;
  NormalParticle() {
    mycolor= (int)(Math.random()*255)+1;
    speed = Math.random()*10;
    angle = (Math.random()*2)*Math.PI;
    x=1000;
    y=1000;
  }
  public void move() {
    x= x+ Math.cos(angle)*speed;
    y= y+ Math.sin(angle)*speed;
  }
  public void show() {
    fill(mycolor, mycolor, mycolor);
    ellipse((float)x, (float)y, (float)5, (float)5);
  }
}

interface Particle
{
  public void move();
  public void show();
}
class OddballParticle implements Particle
{
  double x, y;
  double speed;
  double angle;
  int mycolor;
  OddballParticle() {
    mycolor= (int)(Math.random()*255)+1;
    speed = Math.random()*10;
    angle = (Math.random()*2)*Math.PI;
    x=1000;
    y=1000;
  }
  public void move() {
    x= x+ ((int)(Math.random()*5)-2);
    y= y+ ((int)(Math.random()*5)-2);
  }
  public void show() {
    fill(255);
    quad((float)x-150, (float) y-100, (float) x +150, (float) y+100, (float) x+250, (float) y+ 250, (float) x-250, (float) y-250);
  }
}
class JumboParticle extends NormalParticle
{
  public void show(){
    fill(255,0,0);
    ellipse((float)x, (float)y, (float)100, (float)100);
}
}
