---
tags:
  - cs/networks
status: ongoing
---
## Hardware

#### Hub
Rebroadcast data to every other machine connected to it on a local network. Can only detect if a device is connected it.
#### Switch
Stores physical (MAC addresses) of devices connected to it. Acts as a hub but only sends data packet to a specified machine.
- Exchange data on LAN

> [!attention] 
> To exchange data outside their own network, a device needs to be able to read IP addresses
#### Router
Routes or passes internet connection to all devices.
- May have built-in switch
- Also acts as a WAP

> [!summary] 
> Hubs and switches are used to create networks.
> Routers are used to connect networks.

#### Modem
Modem demodulates incoming analog signal (internet) into a digital signal (computer) and vice versa.
###### Types
- Cable (coaxial wires)
- DSL (phone line)

### Protocols

##### BGP
Border Gateway Protocol (2 napkin protocol)

- Allows different networks to communicate with each other.
- Runs on TCP protocol on port 179