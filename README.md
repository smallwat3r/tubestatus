# 🚇 tubestatus
Access the London Tube lines status in real-time, from your terminal.

![tubestatus](https://i.imgur.com/krkGQTY.gif)

## Dependencies
To run this script you will need to install [jq](https://stedolan.github.io/jq/download) 
```sh
brew install jq          # macos
sudo apt-get install jq  # debian / ubuntu
```

## Install

```sh
git clone https://github.com/smallwat3r/tubestatus.git && \
    cp tubestatus && \
    make install 
```
or
```sh
git clone https://github.com/smallwat3r/tubestatus.git && \
    cp tubestatus && \
    cp bin/tubestatus /usr/local/bin/tubestatus && \
    chmod 755 /usr/local/bin/tubestatus
```
or (without cloning)
```sh
sudo wget https://raw.githubusercontent.com/smallwat3r/tubestatus/master/bin/tubestatus \
    -P /usr/local/bin && sudo chmod 755 /usr/local/bin/tubestatus
```

## Usage 
Running is as easy as a simple `tubestatus` in the terminal.  
You can also search for specific lines by typing `tubestatus <contains>`.  

#### One-liner (can't search for specific line)    
```sh
curl -s "https://api.tfl.gov.uk/line/mode/tube,overground,dlr,tflrail/status" |
  jq --arg delim "¬" -j '.[] |
  (.name) + $delim,
  (.lineStatuses[0] | (.statusSeverity),
  $delim + (.statusSeverityDescription),
  $delim + (.reason) + "\n")' |
  awk -F "¬" -v delim="¬" -v r="\033[38;5;161m" \
    -v y="\033[38;5;226m" -v g="\033[38;5;082m" -v n="\033[0m" '{
    if ( $4 ) reason=$4;
    else reason="";
    if ( $2 == 10 ) color=g;
    else if ( $2 == 20 ) color=r;
    else if ( $2 >= 8 ) color=y;
    else color=r;
    if ( $2 )
        print color "●" n, $1 delim $3 delim reason;
  }' | column -t -s "¬"
```
