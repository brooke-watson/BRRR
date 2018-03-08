# `BRRR`

### Let Gucci Mane tell you when your script is done.


Have you ever wanted to know - and celebrate - when your simulations are
finally done running in R? Have you ever been so proud of pulling of a
tricky bit of code that you wanted Flavor Flav to yell "yeaaahhhh,
boi!!" as soon as it successfully completes? Have you ever gotten an
error message that felt like DJ Khaled yelling, "They don't wanna see us
win!"

Probably not, but you might now. And now, with BRRR, you can.

<img src="inst/imgs/BRRR.png"/></img>


Installation
------------

`BRRR` is available on Github and can be installed from within R by
running:

    if(!require(devtools)) {install.packages(devtools)}
    devtools::install_github("brooke-watson/BRRR")

Requirements
------------

If you are using Windows or OS X `BRRR` relies on the `audio` package
for sound playback and no external program is needed.

If you're on Linux `BRRR` relies on you having either the `paplay`
utility from the Pulse Audio system, the `aplay` utility from the ALSA
system or [VLC media player](http://www.videolan.org/vlc/index.html)
installed and on the PATH. Chances are that you alread have one of
these. If you are on Debian/Ubuntu you can otherwise get VLC by running
the following in a terminal:

    sudo apt-get install vlc

Details
-------

Inspired by and building from Rasmus Bååth's magnificent
[`beepr`](https://github.com/rasmusab/beepr) package, BRRR has one
function - `skrrrahh()`, which plays a rap adlib when it is called. It
is useful if you have a script that takes a while to run, and want to be
notified when it is finished. The package currently
includes 51 different sounds from 34 artists, the majority of which are pulled from [The Rap Board](http://therapboard.com/) by [LP
Riel](http://www.lpriel.com/). 

The default sound is, appropriately, "BRRR", by Gucci Mane. The package also features two other iconic Guwop sounds: "'S GUCCI" (`skrrrahh(25)`) and "YEAAAHHH" (`skrrrahh(27)`). Gucci's glow up is a daily inspiration in 2017, and BRRR would not be icey without him. 

(`skrrrahh()` is spelled with three R's and two H's, according to the
canonical [Genius.com](https://genius.com/12737380). I will not budge on
this.)


### Usage

```
skrrrahh(sound = 26)
skrrrahh()
skrrrahh(0)
skrrrahh("snoop")
skrrrahh(41)
```

### Arguments

`sound` character string or number specifying what sound to be played by
either specifying one of the built in sounds or specifying the path to a
wav file. The default is 1. Possible sounds are:

    ##  [1] "twochainz"  "twochainz1" "bigboi"     "biggie"     "bigsean"   
    ##  [6] "bigsean1"   "bigsean2"   "bigsean3"   "bigsean4"   "bigsean5"  
    ## [11] "bigshaq"    "birdman"    "birdman1"   "birdman2"   "busta"     
    ## [16] "chance"     "desiigner"  "diddy"      "drake"      "drake1"    
    ## [21] "drummaboy"  "fetty"      "flava"      "future"     "gucci"     
    ## [26] "gucci1"     "gucci2"     "jayz"       "jayz1"  "kendrick"  
    ## [31] "khaled"     "khaled1"    "khaled2"    "khaled3"    "liljon"    
    ## [36] "liljon1"    "nicki"      "pitbull"    "ross"       "ross1"     
    ## [41] "schoolboy"  "snoop"      "soulja"     "takeoff"    "tpain" 
    ## [46] "traviscott" "treysongz"  "trick"      "waka"       "weezy"     
    ## [51] "yg"
    
If `sound` does not match any of the sounds above, a number between 1 and 51, or a valid `http` path to a `.wav` file, a
random sound will be played.

### Examples

    # Play a random rap adlib.
    skrrrahh(0)

    # Update all packages and have Big Sean yell "Whoa Dere" when it is ready.  
    update.packages(ask=FALSE); skrrrahh(10)

    # Change your options to have DJ Khaled console you everytime you hit an error
    # message.
    options(error = function() {skrrrahh(33)})

    # The ting goes: 
    skrrrahh(11)
    
### Abridged Index

[The ting goes SKRRRAHH](https://twitter.com/lilbabycurl/status/904208633386369024): `skrrrahh("bigshaq")` or `skrrrahh(11)`

Various "Yeah Bois": 
- Flavor Flav `skrrrahh("flava")` 
- Drumma Boy: `skrrrahh("drummaboy")` or `skrrrahh(21)` 

Whistles and Bird Calls: 
- Two Chainz: `skrrrahh(2)` OR `skrrrahh("twochainz1")`
- BirdMan: `skrrrahh(12)` OR `skrrrahh("birdman")` AND `skrrrahh(13)` OR `skrrrahh("birdman1")`

Big Sean Doing The Most: 
- Boi:  `skrrrahh(6)` OR `skrrrahh("bigsean")`
- Do it: `skrrrahh(7)` OR `skrrrahh("bigsean1")`
- Stop: `skrrrahh(9)` OR `skrrrahh("bigsean3")`
- Whoa Dere: `skrrrahh(10)` OR `skrrrahh("bigsean4")`
- [Oh God](https://www.youtube.com/watch?v=--5uWXZLIi8): `skrrrahh(8)` OR `skrrrahh("bigsean2")`
