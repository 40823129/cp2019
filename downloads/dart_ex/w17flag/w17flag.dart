import 'dart:html';
import 'dart:math' as Math;

CanvasElement canvas;
CanvasRenderingContext2D ctx;
int flag_w = 300;
int flag_h = 200;
num circle_x = flag_w / 4;
num circle_y = flag_h / 4;

void main() {
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');

  drawru(ctx);
  querySelector("#ru").onClick.listen((e) => drawru(ctx));
  querySelector("#Fr").onClick.listen((e) => drawFr(ctx));
  querySelector("#ja").onClick.listen((e) => drawja(ctx));
  querySelector("#roc").onClick.listen((e) => drawroc(ctx));
  querySelector("#ge").onClick.listen((e) => drawge(ctx));
   querySelector("#ne").onClick.listen((e) => drawne(ctx));
  querySelector("#button").onClick.listen((e) => clearCanvas());
}



void drawru(ctx){
  
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = '#ffffff';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = '#0000ff';
  ctx.fillRect(0, 66, flag_w, flag_h);
  ctx.fillStyle = '#ff0000';
   ctx.fillRect(0, 132, flag_w, flag_h);
  
}


void drawFr(ctx){
  
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = '#0000ff';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = '#ffffff';
  ctx.fillRect(100, 0, flag_w, flag_h);
  ctx.fillStyle = '#ff0000';
   ctx.fillRect(200, 0, flag_w, flag_h);
  
}
  
  void drawja(ctx){
  
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = '#ffffff';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.beginPath();
  ctx.arc(150, 100, 60, 0, Math.pi *2, true);
  ctx.fillStyle = '#ff0000';
  ctx.closePath();
  
  
  ctx.fill();
}
void drawroc(ctx){
  // 先畫滿地紅
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  // 再畫青天
  ctx.fillStyle = 'rgb(0, 0, 150)';
  ctx.fillRect(0, 0, flag_w / 2, flag_h / 2);
  // 畫十二道光芒白日
  ctx.beginPath();
  num star_radius = flag_w / 8;
  num angle = 0;
  for (int i = 0; i < 25; i++) {
    angle += 5 * Math.pi * 2 / 12;
    num toX = circle_x + Math.cos(angle) * star_radius;
    num toY = circle_y + Math.sin(angle) * star_radius;
    // 只有 i 為 0 時移動到 toX, toY, 其餘都進行 lineTo
    if (i != 0)
      ctx.lineTo(toX, toY);
    else
      ctx.moveTo(toX, toY);
  }
  ctx.closePath();
  // 將填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
  // 白日:藍圈
  ctx.beginPath();
  ctx.arc(circle_x, circle_y, flag_w * 17 / 240, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為藍色
  ctx.fillStyle = 'rgb(0, 0, 149)';
  ctx.fill();
  // 白日:白心
  ctx.beginPath();
  ctx.arc(circle_x, circle_y, flag_w / 16, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
}
void drawge(ctx){
  
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = '#000000';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = '#ff0000';
  ctx.fillRect(0, 66, flag_w, flag_h);
  ctx.fillStyle = '#ffd700';
   ctx.fillRect(0, 132, flag_w, flag_h);
  
}
void drawne(ctx){
  
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = '##ff0000';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = '#ffffff';
  ctx.fillRect(0, 66, flag_w, flag_h);
  ctx.fillStyle = '#0000ff';
   ctx.fillRect(0, 132, flag_w, flag_h);
  
}

void clearCanvas(){
  ctx.clearRect(0, 0, flag_w, flag_h);
}
