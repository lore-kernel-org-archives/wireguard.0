Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b824ecd5
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 May 2017 17:01:17 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 416e7c25
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 May 2017 17:01:16 +0000 (UTC)
Received: from msi.defcon1 ([93.15.31.113]) by mail.gmx.com (mrgmx102
 [212.227.17.174]) with ESMTPSA (Nemesis) id 0Lf0M7-1djBQR0G23-00qhjg for
 <wireguard@lists.zx2c4.com>; Thu, 25 May 2017 19:13:40 +0200
Date: Thu, 25 May 2017 19:13:37 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: wireguard@lists.zx2c4.com
Subject: Re: Can't seem to split tunnel using tables the way I can in OpenVPN
Message-ID: <20170525191337.696cd9d5@msi.defcon1>
In-Reply-To: <CAL+S5MVFd9Z=70X67E69-XcEq7hO76UT6vmzLGj+0YS8vhfedA@mail.gmail.com>
References: <CAL+S5MVFd9Z=70X67E69-XcEq7hO76UT6vmzLGj+0YS8vhfedA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, 24 May 2017 19:04:38 -0400
Text Editor <texteditor.si@gmail.com> wrote:

> Trying to replicate my OpenVPN routing setup, tunnel is split to go
> to /24 subnet inside OpenVPN without the default traffic going through
> it.

Hi Text Editor,

=E2=80=A6
> I can ping the
> endpoints inside the Wireguard VPN,

So your WG VPN is acting good, giving you access your server from
another place than your LAN, ie: through a phone tethering or from
a friend's connection.

Your setup seems overly complicated, as touching network I/F confs isn't
a requirement, neither w/ OVPN or WG.

ie: for the server, I took a copy of /etc/init.d/rmnologin (because it
was the last one to be enabled into /etc/rc2.d and I want my VPN to be
the last one to be activated), then I modified it, testing and using the
presence of 'wg-quick' that is far more usable than modifying the
network I/F confs or manually use 'wg' instead; on clients, scripts are
manual, but also use 'wg-quick'.

A quick run of chkconfig and the links are created in the right places,
starting your VPN server at boot and allowing to start/stop it manually.

I won't say it is the best way to do that, but it has the advantage not
to scatter configurations in all the server corners.

> but trying to reach the internet
> via the internet seems to not work
>=20
>=20
>=20
> Configuration files on the Server side:
>=20
> https://pastebin.com/raw/TJvKazSL

IIRC, using 0.0.0.0 means _all_ traffic is routed through the VPN;
IMHO, your server setup should otherwise use something like:

[Peer]
=E2=80=A6
192.168.2.0/24
(/24 IF you intend to use WG to unite 2 LAN; for a roadwarrior, it
might be better to restrict more stricly to it's IP,
eg: 192.168.2.253/32)

> Configuration files on the Server side:
>=20
> https://pastebin.com/raw/2t760WvY
>=20
>=20
> This same concept works on OpenVPN without issue, not sure what is
> happening

AFAIK, given you formerly authorize packets forward (either indefinitely
into /etc/syctl.conf or temporarily by:
echo 1 >/proc/sys/net/ipv4/ip_forward), the only iptables rules you need
(into the server conf file) are:

PostUp =3D iptables -t nat -I POSTROUTING -s <VPN IP segment>/24
-o eth0 -j MASQUERADE

PostDown =3D iptables -t nat -D POSTROUTING -s <VPN IP segment>/24 -o
eth0 -j MASQUERADE

remember that any kind of testing on packets, ie: established, related,
etc) can be a huge loss of time (it has to be computed for _each_
packet), hence, a loss of throughput in your VPN.

And BTW, it is much more dangerous to reveal your keys on the Ternet
than your endpoint IP address=E2=80=A6

Jean-Yves
