# 🚇 tubestatus
Access the London Tube lines status in real-time, from your terminal.

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
Running is as easy as a simple `tubestatus` in the terminal.  
You can also search for specific lines by typing `tubestatus <contains>`.  

#### One-liner
```sh
# Can't search for a specific line with one-liner
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
                print color "●" n, $1 delim $3 delim reason;
            }' | column -t -s "¬"
```
