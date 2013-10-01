# dronemotor

[http://oldwestaction.github.io/dronemotor](http://oldwestaction.github.io/dronemotor)

i made this for [zane shelby](http://github.com/zane) because he has strong feelings about ruby and seeking inner peace.

the audio loops are from [buddha machines](http://en.wikipedia.org/wiki/FM3) versions 1, 2, and 3. you can read more about them [here](http://www.fm3buddhamachine.com).

### this is a buddha machine

![buddha machine)](http://www.codingcolor.com/wp-content/uploads/2009/09/buddhamachine-b.gif)

### usage

+ drop audio files into **/sounds** (must be html5 <audio> element compatible: mp3, ogg, or wav)
+ `$ ruby muncher.rb` generates **sounds.json** (requires: ruby 1.9.3+ and the ruby gems [fileutils](http://rubygems.org/gems/fileutils) and [json](http://rubygems.org/gems/json))