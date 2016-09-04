/* Going to make pong in processing.js

  ----- GOALS ------
  main goal is to create a pong clone with an ai opponent and 2 player option.
  
  first steps:
  
   1. draw ball to screen
   2. have ball move across screen
   3. ball bounces off of walls
   4. draw left paddle to screen
   5. make paddle moveable with keyboard input
   6. make paddle a collidable object
   7. make ball reset position if hits left wall
   8. tweak and perfect collision against left paddle
         - ball should not "stick" to paddle or glitch out
         - ball should bounce in accordance to the position of the paddle
             (in other words player should be able to change the angled trajectory of the ball
         - if ball hits top or bottom of paddle - ball should bounce into left wall
   9. repeat steps 4 to 8 for the right paddle as player controlled paddle
   10. make simple ai for right paddle.
         - paddle should track the balls y position
   11. make a score board on top of screen
   12. add an option for a 2nd player to control right paddle.
   
   next steps:
   
   1. transfer code into an html doc
   2. upload page to website 
   3. add links to sources of help as well as source code.
   
   v1.2:
   
   - making a main screen with multiple options.

*/

// ****************************************************************************************
// This program aims to create a pong clone that resembles classic pong as best as possible.
// there were many versions of pong, and the long term goal would be to make a main menu
// that resembles an old pong machine, with toggles controlling different settings.
// these would include reverse pong and the ability to add spin to the ball as well
// as many other features that were implemented in the height of this historical game.
// ***************************************************************************************

// current goal: fix messy input on left paddle

// globals
int score1 = 0;
int score2 = 0;
int BALL_SPEED = 10;
boolean isRunning = false;
boolean wDown = false;
boolean sDown = false;
boolean spaceDown = false;
string lastPaddleDir = "";
int ballDir = 1; // if positive moving right if -1 moving left.
float ballSpeedModifier = 2.5;

// setup canvas properties here
void setup() {
  // width and height don't seem to change from default of 200 even if i set size
  size( 800, 400 );
  frameRate(30);
}

 // declare instances
Ball ball = new Ball( 800 / 2, 400 / 2, BALL_SPEED, BALL_SPEED, 20 );
Paddle leftPaddle = new Paddle( 20, 400 / 2 - 35, 20, 70, 8);
Paddle rightPaddle = new Paddle( 800 - ( 20 + 20 ), ( 400 / 2 ) - 35, 20, 70, 6);

// main draw loop / game loop
void draw() {
  
  // draw background clearing the sceen of last drawn objects
  background(0); // set background to black for classic pong feel.

  // check if spacebar is pressed to start game
  spacePressed();
  gamePausedTxt();
  isGameOver();  


  // update - if game is running, update game logic before objects are drawn to the screen
  if(isRunning == true){
    ball.update(); 
    leftPaddleInput();
    paddleAI();
    rightPaddle.update();
    leftPaddle.update();
  }
  
  // draw - after all logic has been calculated, draw to the game screen.
  ball.draw();
  leftPaddle.draw();
  rightPaddle.draw();
  drawScore();
}

void drawScore(){
  textSize(50);
  text( score1, width / 2 - 100, 50 );
  textSize(50);
  text( score2, width / 2 + 100, 50 );
}

class Ball {
    // vars for ball properties
    int diam, r;
    float x, y, dx, dy;
  
  Ball( float x, float y, float dx, float dy, int diam ) {
     this.x = x;
     this.y = y;
     this.diam = diam;
     this.dx = dx;
     this.dy = dy;
     r = diam / 2; // set radius to half the diameter
  }
  
  // displays the current position of the ball to the game screen
  void draw() {
    fill(255);
    ellipse( x, y, diam, diam );
  }
  
  // checks for collision, then updates ball position
  void update() {
      checkCollision();
      x += dx;
      y += dy;
  }
  
  // method that calls booleans to check for collision with walls and paddles
  void checkCollision() {
    htEstWl();
    htSthWl();
    htNthWl();
    htWstWl();
    htPdlRight();
    htPdlLeft();
  }
  
  // bounce off left paddle
  boolean htPdlLeft() {
    if (x <= leftPaddle.x + leftPaddle.w + r && x >= leftPaddle.x && ballDir == -1 ){ // if ball is moving left and inside x dimension of paddle
      if (y + r > leftPaddle.y && y - r < leftPaddle.y + leftPaddle.h) { // and inside y dimension of paddle
        x = leftPaddle.x + leftPaddle.w; // if ball passed through paddle make it look like it bounced off off the edge
        int paddleCenter = leftPaddle.y + leftPaddle.h / 2; // get current pos of paddle center
        int ballCenter = y; // get current position of ball center
        float paddleLocation = paddleCenter - ballCenter; // compare the centers to find the location ball collides with paddle
        dy = paddleLocation / ballSpeedModifier; // modify the y velocity of the ball to change the angle
        dy = -dy; // the result of the y velocity needs to be inversed to bounce the ball off the paddle in the correct direction
        dx = -dx; // invert x velocity to bounce ball back towards other paddle
        ballDir = 1; // direction equals left
      }
    }
  }
  
// bounce off right paddle
  boolean htPdlRight() {
   if (x >= rightPaddle.x - r && x <= rightPaddle.x + rightPaddle.w && ballDir == 1 ){
    if (y + r >= rightPaddle.y && y - r <= rightPaddle.y + rightPaddle.h) {
        x = rightPaddle.x; // if ball passed through paddle make it look like it bounced off off the edge
        int paddleCenter = rightPaddle.y + rightPaddle.h / 2; // get current pos of paddle center
        int ballCenter = y; // get current position of ball center
        float paddleLocation = paddleCenter - ballCenter; // compare the centers to find the location ball collides with paddle
        dy = paddleLocation / ballSpeedModifier; // modify the y velocity of the ball to change the angle
        dy = -dy; // the result of the y velocity needs to be inversed to bounce the ball off the paddle in the correct direction
        dx = -dx; // invert x velocity to bounce ball back towards other paddle
        ballDir = -1; // direction equals right
    }
   }
  }
  
