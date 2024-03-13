# DC3

## Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| POD1 | l3leaf | DC3-BORDER1 | 10.99.99.219/24 | vEOS | Provisioned | - |
| POD1 | l3leaf | DC3-BORDER2 | 10.99.99.220/24 | vEOS | Provisioned | - |
| POD1 | l3leaf | DC3-LEAF1 | 10.99.99.215/24 | vEOS | Provisioned | - |
| POD1 | l3leaf | DC3-LEAF2 | 10.99.99.216/24 | vEOS | Provisioned | - |
| POD1 | l3leaf | DC3-LEAF3 | 10.99.99.217/24 | vEOS | Provisioned | - |
| POD1 | l3leaf | DC3-LEAF4 | 10.99.99.218/24 | vEOS | Provisioned | - |
| DC3 | spine | DC3-SPINE1 | 10.99.99.213/24 | vEOS | Provisioned | - |
| DC3 | spine | DC3-SPINE2 | 10.99.99.214/24 | vEOS | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | DC3-BORDER1 | Ethernet49/1 | spine | DC3-SPINE1 | Ethernet7/1 |
| l3leaf | DC3-BORDER1 | Ethernet50/1 | spine | DC3-SPINE2 | Ethernet7/1 |
| l3leaf | DC3-BORDER1 | Ethernet55/1 | mlag_peer | DC3-BORDER2 | Ethernet55/1 |
| l3leaf | DC3-BORDER1 | Ethernet56/1 | mlag_peer | DC3-BORDER2 | Ethernet56/1 |
| l3leaf | DC3-BORDER2 | Ethernet49/1 | spine | DC3-SPINE1 | Ethernet8/1 |
| l3leaf | DC3-BORDER2 | Ethernet50/1 | spine | DC3-SPINE2 | Ethernet8/1 |
| l3leaf | DC3-LEAF1 | Ethernet49/1 | spine | DC3-SPINE1 | Ethernet1/1 |
| l3leaf | DC3-LEAF1 | Ethernet50/1 | spine | DC3-SPINE2 | Ethernet1/1 |
| l3leaf | DC3-LEAF1 | Ethernet55/1 | mlag_peer | DC3-LEAF2 | Ethernet55/1 |
| l3leaf | DC3-LEAF1 | Ethernet56/1 | mlag_peer | DC3-LEAF2 | Ethernet56/1 |
| l3leaf | DC3-LEAF2 | Ethernet49/1 | spine | DC3-SPINE1 | Ethernet2/1 |
| l3leaf | DC3-LEAF2 | Ethernet50/1 | spine | DC3-SPINE2 | Ethernet2/1 |
| l3leaf | DC3-LEAF3 | Ethernet49/1 | spine | DC3-SPINE1 | Ethernet3/1 |
| l3leaf | DC3-LEAF3 | Ethernet50/1 | spine | DC3-SPINE2 | Ethernet3/1 |
| l3leaf | DC3-LEAF3 | Ethernet55/1 | mlag_peer | DC3-LEAF4 | Ethernet55/1 |
| l3leaf | DC3-LEAF3 | Ethernet56/1 | mlag_peer | DC3-LEAF4 | Ethernet56/1 |
| l3leaf | DC3-LEAF4 | Ethernet49/1 | spine | DC3-SPINE1 | Ethernet4/1 |
| l3leaf | DC3-LEAF4 | Ethernet50/1 | spine | DC3-SPINE2 | Ethernet4/1 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 10.3.0.0/22 | 1024 | 24 | 2.35 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| DC3-BORDER1 | Ethernet49/1 | 10.3.0.41/31 | DC3-SPINE1 | Ethernet7/1 | 10.3.0.40/31 |
| DC3-BORDER1 | Ethernet50/1 | 10.3.0.43/31 | DC3-SPINE2 | Ethernet7/1 | 10.3.0.42/31 |
| DC3-BORDER2 | Ethernet49/1 | 10.3.0.45/31 | DC3-SPINE1 | Ethernet8/1 | 10.3.0.44/31 |
| DC3-BORDER2 | Ethernet50/1 | 10.3.0.47/31 | DC3-SPINE2 | Ethernet8/1 | 10.3.0.46/31 |
| DC3-LEAF1 | Ethernet49/1 | 10.3.0.49/31 | DC3-SPINE1 | Ethernet1/1 | 10.3.0.48/31 |
| DC3-LEAF1 | Ethernet50/1 | 10.3.0.51/31 | DC3-SPINE2 | Ethernet1/1 | 10.3.0.50/31 |
| DC3-LEAF2 | Ethernet49/1 | 10.3.0.53/31 | DC3-SPINE1 | Ethernet2/1 | 10.3.0.52/31 |
| DC3-LEAF2 | Ethernet50/1 | 10.3.0.55/31 | DC3-SPINE2 | Ethernet2/1 | 10.3.0.54/31 |
| DC3-LEAF3 | Ethernet49/1 | 10.3.0.57/31 | DC3-SPINE1 | Ethernet3/1 | 10.3.0.56/31 |
| DC3-LEAF3 | Ethernet50/1 | 10.3.0.59/31 | DC3-SPINE2 | Ethernet3/1 | 10.3.0.58/31 |
| DC3-LEAF4 | Ethernet49/1 | 10.3.0.61/31 | DC3-SPINE1 | Ethernet4/1 | 10.3.0.60/31 |
| DC3-LEAF4 | Ethernet50/1 | 10.3.0.63/31 | DC3-SPINE2 | Ethernet4/1 | 10.3.0.62/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 10.3.100.0/24 | 256 | 2 | 0.79 % |
| 10.3.101.0/24 | 256 | 6 | 2.35 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| POD1 | DC3-BORDER1 | 10.3.101.11/32 |
| POD1 | DC3-BORDER2 | 10.3.101.12/32 |
| POD1 | DC3-LEAF1 | 10.3.101.13/32 |
| POD1 | DC3-LEAF2 | 10.3.101.14/32 |
| POD1 | DC3-LEAF3 | 10.3.101.15/32 |
| POD1 | DC3-LEAF4 | 10.3.101.16/32 |
| DC3 | DC3-SPINE1 | 10.3.100.1/32 |
| DC3 | DC3-SPINE2 | 10.3.100.2/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 10.3.102.0/24 | 256 | 6 | 2.35 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| POD1 | DC3-BORDER1 | 10.3.102.11/32 |
| POD1 | DC3-BORDER2 | 10.3.102.11/32 |
| POD1 | DC3-LEAF1 | 10.3.102.13/32 |
| POD1 | DC3-LEAF2 | 10.3.102.13/32 |
| POD1 | DC3-LEAF3 | 10.3.102.15/32 |
| POD1 | DC3-LEAF4 | 10.3.102.15/32 |
