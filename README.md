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
    && cd tubestatus && make install 
```
or (without cloning)
```sh
sudo wget https://raw.githubusercontent.com/smallwat3r/tubestatus/master/tubestatus \
    -P /usr/local/bin && sudo chmod 755 /usr/local/bin/tubestatus
```

## How to use it? 
Type `tubestatus` in your terminal to view all the lines.  
You can also search for specific lines by typing `tubestatus <contains>`.  
