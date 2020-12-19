<h3 align="center">tubestatus</h3>
<p align="center">London Tube live status from your terminal using the TFL API.</p>

---

![tubestatus](https://i.imgur.com/0ruXKHs.png)

## Installation

#### Using Homebrew

```sh
brew tap smallwat3r/scripts \
  && brew install tubestatus
```

#### Manual install

To run tubestatus you will need to install 
[jq](https://stedolan.github.io/jq/download) 
```sh
brew install jq          # macos
sudo apt-get install jq  # debian / ubuntu
```

then
```sh
git clone https://github.com/smallwat3r/tubestatus.git \
    && cd tubestatus && sudo make install 
```
or (without cloning)
```sh
sudo wget https://raw.githubusercontent.com/smallwat3r/tubestatus/master/tubestatus \
    -P /usr/local/bin && sudo chmod 755 /usr/local/bin/tubestatus
```

## How to use it? 
Type `tubestatus` in your terminal to view all the lines.  
You can also search for specific lines by typing `tubestatus <contains>`.  

``` console
$ man tubestatus

TUBESTATUS(1)             BSD General Commands Manual            TUBESTATUS(1)

NAME
     tubestatus -- fetch the Tube line statuses from the TfL API

SYNOPSIS
     tubestatus [line]

DESCRIPTION
     The tubestatus utility will print out the London Tube live line statuses 
     from the TfL API (http://api.tfl.gov.uk) in your terminal window.

EXIT STATUS
     The tubestatus utility exits 0 on success, and >0 if an error occurs.

EXAMPLES
     The command:

           tubestatus

     will print all the lines statuses results

     The command:

           tubestatus central

     will print the service status for the central line, or all lines that
     contains 'central' in their name

BSD                           September 21, 2020                           BSD
```