  // bounce when hits north wall
  boolean htNthWl(){
    if ( y <= 0 + r ){
      y = 1 + r; // make sure ball does not get stuck inside wall
      dy = -dy;
    }
  }
  
  // Score #1 when hits east wall
  boolean htEstWl(){
    if ( x > width - r ){
      x = width / 2;
      y = height / 2;
      ballDir = -1;
      dx = -dx;
      dy = BALL_SPEED;
      score1++;
    }
  }
  
  // bounce when hits south wall
  boolean htSthWl(){
    if ( y >= height - r ){
      y = height - (r + 1); // make sure ball does not get stuck inside wall
      dy = -dy;
    }
  }
  
    // score # 2 when hits west wall
  boolean htWstWl(){
    if ( x < 0 + r ){
      x = width / 2;
      y = height / 2;
      ballDir = 1;
      dx = -dx;
      dy = BALL_SPEED;
      score2++;
    }
  }
  
}// ends ball class

class Paddle {
  // paddle dimensions
  int h, w;
  // position and speed(delta y)
  float x, y, dy;
  
  Paddle( float x, float y, int w, int h, float dy ) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.dy = dy;
  }
  
  // keep paddles on screen
  void update(){
    
    if (y >= height - h){
      y = height - (1 + h);
    }
    if (y <= 0){
      y = 1;
    }
  }
  
  // draws the paddle to updated position
  void draw(){
    fill(255);
    rect( x, y, w, h);
  }
}

void  leftPaddleInput(){

    // controls paddle
    if(wDown == true && sDown == false){
      lastPaddleDir = "up";
      leftPaddle.y -= leftPaddle.dy; // move paddle up
    }
    if(sDown == true && wDown == false){
      lastPaddleDir = "down";
      leftPaddle.y += leftPaddle.dy; // move paddle down
    }

    if(sDown == true && wDown == true && lastPaddleDir == "up"){
      leftPaddle.y += leftPaddle.dy;
    }
    if(wDown == true && sDown == true && lastPaddleDir == "down"){
      leftPaddle.y -= leftPaddle.dy;
    }
    if(wDown == false && sDown == false){
      lastPaddleDir = "null";
    }

//let user use mouse to control paddle
    leftPaddle.y = mouseY - leftPaddle.h/2;
    
// keeps paddle on screen
    if (leftPaddle.y >= height - leftPaddle.h){
      leftPaddle.y = height - (1 + leftPaddle.h);
    }
    if (leftPaddle.y <= 0){
      leftPaddle.y = 1;
    }
}

// mouse controls currently over-ride keyboard input. 
// option for either mode will be made in the future.
void keyReleased(){
      if(key == 'w'){
        wDown = false;
        lastPaddleDir = "up";
      }
      if(key == 's'){
        sDown = false;
        lastPaddleDir = "down";
      }
      if(key == ' '){
        spaceDown = false;
      }
}

// mouse controls currently over-ride keyboard input. 
// option for either mode will be made in the future.
void keyPressed(){
      if(key == 'w'){
        wDown = true;
      }
      if(key == 's'){
        sDown = true;
      }
      if(key == ' '){
        spaceDown = true;
      }
}

// controls right paddle, currently not implimented.
void  rightPaddleInput(){
    if(keyPressed){
      if(key == 'i'){
        rightPaddle.y -= rightPaddle.dy;
      }
      if(key == 'k'){
        rightPaddle.y += rightPaddle.dy;
      }
    }
    
    if (rightPaddle.y >= height - rightPaddle.h){
      rightPaddle.y = height - (1 + rightPaddle.h);
    }
    if (rightPaddle.y <= 0){
      rightPaddle.y = 1;
    }
}

// aligns computer paddle with center of ball
void paddleAI(){
  if (rightPaddle.y + ( rightPaddle.h / 2 ) > ball.y - ball.r) {
      rightPaddle.y -= 8;
  }
  if (rightPaddle.y + rightPaddle.h / 2 < ball.y - ball.r) {
    rightPaddle.y += 8;
  }
 
}

// start and pause game with SPACEBAR
void spacePressed(){
      if(spaceDown == true){
        if (isRunning == false){
          isRunning = true;
          spaceDown = false;
          reset();
        }
        else if(isRunning == true){
          spaceDown = false;
          isRunning = false;
        }
      }
  }

// text displayed when game is paused
void gamePausedTxt(){
     if(isRunning == false){
       text("Game Paused. Press SPACE to play!",300,120);
     }
}

// checks if the game has ended and displays the appropriate text to the user.
boolean isGameOver(){
    if(score1 == 5) { // if player wins
      isRunning = false;
      textSize(30);
      text("YOU WIN!", 325,350);
      return true;
    }
    if(score2 == 5) { // if player loses
      isRunning = false;
      textSize(30);
      text("GAME OVER!", 315,350);
      return true;
    }
}

void reset(){
    if(isGameOver() == true){
      score1 = 0;
      score2 = 0;
      leftPaddle.y = ( height / 2 ) - ( leftPaddle.h / 2 );
      rightPaddle.y = ( height / 2 ) - ( rightPaddle.h / 2 );
    }
}

void mouseClicked(){
	isRunning = true;	

}

