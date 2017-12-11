#'Play a short rap ad lib.
#'
#'\code{skrrrahh} is exactly like \code{beep} from the beepr package 
#'(https://cran.r-project.org/web/packages/beepr/index.html). 
#'The only difference is in the automatically loaded sounds available. 
#'\code{skrrrahh} uses rap adlibs from [The Rap Board](http://therapboard.com/). 
#'
#'If \code{skrrrahh} is not able to play the sound, a warning is issued rather 
#'than an error. This is in order to not risk aborting or stopping the process 
#'that you wanted to get notified about.
#'
#'@param sound character string or number specifying what sound to be played by 
#'  either specifying one of the built in sounds, specifying the path to a wav 
#'  file or specifying an url. The default is Gucci Mane saying "BRRR", sound 26.
#'  If \code{sound} does not match any
#'  of the sounds above, or is a valid path or url, a random sound will be
#'  played. Currently \code{skrrrahh} can only handle http urls, https is not
#'  supported.
#'  
#'@return NULL
#'@imports audio stringr
skrrrahh <- function(sound=26) {
  
  sounds <- list.files("inst/adlibs")
  names(sounds) <- lapply(sounds, sub, pattern = ".wav", replacement = "")
  sound_path <- NULL
  if(is.na(sounds[sound]) || length(sounds[sound]) != 1) {
    if(is.character(sound)) {
      sound <- str_trim(sound)
      if(file.exists(sound)) {
        sound_path <- sound
      } else if(str_detect(sound, "^https://")) {
        warning("Can't currently use https urls, only http.")
      } else if(str_detect(sound, "^http://")) {
        temp_file <- tempfile(pattern="")
        if(download.file(sound, destfile = temp_file, quiet = TRUE) == 0) { # The file was successfully downloaded
          sound_path <- temp_file
        } else {
          warning(paste("Tried but could not download", sound))
        }
      } else {
        warning(paste('"', sound, '" is not a valid sound nor path.', sep = ""))
      }
    }
  } else {
    sound_path <- system.file(paste("inst/adlibs/", sounds[sound], sep=""), package="BRRR")
  }
  
  if(is.null(sound_path)) { # play a random sound
    sound_path <- system.file(paste("inst/adlibs/", sounds[sample(length(sounds), 1)], sep=""), package="BRRR")
  }
  
  tryCatch(play_file(sound_path), error = function(ex) {
    warning("beep() could not play the sound due to the following error:\n", ex)
  })
}

is_wav_fname <- function(fname) {
  str_detect(fname, regex("\\.wav$", ignore_case = TRUE))
}

play_vlc <- function(fname) {
  system(paste("vlc -Idummy --no-loop --no-repeat --playlist-autostart --no-media-library --play-and-exit", fname), 
         ignore.stdout = TRUE, ignore.stderr=TRUE,wait = FALSE)
  invisible(NULL)
}

play_paplay <- function(fname) {
  system(paste("paplay ", fname), ignore.stdout = TRUE, ignore.stderr=TRUE,wait = FALSE)
  invisible(NULL)
}

play_aplay <- function(fname) {
  system(paste("aplay --buffer-time=48000 -N -q", fname), ignore.stdout = TRUE, ignore.stderr=TRUE,wait = FALSE)
  invisible(NULL)
}

play_audio <- function(fname) {
  sfx <- load.wave(fname)
  play(sfx)
}

play_file <- function(fname) {
  if(Sys.info()["sysname"] == "Linux") {
    if(is_wav_fname(fname) && nchar(Sys.which("paplay")) >= 1) {
      play_paplay(fname)
    } else if(is_wav_fname(fname) && nchar(Sys.which("aplay")) >= 1) {
      play_aplay(fname)
    } else if(nchar(Sys.which("vlc")) >= 1) {
      play_vlc(fname)
    } else {
      play_audio(fname)
    }
  } else {
    play_audio(fname)
  }
}