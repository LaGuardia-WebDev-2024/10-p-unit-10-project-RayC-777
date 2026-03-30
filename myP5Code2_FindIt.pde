//Background Toilets & Plungers
var toiletXPos = [];
var toiletYPos = [];
var toilet = "🚽🪠";
var toiletTotal = 500;

//Background Amenity Symbols
var amenityXpos = [];
var amenityYpos = [];
var amenity = "🚻";
var amenityTotal = 80;

//Finding Pennies 
var penny = [];
var pennyYPos = [];
var penny = "🪙";
var pennyTotal = 7;
var pennyFound = 0;

setup = function() {
   size(600, 450); 

   reset();
}

draw = function(){   

   if(keyPressed){
    if(key == 'r'){
      reset();
    }
   }

  display();
}


mouseClicked = function(){
  check(mouseX, mouseY);
}

var check = function(xClick, yClick){
  for(var i = 0; i < pennyXPos.length; i++){
    if(dist(xClick - 5, yClick - 5, pennyXPos[i], pennyYPos[i])<15){
      pennyXPos.splice(i, 1);
      pennyYPos.splice(i, 1);
      pennyFound++;
    }
  }
}

var display = function(){
  background(100,100,100);

  fill(200,200,0);
  textSize(20);

  for(var i = 0; i < pennyXPos.length; i ++){
    text(penny, pennyXPos[i], pennyYPos[i]);
  }

  for(var i = 0; i < toiletXPos.length; i ++){
    text(toilet, toiletXPos[i], toiletYPos[i]);
  }

  for(var i = 0; i < amenityXpos.length; i ++){
    text(amenity, amenityXpos[i], amenityYPos[i]);
  }

  fill(0,0,0);
  rect(0,400,600,50);
  fill(255,255,255);
  text("Find The " + penny + "s   |   " + penny + " " + pennyFound + "/" + pennyTotal, 0, 425);

  if(pennyFound == pennyTotal && keyPressed){
    fill(0, 200, 200);
    textSize(25);
    text("Press 'r' to restart \nthe game", 50, 200);
    if (key == 'c'){
      text("💵")
    }
  }
}

var reset = function(){
  toiletXPos = [];
  toiletYPos = [];
  amenityXpos = [];
  amenityYPos = [];
  pennyXPos = [];
  pennyYPos = [];
  pennyFound = 0;


  for(var i = 0; i < toiletTotal; i++){
    toiletXPos.push(random(0,600));
    toiletYPos.push(random(0,400));
  }

  for(var i = 0; i < amenityTotal; i++){
    amenityXpos.push(random(0,600));
    amenityYPos.push(random(0,400));
  }

  for(var i = 0; i < pennyTotal; i++){
    pennyXPos.push(random(0,600));
    pennyYPos.push(random(0,400));
  }
}