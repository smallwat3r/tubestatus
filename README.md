<h3 align="center">tubestatus</h3>
<p align="center">London Tube live status from your terminal using the TFL API.</p>

---

![tubestatus](https://i.imgur.com/MI10KBJ.gif)

## What do you need?
To run this script you will need to install [jq](https://stedolan.github.io/jq/download) 
```sh
brew install jq          # macos
sudo apt-get install jq  # debian / ubuntu
```

## How to install it?

```sh
git clone https://github.com/smallwat3r/tubestatus.git && \
    cd tubestatus && \
    make install 
```
or
```sh
git clone https://github.com/smallwat3r/tubestatus.git && \
    cd tubestatus && \
    cp tubestatus /usr/local/bin/tubestatus && \
    chmod 755 /usr/local/bin/tubestatus
```
or (without cloning)
```sh
sudo wget https://raw.githubusercontent.com/smallwat3r/tubestatus/master/tubestatus \
    -P /usr/local/bin && sudo chmod 755 /usr/local/bin/tubestatus
```

## How to use it? 
Running it is as easy as a simple `tubestatus` in the terminal.  
You can also search for specific lines by typing `tubestatus <contains>`.  
