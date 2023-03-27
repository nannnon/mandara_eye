import java.util.ArrayList;


class Eye
{
  float _scale;
  float _radius;
  float _radian;
  float _radianStep;
  
  int _counter;
  color _conjunctivaColor;
  color _pupilColor;
  
  Eye(float scale, float radius, float radian, float radianStep, color cColor, color pColor)
  {
    _scale = scale;
    _radius = radius;
    _radian = radian;
    _radianStep = radianStep;
    
    _counter = 0;
    _conjunctivaColor = cColor;
    _pupilColor = pColor;
  }
  
  void move()
  {
    _radian += _radianStep;
    if (_radian >= 2 * PI)
    {
      _radian -= 2 * PI;
    }
    ++_counter;
  }
  
  void draw()
  {
    pushMatrix();
    translate(width / 2 + _radius * cos(_radian), height / 2 + _radius * sin(_radian));
    rotate(3 * PI / 2 + _radian);
    scale(_scale);
    
    int centerX = 0;
    int centerY = 0;
    
    // 白目
    fill(_conjunctivaColor);
    noStroke();
    ellipse(centerX, centerY, 256, 128);
    
    // 瞳孔
    fill(_pupilColor);
    noStroke();
    float pupilR = 110;
    circle(centerX, centerY, pupilR);
    
    // マキマ
    stroke(255);
    strokeWeight(4);
    noFill();
    float step = 20;
    for (float r = step; r < pupilR; r += step)
    {
      circle(centerX, centerY, r);
    }
    
    popMatrix();
  }
}


ArrayList<Eye> eyes;

void setup()
{
  size(512, 512);
  
  eyes = new ArrayList<Eye>();
  
  int eyesNum = 10;
  for (int i = 0; i < eyesNum; ++i)
  {
    eyes.add(new Eye(0.4, 220, i * 2 * PI / eyesNum, 0.01, color(random(255), random(255), random(255)), color(random(255), random(255), random(255))));
  }
  
  eyesNum = 8;
  for (int i = 0; i < eyesNum; ++i)
  {  
    eyes.add(new Eye(0.3, 128, i * 2 * PI / eyesNum, -0.01, color(random(255), random(255), random(255)), color(random(255), random(255), random(255))));
  }
  
  eyesNum = 7;
  for (int i = 0; i < eyesNum; ++i)
  {  
    eyes.add(new Eye(0.2, 64, i * 2 * PI / eyesNum, 0.01, color(random(255), random(255), random(255)), color(random(255), random(255), random(255))));
  }
}

void draw()
{
  background(0);
  
  for (Eye eye : eyes)
  {
    eye.move();
    eye.draw();
  }
}
