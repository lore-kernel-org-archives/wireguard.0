Return-Path: tim@sedlmeyer.us
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80acb62c
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 15:41:00 +0000 (UTC)
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
 [209.85.223.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb81a6e3
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 15:40:59 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id a7-v6so2994991ioc.12
 for <wireguard@lists.zx2c4.com>; Wed, 18 Apr 2018 08:55:47 -0700 (PDT)
Return-Path: <tim@sedlmeyer.us>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com.
 [209.85.214.47])
 by smtp.gmail.com with ESMTPSA id r66-v6sm936238itc.12.2018.04.18.08.55.46
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Apr 2018 08:55:46 -0700 (PDT)
Sender: Timothy Sedlmeyer <tim@sedlmeyer.us>
Received: by mail-it0-f47.google.com with SMTP id n81-v6so3048163ita.1
 for <wireguard@lists.zx2c4.com>; Wed, 18 Apr 2018 08:55:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <24602785.LeAoNilrza@aoi.marionegri.it>
References: <24602785.LeAoNilrza@aoi.marionegri.it>
From: Tim Sedlmeyer <tim@sedlmeyer.org>
Date: Wed, 18 Apr 2018 11:55:45 -0400
Message-ID: <CAK_h9uELREbrKdphB_oQNTNpQDGgucr4HZ6-RLqM-DKwJV73bg@mail.gmail.com>
Subject: Re: [HACK] UDP tunneling over TCP for WireGuard
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I have done similar in the past using socat but found I got better
reliability and performance by running ppp over pseudo ttys created
using socat and then having wireguard use the ppp interfaces for their
traffic. An example of the socat and ppp configuration:

On the server side:
socat pty,link=/dev/ttyp10,raw,echo=0 TCP4-LISTEN:587,reuseaddr
sudo pppd noauth /dev/ttyp10 10.10.50.10:10.10.60.10

On the client side:
sudo socat pty,link=/dev/ttyp10,raw,echo=0 TCP4:server_address:587,reuseaddr
sudo pppd noauth /dev/ttyp10 10.10.60.10:10.10.50.10



On Wed, Apr 18, 2018 at 7:55 AM, Luca Beltrame <lbeltrame@kde.org> wrote:
> Hello,
>
> at one of the places I use WireGuard, outgoing UDP is *completely* blocked by
> the perimeter firewall. In addition, only a handful of ports are open. (Not
> that this has helped security in any way, but I digress)
>
> This meant that I could not connect to my WireGuard-using OpenWRT router which
> is somewhere else.
>
> As a happy WireGuard user, I thought about how to handle this. Port was an
> easy solution: 587 is open, so I could just have the router redirect it to the
> actual endpoint port. UDP, not so much.
>
> What came out was a horrid hack involving socat and sacrifices to the Great
> Old Ones, but that it worked enough for me.
>
> tl;dr: Use socat to tunnel local UDP port via TCP to a remote port, then
> redirect UDP there to the actual WireGuard endpoint port.
>
> First of all, I set a systemd unit to have this running continuously:
>
> [Unit]
> Description=UDP over TCP forwarder
> After=autossh@tsugumi.service
>
> [Service]
> ExecStart=/usr/bin/socat -t600 -T600 -d -d UDP4-LISTEN:51821 tcp4:ENDPOINT_IP:
> 587
> User=nobody
> Group=nobody
> Restart=always
> ProtectSystem=full
> ProtectHome=true
> PrivateTmp=true
>
> [Install]
> WantedBy=multi-user.target
>
> I set fairly high timeouts because WireGuard is not very chatty and socat
> usually exists when there's no traffic for a while.
>
> Then, I set the relevant bits in wg0.conf:
>
> [Interface]
> ListenPort = 51820
> PrivateKey =<redacted>
> Address = 10.64.0.4/32
> MTU=1280
>
> [Peer]
> PublicKey = <redacted>
> AllowedIPs = 10.64.0.1/32,<internal router LAN IP range>
> Endpoint = 127.0.0.1:51821
> PersistentKeepalive = 60
>
> As you notice, it goes to localhost then it's pushed via TCP to the remote
> endpoint. At this time, I had to lower the MTU to adjust for overhead (as
> discussed on IRC) that I introduced with this monstrosity.
>
> On the remote side, I have (running through openWRT's init):
>
> /usr/bin/socat -d -d tcp4-listen:587,reuseaddr,fork UDP4:127.0.0.1:51820
>
> which brings packets back to port 51820, where wg is listening.
>
> And voila', it works:
>
> interface: wg0
>   public key: <redacted>
>   private key: (hidden)
>   listening port: 51820
>
> peer: <redacted>
>   endpoint: 127.0.0.1:51821
>   allowed ips:  10.64.0.1/32, <LAN>
>   latest handshake: 30 seconds ago
>   transfer: 300.68 MiB received, 175.78 MiB sent
>   persistent keepalive: every 1 minute
>
> Very hacky, but gets the job done. Any suggestions on how to make it better?
>
> --
> Luca Beltrame - KDE Forums team
> KDE Science supporter
> GPG key ID: A29D259B
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
