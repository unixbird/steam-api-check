# steam-api-check
Nagios plugin to query the Steam API to check if a video game server is up or not

The intended use of this was as a Nagios plugin to run inside of CheckMK. This should work in other use cases however but this is the intent. 

Note: This is meant to check for only 1 server at a time. You can use this to check all of your servers or all servers of a specific game but this intended use is to check to see if one game server is up. See Known Issues for more details.

## Prerequisites 
First and foremost you need to register for a SteamAPI key [here](https://steamcommunity.com/dev)

## How to use
| ARG | Purpose |
| :-: | ---- | 
| `-i` | Public ipv4 of your steam server |
| `-k` | Your SteamAPI key |
| `-p` | Port number that the server runs/listens on |
| `-h` | Shows what each argument does |


Running this from command line is as simple as ```./steamapi.sh -i YOURIP -k YOURSTEAMAPIKEY -p 16261```

## Use in CheckMK
Using this in CheckMK is about as easy as using this on the CLI. 

1. Make it executable ```chmod +x steamapi.sh```
2. First you need to move the script into the Nagios Plugins Directory ```mv steamapi.sh local/lib/nagios/plugins/```
3. In the CheckMK WebUI you will search for ```Integrate Nagios Plugins``` in the search directory.
4. In ```Service Description``` you would name this whatever you want. For example I named this one Project Zomboid Server since we are checking for 16261
5. Then check off the ```Command Line``` option and insert what you would insert normally if you ran this in the CLI. I will reuse the example from above ```./steamapi.sh -i YOURIP -k YOURSTEAMAPIKEY -p 16261```
6. Lastly go to the explicit hosts on the bottom of the page and insert the host that hosts this server.


# Special Thanks
To [AnastasiosT](github.com/AnastasiosT) For the optarg portion and helping me integrate this into CheckMK and for figuring out how to do some of this with JQ even if I didn't end up using JQ. 


##Known Issues
1. There isn't json parsing in the result so it looks very messy at this time but still somewhat readable.
2. If you are looking for ALL of your servers this may not work as intended via CheckMK as any results == server is OK. However if this is alright then this may not be an issue for you.
