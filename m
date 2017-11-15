Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa4a18ab
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 08:31:18 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id f1c72188
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 08:31:18 +0000 (UTC)
Date: Wed, 15 Nov 2017 02:34:23 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Road Warrior config with fwmark
Message-ID: <20171115083423.GA11843@wolff.to>
References: <20171114163453.GA27547@wolff.to>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
In-Reply-To: <20171114163453.GA27547@wolff.to>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Nov 14, 2017 at 10:34:53 -0600,
  Bruno Wolff III <bruno@wolff.to> wrote:
>
>I have this working on my laptop, but I want to tweak my router so 
>that I don't need to have special iptables rules on my home network.

I got this fixed so I'll attach /etc/sysconfig/iptables and 
/etc/systemd/system/wireguard.service that make things work.

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=iptables

# If our addresses are used by the local network, the wrong source
# address will be used for packets that initially (before marking)
# look like they should go out the local gateway will get the wrong
# source address. So we need to be prepared to rewrite it to make things
# work.
*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING ! -s 98.103.208.29/32 -o wg0 -j SNAT --to-source 98.103.208.29
COMMIT
*filter
:INPUT ACCEPT [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -i lo -j ACCEPT
-A INPUT -i wg0 -p icmp -m icmp --icmp-type any -j ACCEPT
-A INPUT -s 98.103.208.26 -p icmp -m icmp --icmp-type any -j ACCEPT
-A INPUT -i wg0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -s 98.103.208.24/29 -i wg0 -p tcp -m conntrack --ctstate NEW -m tcp --dport 22 -j ACCEPT
-A INPUT -s 129.89.240.0/24 -i wg0 -p tcp -m conntrack --ctstate NEW -m tcp --dport 22 -j ACCEPT
-A INPUT -s 10.32.2.72/32 -i wg0 -p tcp -m conntrack --ctstate NEW -m tcp --dport 22 -j ACCEPT
-A INPUT -p udp -m udp -s 98.103.208.26 --dport 992 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-port-unreachable
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
-A OUTPUT -o lo -j ACCEPT
-A OUTPUT -o wg0 -j ACCEPT
-A OUTPUT -m mark --mark 0x1 -j ACCEPT
-A OUTPUT -j REJECT --reject-with icmp-port-unreachable
COMMIT

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="wireguard.service"

[Unit]
Description=WireGuard Server

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=-/usr/sbin/ip link del dev wg0
ExecStart=-/usr/sbin/ip rule del pref 100
ExecStart=/usr/sbin/ip link add dev wg0 type wireguard
ExecStart=/usr/bin/wg setconf wg0 /etc/wireguard/config
ExecStart=/usr/sbin/ip address add 98.103.208.29/32 dev wg0
ExecStart=/usr/sbin/ip link set up dev wg0
ExecStart=/usr/sbin/ip route add default dev wg0 src 98.103.208.29 table 100
ExecStart=/usr/sbin/ip rule add not fwmark 1 pref 100 table 100
ExecStopPost=/usr/sbin/ip link del dev wg0
ExecStopPost=/usr/sbin/ip rule del pref 100

[Install]
WantedBy=multi-user.target

--fUYQa+Pmc3FrFX/N--
