﻿/////////////////////////////////////////
//  КОД ПРОГРАММЫ КОРЗИНА ЛОВИТ ЯБЛОКО
//  АВТОР:  ученик  Михаил Б.
////////////////////////////////////////

uses GraphAbc;
var
  basc, p,p1:Picture;
  x,y:integer;
  xa,ya:integer;
 
///////////////////////////////////////
// Это процедура управления клавишами
procedure KeyDown (key : integer);
begin
  
   /////////////////////////////////////
   // Эти IF  вставлены чтобы корзина останавливалась перед краем стены
   if ( x < 50) Then
    x:=50;
   if (x > 1050) Then
    x:=1050;   
   ////////////////////////////////////////
   
   //////////////////////////////////
   // Здесь нужно только управление вправо и влево
    case key of
      VK_Left :  x:=x - 30;
      VK_Right : x:=x + 30;
    end;
end;

//////////////////////////////////////////
// ОСНОВНОЕ ТЕЛО ПРОГРАММЫ
//////////////////////////////////////////

begin
  ////////////////////////
  // Задаются размер экрана по размеру картинки
  setwindowsize(1200,950);
  ClearWindow;

  ///////////////////////////////////////
  // создал папку data  и положил туда картинки. Это более системно
  p     :=Picture.Create('data/gm_bg.png');
  p1    :=Picture.Create('data/gm_apple.png');
  basc  :=Picture.Create('data/gm_bowel.png');
  
  ////////////////////////
  // Задаются начальные координаты корзины
  x:=400;
  y:=750;
 
 
  ///////////////////////
  // Задаются начальные координаты яблока
  xa:=random(900)+100;
  ya:= 10;
  
  repeat

    LockDrawing;  // блокируется  экран
    
    ////////////////////////////////
    // рисуем экран, яблоко и корзину
    p.draw(0,0);
    p1.Draw(xa,ya);
    basc.draw(x,y); 
    
    ya := ya + 10;  // увеличиваем координаты яблока, эмулируя падение. Т.е. движение вниз
    
    ////////////////////////////
    // Этот if определяет, если яблоко дошло до нижней границы, то
    // необходимо получить рандомною координату яблока по Х и сновая яблоко начнет движение сверху с Y=10
    if ya>=750 Then
    begin
      ya := 10;
      xa:=random(900)+100;
    end;
      
    onKeyDown := KeyDown;  //считываем нажание клавиш
    
    UnlockDrawing; // разблокируется экран
    
  until 1=2; // зациклиенваем,чтобы цикл работал вечно.
  
end.