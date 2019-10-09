# tubestatus
Access the London Tube lines status in real-time from your terminal.

![Alt Text](https://github.com/smallwat3r/tubestatus/blob/master/_demo/demo.gif)  

## Installation

### Dependencies
To run this script you will need to install [jq](https://stedolan.github.io/jq/download) 
- MacOS           `brew install jq`
- Ubuntu / Debian `apt-get install jq`

### Install

Inside the project directory run
```sh
make install 
```
or
```sh
cp src/tubestatus /usr/local/bin/tubestatus
chmod 755 /usr/local/bin/tubestatus
```
## Running
Running is as easy as a simple `tubestatus` in the terminal.  
You can also search for specific lines by typing `tubestatus <contains>`.  
