Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 81cfb1b6
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jul 2016 16:35:32 +0000 (UTC)
Date: Sat, 23 Jul 2016 11:36:37 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160723163637.GA3426@wolff.to>
References: <20160721205742.GA10312@wolff.to>
 <20160722081821.GA11505@lud.polynome.dn42>
 <20160722090913.GA8383@wolff.to>
 <20160722093211.GA12311@lud.polynome.dn42>
 <20160722113212.GA17578@wolff.to>
 <CAHmME9rX828zTOjCvcHAQgNxofmDxU0WpZcgqPTTMX2v-ZKmgA@mail.gmail.com>
 <20160722151458.GA14212@wolff.to>
 <CAHmME9oDAbN=OW8oLERFJQUnhKua_dSvSBVKz9139ORhEWOU8g@mail.gmail.com>
 <20160722180527.GA14911@wolff.to>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
In-Reply-To: <20160722180527.GA14911@wolff.to>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Using wireguard link as a proxy?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Jul 22, 2016 at 13:05:27 -0500,
  Bruno Wolff III <bruno@wolff.to> wrote:
>
>So for a real example that appears to be working, my systemd service 

I had another issue and that is the proxy server was used for some 
other services and I didn't want to connect to those from outside the 
tunnel. So I wanted some traffic to the proxy server to go direct and 
some to go through the tunnel. This involves marking packets. But the 
guessed source addresses don't use the marks, so you need to rewrite 
(SNAT) the source address for some of the outgoing packets. If you 
want static rules to do this you need to have the incorrect guesses 
be to use normal routing and then rewrite the source address for 
packets going over the tunnel. As the tunnel address is fixed, but 
the normal gateway address will change when moving between networks or 
possibly when dhcp leases expire.
The explanations for marking and policy routing aren't explicit about 
how you need to handle the source address issue and why it happens, though 
there are lots of mentions that there are problems related to the source 
address.
Another gotcha is that ip rule can't negate a test for fwmark and testing 
for fwmark equal to zero is a flag not to test it at all. So you need to 
do more complicated packet marking.
I'm attaching the real systemd service file (with the routing policy 
commands and other wireguard setup) and the iptables information.

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="wireguard.service"

[Unit]
Description=WireGuard Server

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=-/usr/sbin/ip link del dev wg0
ExecStart=/usr/sbin/ip rule flush
ExecStart=/usr/sbin/ip rule add from all lookup default priority 32767
ExecStart=/usr/sbin/ip rule add from all lookup main priority 32766
ExecStart=/usr/sbin/ip route flush table 200
ExecStart=/usr/sbin/ip link add dev wg0 type wireguard
ExecStart=/usr/sbin/ip address add dev wg0 192.168.7.3 peer 192.168.7.1/32
ExecStart=/usr/bin/wg setconf wg0 /etc/wireguard/config
ExecStart=/usr/sbin/ip link set up dev wg0
ExecStart=/usr/sbin/ip route add default dev wg0 table 200
ExecStart=/usr/sbin/ip rule add suppress_prefixlength 0 lookup main priority 101
ExecStart=/usr/sbin/ip rule add fwmark 2 lookup 200 priority 102
ExecStart=/usr/sbin/ip route flush cache
ExecStopPost=/usr/sbin/ip link del dev wg0
ExecStopPost=/usr/sbin/ip rule flush
ExecStopPost=/usr/sbin/ip rule add from all lookup default priority 32767
ExecStopPost=/usr/sbin/ip rule add from all lookup main priority 32766
ExecStopPost=/usr/sbin/ip route flush table 200
ExecStopPost=/usr/sbin/ip route flush cache

[Install]
WantedBy=multi-user.target

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=iptables

*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING ! -s 192.168.7.3/32 -o wg0 -j SNAT --to-source 192.168.7.3
COMMIT
*mangle
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A OUTPUT -j MARK --set-xmark 0x2/0xffffffff
-A OUTPUT -d 98.103.208.27 -p udp -m udp --dport 992 -j MARK --set-xmark 0x1/0xffffffff
-A OUTPUT -d 192.168.1.2 -p udp -m udp --dport 992 -j MARK --set-xmark 0x1/0xffffffff
COMMIT
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -i lo -j ACCEPT
-A INPUT -i wg0 -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type any -j ACCEPT
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -s 98.103.208.24/29 -p tcp -m conntrack --ctstate NEW -m tcp --dport 22 -j ACCEPT
-A INPUT -p udp -m conntrack --ctstate NEW -m udp --dport 992 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT

--EVF5PPMfhYS0aIcm--
