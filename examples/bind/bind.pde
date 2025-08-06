/*
Binding Events
Press any key to play/pause
*/

import dev.danieltorrer.VLCJP5.*;

VLCJP5 video;

void setup() {
  size(640, 360);
  video = new VLCJP5(this);
  bindVideoEvents();
  video.open("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
}

void draw() {
  background(0);
  image(video, 0, 0, width, height);
}

void keyPressed() {
  if(video.isStopped()) video.play();
  else video.pause();
}

void bindVideoEvents() {

  video.bind( VLCJP5.MediaPlayerEventType.BACKWARD, new Runnable() { public void run() {
    println("BACKWARD");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.BUFFERING, new Runnable() { public void run() {
    println("BUFFERING");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.ERROR, new Runnable() { public void run() {
    println("ERROR");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.FINISHED, new Runnable() { public void run() {
    println("FINISHED");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.FORWARD, new Runnable() { public void run() {
    println("FORWARD");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.LENGTH_CHANGED, new Runnable() { public void run() {
    println("LENGTH_CHANGED");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.MEDIA_CHANGED, new Runnable() { public void run() {
    println("MEDIA_CHANGED");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.MEDIA_PLAYER_READY, new Runnable() { public void run() {
    println("MEDIA_PLAYER_READY");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.MUTED, new Runnable() { public void run() {
    println("MUTED");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.OPENING, new Runnable() { public void run() {
    println("OPENING");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.PAUSABLE_CHANGED, new Runnable() { public void run() {
    println("PAUSABLE_CHANGED");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.PAUSED, new Runnable() { public void run() {
    println("PAUSED");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.PLAYING, new Runnable() { public void run() {
    println("PLAYING");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.POSITION_CHANGED, new Runnable() { public void run() {
    println("POSITION_CHANGED");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.SEEKABLE_CHANGED, new Runnable() { public void run() {
    println("SEEKABLE_CHANGED");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.STOPPED, new Runnable() { public void run() {
    println("STOPPED");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.TIME_CHANGED, new Runnable() { public void run() {
    println("TIME_CHANGED");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.TIME_CHANGED, new Runnable() { public void run() {
    println("TIME_CHANGED");
  } } );

  video.bind( VLCJP5.MediaPlayerEventType.VOLUME_CHANGED, new Runnable() { public void run() {
    println("VOLUME_CHANGED");
  } } );

//Any Event
  video.bind( VLCJP5.MediaPlayerEventType.ALL, new Runnable() { public void run() {
    //println( "ALL" );
  } } );
}
