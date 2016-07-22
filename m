Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id fc1a9481
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 18:05:22 +0000 (UTC)
Date: Fri, 22 Jul 2016 13:05:27 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160722180527.GA14911@wolff.to>
References: <20160721205742.GA10312@wolff.to>
 <20160722081821.GA11505@lud.polynome.dn42>
 <20160722090913.GA8383@wolff.to>
 <20160722093211.GA12311@lud.polynome.dn42>
 <20160722113212.GA17578@wolff.to>
 <CAHmME9rX828zTOjCvcHAQgNxofmDxU0WpZcgqPTTMX2v-ZKmgA@mail.gmail.com>
 <20160722151458.GA14212@wolff.to>
 <CAHmME9oDAbN=OW8oLERFJQUnhKua_dSvSBVKz9139ORhEWOU8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9oDAbN=OW8oLERFJQUnhKua_dSvSBVKz9139ORhEWOU8g@mail.gmail.com>
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

On Fri, Jul 22, 2016 at 17:30:37 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
>$ ip rule add to 1.2.3.4 lookup main pref 30
>$ ip rule add to all lookup 80 pref 40
>$ ip route add default dev wg0 table 80
>
>
>This thread might interest you:
>http://marc.info/?l=linux-netdev&m=145452157719655&w=2

While this doesn't cover the general case, what I found usable was 
after checking for packets to the proxy, suppressing the default route when 
searching the main table and letting stuff that matches a narrower route go 
through directly. And then left over stuff goes to the tunnel via a 
default route in the extra routing table.

So for a real example that appears to be working, my systemd service file 
is below. 98.103.208.27 and 192.168.1.2 are bith the same machine. I need 
to include both because replies from 98.103.208.27 on my local network 
sometimes have a source address of 192.168.1.2. Most people won't have 
that issue.
There is extra cleanup commands so the service can be restarted without 
accumalating extra rules or routing table entries.
It seems to work now, but I had been fooled previously by cached router 
information.
The main thing of interest at this point in the thread is:
ip rule add suppress_prefixlength 0 lookup main priority 102

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
ExecStart=/usr/sbin/ip rule add to 98.103.208.27/32 lookup main priority 100
ExecStart=/usr/sbin/ip rule add to 192.168.1.2/32 lookup main priority 101
ExecStart=/usr/sbin/ip rule add suppress_prefixlength 0 lookup main priority 102
ExecStart=/usr/sbin/ip rule add from all lookup 200 priority 103
ExecStopPost=/usr/sbin/ip link del dev wg0
ExecStopPost=/usr/sbin/ip rule flush
ExecStopPost=/usr/sbin/ip rule add from all lookup default priority 32767
ExecStopPost=/usr/sbin/ip rule add from all lookup main priority 32766
ExecStopPost=/usr/sbin/ip route flush table 200

[Install]
WantedBy=multi-user.target
