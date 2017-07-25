# This is for enable ECN labelling on tap device 
#
#
# used at receiver (iperf server) vm tap
# caveat:
# required to disable gro on physical interface, or kernel will drop pkt whose length is greater than MTU
# sudo ethtool -K enp5s0f0 gro off
# to check the feature:
# sudo ethtool -k enp5s0f0
# better to disable tso/gso/gro all together
#


for ((i=0; i<60; i++))
do
	sudo tc qdisc add dev tap$i root tbf rate 300mbit limit 1000k burst 1000k mtu 660000 peakrate 300mbit
done 
