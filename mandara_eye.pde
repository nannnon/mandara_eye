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
    ++_counter;
  }
  
  void draw()
  {
    int centerX = 0;
    int centerY = 0;
    
    // 白目
    fill(_conjunctivaColor);
    ellipse(centerX, centerY, 256, 128);
    
    // 瞳孔
    fill(_pupilColor);
    float pupilR = 110;
    circle(centerX, centerY, pupilR);
    
    // マキマ
    stroke(255);
    noFill();
    float step = 20;
    for (float r = step; r < pupilR; r += step)
    {
      circle(centerX, centerY, r);
    }
  }
}


int eyesNum = 10;
Eye eyes[];

void setup()
{
  size(1024, 1024);
  
  eyes = new Eye[eyesNum];
  for (int i = 0; i < eyesNum; ++i)
  {  
    eyes[i] = new Eye(1, 256, i * 0.5, 0.1, color(255), color(0));
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
