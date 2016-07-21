Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 9d7650fe
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jul 2016 20:57:35 +0000 (UTC)
Date: Thu, 21 Jul 2016 15:57:42 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Message-ID: <20160721205742.GA10312@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [WireGuard] Using wireguard link as a proxy?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I am trying to test using a wireguard link as a proxy and I am having trouble. 
On the source machine I am trying to route packets through wg0 using a 
routing entry that has the remote end point tunnel address on a via command. 
The idea is to have the packets sent through the tunnel and then to do 
source nat on the remote side of the tunnel. The packets go to the interface, 
but do not come out the other end. Ping reports:
>From 192.168.7.2 icmp_seq=69 Destination Host Unreachable
ping: sendmsg: Required key not available

So I think the destination address in the packet is being used to find the 
tunnel key to use rather than the immediate next destination for the packet.

Has anyone else played with something like this an gotten it to work? 

Some info on what I was trying:
ip route
default via 129.89.248.129 dev em1  proto static  metric 100 
98.103.208.26 via 192.168.7.1 dev wg0 
129.89.248.128/27 dev em1  proto kernel  scope link  src 129.89.248.147  metric 100 
192.168.7.1 dev wg0  proto kernel  scope link  src 192.168.7.2 

wg source machine
  endpoint: 98.103.208.27:992
  allowed ips: 192.168.7.1/32

wg proxy machine
  endpoint: 129.89.248.147:992
  allowed ips: 192.168.7.2/32

tcpdump output from wg0
15:54:34.129798 IP 192.168.7.2 > 98.103.208.26: ICMP echo request, id 25371, seq 1, length 64
