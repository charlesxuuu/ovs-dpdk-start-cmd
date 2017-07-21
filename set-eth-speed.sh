#this is for limit sending rate on each interface
#however it cannot limit the speed of vm
sudo tc qdisc del dev enp5s0f0 root 
sudo tc qdisc del dev enp5s0f1 root 
# enable fair queueing (which is off by default)
# pace and shape bandwidth
sudo tc qdisc add dev enp5s0f0 root fq maxrate 4gbit
sudo tc qdisc add dev enp5s0f1 root fq maxrate 4gbit
