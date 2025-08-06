/*
States: BUFFERING, ENDED, ERROR, NOTHING_SPECIAL, OPENING, PAUSED, PLAYING, STOPPED
Press any key to play/pause
*/

import dev.danieltorrer.VLCJP5.*;
import uk.co.caprica.vlcj.player.base.State;

VLCJP5 video;
State state, prevState;

void setup() {
  size(640, 360);
  video = new VLCJP5(this);
  video.open("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
}

void draw() {
  background(0);
  image(video, 0, 0, width, height);
  state = video.state();
  if(state != prevState) println(state);
  prevState = state;
}

void keyPressed() {
  if(video.isStopped()) video.play();
  else video.pause();
}
