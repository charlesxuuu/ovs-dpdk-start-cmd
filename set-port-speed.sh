sudo ovs-vsctl clear Port enp5s0f0 qos
sudo ovs-vsctl clear Port enp5s0f1 qos
sudo ovs-vsctl -- set Port enp5s0f0 qos=@newqos -- --id=@newqos create QoS type=linux-htb other-config:max-rate=1000000000 queues=0=@q0 -- --id=@q0   create   Queue   other-config:min-rate=1000000000 other-config:max-rate=1000000000
sudo ovs-vsctl -- set Port enp5s0f1 qos=@newqos -- --id=@newqos create QoS type=linux-htb other-config:max-rate=1000000000 queues=0=@q0 -- --id=@q0   create   Queue   other-config:min-rate=1000000000 other-config:max-rate=1000000000

