# VLCJ-p5

VLCJ bindings for Processing. This library allows you to play video files in Processing using the power of VLC.

## Building

This project uses Gradle for building.

### Dependencies

The library depends on `vlcj` and `jna`. These are downloaded automatically by Gradle.
You also need to have Processing installed. The build script will try to find your sketchbook location automatically. If it fails, you can set it manually in `build.gradle.kts`.

Be sure to have VLC installed in your computer

### Build tasks

*   `./gradlew build`: Builds the library.
*   `./gradlew packageRelease`: Creates a release zip file in the `release` folder.
*   `./gradlew deployToProcessingSketchbook`: Builds the library and copies it to your Processing sketchbook's `libraries` folder, making it available in the Processing IDE.

## Usage

Here is a basic example of how to use VLCJP5 in your Processing sketch:

```processing
// Import the library
import dev.danieltorrer.VLCJP5.*;

// Declare a VLCJP5 object
VLCJP5 video;

void setup() {
  size(640, 360);
  // Initialize the video object
  video = new VLCJP5(this);
  // Open and play a video file (can be a local file or a URL)
  video.openAndPlay("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
}

void draw() {
  background(0);
  // The VLCJP5 object is a PImage, so you can draw it directly
  image(video, 0, 0, width, height);
}
```

### API

The `VLCJP5` class extends `PImage` and provides a rich API to control video playback.

#### Initialization

`VLCJP5(PApplet parent, String... options)`: Constructor. The `options` are passed to the VLCJ `MediaPlayerFactory`.

#### Playback control

*   `open(String mrl)`: Opens a media file from a path or URL.
*   `openAndPlay(String mrl)`: Opens and immediately starts playing a media file.
*   `play()`: Plays the current media.
*   `pause()`: Pauses the media.
*   `stop()`: Stops the media.
*   `setPause(boolean pause)`: Sets the pause state.
*   `setRepeat(boolean repeat)`: Sets whether the video should loop.
*   `setTime(long time)`: Seeks to a specific time in milliseconds.
*   `setPosition(float position)`: Seeks to a position (0.0 to 1.0).

#### State and properties

*   `isPlaying()`: Returns true if playing.
*   `isPaused()`: Returns true if paused.
*   `isStopped()`: Returns true if stopped.
*   `time()`: Gets the current time in milliseconds.
*   `position()`: Gets the current position (0.0 to 1.0).
*   `length()`: Gets the total length in milliseconds.
*   `duration()`: Alias for `length()`.

#### Audio control

*   `setVolume(int volume)`: Sets the volume (0-200).
*   `volume()`: Gets the current volume.
*   `setMute(boolean mute)`: Mutes or unmutes the audio.
*   `isMute()`: Returns true if muted.

#### Events

You can bind handlers to various media player events.

`bind(MediaPlayerEventType type, Runnable handler)`

Example:
```processing
video.bind(VLCJP5.MediaPlayerEventType.FINISHED, new Runnable() {
  public void run() {
    println("Video finished!");
  }
});
```

Available event types are in the `MediaPlayerEventType` enum.

#### Equalizer

The library provides access to the VLC equalizer.

*   `setEqualizer()`: Enables the equalizer with default settings.
*   `setEqualizer(String presetName)`: Enables the equalizer with a preset.
*   `noEqualizer()`: Disables the equalizer.
*   `setPreamp(float newPreamp)`: Sets the preamp value.
*   `setAmp(int index, float newAmp)`: Sets the amplification for a specific band.
