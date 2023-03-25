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

Run `tubestatus` in your terminal to view the status of all the lines. You can also search 
for specific lines by running `tubestatus <contains>`. Run `man tubestatus` for more details.  


## For the one-liner lovers out there

```sh
curl -s "https://api.tfl.gov.uk/line/mode/tube,overground,dlr/status" |
  jq --arg delim "¬¬¬" -j '.[] |
  (.name) + $delim, (
      .lineStatuses[0] | (.statusSeverity),
      $delim + (.statusSeverityDescription),
      (if .reason then $delim + (.reason | gsub("[\\n\\t]"; "")) + "\n" else "\n" end)
  )' |
  awk -F "¬¬¬" -v delim="¬¬¬" -v r="$(tput setaf 161)" -v b="$(tput setaf 39)" \
      -v y="$(tput setaf 226)" -v g="$(tput setaf 118)" -v gr="$(tput setaf 243)" \
      -v n="$(tput sgr0)" '{
      if ($4) reason=$4; else reason="";
      if ($2 == 10) color=g;
      else if ($2 == 20) color=gr;
      else if ($2 == 0) color=b;
      else if ($2 >= 8) color=y;
      else color=r;
      print color "●" n, $1 delim $3 delim reason;
  }' |
  column -t -s "¬¬¬"
```
