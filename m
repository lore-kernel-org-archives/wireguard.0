Return-Path: lbeltrame@kde.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce2ace44
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 11:40:54 +0000 (UTC)
Received: from tsugumi.dennogumi.org (tsugumi.dennogumi.org [5.9.18.77])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5ab1fb1
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 11:40:54 +0000 (UTC)
Sender: einar@heavensinferno.net
From: Luca Beltrame <lbeltrame@kde.org>
To: wireguard@lists.zx2c4.com
Subject: [HACK] UDP tunneling over TCP for WireGuard
Date: Wed, 18 Apr 2018 13:55:33 +0200
Message-ID: <24602785.LeAoNilrza@aoi.marionegri.it>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1912177.Pb6u6yzub0";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--nextPart1912177.Pb6u6yzub0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="iso-8859-15"

Hello,

at one of the places I use WireGuard, outgoing UDP is *completely* blocked by 
the perimeter firewall. In addition, only a handful of ports are open. (Not 
that this has helped security in any way, but I digress)

This meant that I could not connect to my WireGuard-using OpenWRT router which 
is somewhere else. 

As a happy WireGuard user, I thought about how to handle this. Port was an 
easy solution: 587 is open, so I could just have the router redirect it to the 
actual endpoint port. UDP, not so much.

What came out was a horrid hack involving socat and sacrifices to the Great 
Old Ones, but that it worked enough for me.

tl;dr: Use socat to tunnel local UDP port via TCP to a remote port, then 
redirect UDP there to the actual WireGuard endpoint port.

First of all, I set a systemd unit to have this running continuously:

[Unit]
Description=UDP over TCP forwarder
After=autossh@tsugumi.service

[Service]
ExecStart=/usr/bin/socat -t600 -T600 -d -d UDP4-LISTEN:51821 tcp4:ENDPOINT_IP:
587
User=nobody
Group=nobody
Restart=always
ProtectSystem=full
ProtectHome=true
PrivateTmp=true

[Install]
WantedBy=multi-user.target

I set fairly high timeouts because WireGuard is not very chatty and socat 
usually exists when there's no traffic for a while.

Then, I set the relevant bits in wg0.conf:

[Interface]
ListenPort = 51820
PrivateKey =<redacted>
Address = 10.64.0.4/32
MTU=1280

[Peer]
PublicKey = <redacted>
AllowedIPs = 10.64.0.1/32,<internal router LAN IP range>
Endpoint = 127.0.0.1:51821
PersistentKeepalive = 60

As you notice, it goes to localhost then it's pushed via TCP to the remote 
endpoint. At this time, I had to lower the MTU to adjust for overhead (as 
discussed on IRC) that I introduced with this monstrosity. 

On the remote side, I have (running through openWRT's init):

/usr/bin/socat -d -d tcp4-listen:587,reuseaddr,fork UDP4:127.0.0.1:51820

which brings packets back to port 51820, where wg is listening.

And voila', it works:

interface: wg0
  public key: <redacted>
  private key: (hidden)
  listening port: 51820

peer: <redacted>
  endpoint: 127.0.0.1:51821
  allowed ips:  10.64.0.1/32, <LAN>
  latest handshake: 30 seconds ago
  transfer: 300.68 MiB received, 175.78 MiB sent
  persistent keepalive: every 1 minute

Very hacky, but gets the job done. Any suggestions on how to make it better?

-- 
Luca Beltrame - KDE Forums team
KDE Science supporter
GPG key ID: A29D259B
--nextPart1912177.Pb6u6yzub0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEkxcLGs5Ymg3lt6kxjfYx/QIdsMUFAlrXMjUACgkQjfYx/QId
sMXAOgf+MBj7/gS/ETWhHnNEgAp0NJHjhdqdXdJsgJeZ/yQz5cBAa7iIjPSiGIB0
Z2y2nO+SWLZmCruEkJ9BWV+dsvIx393PPlY4x6BwpTqZcvkFbWmv/VX+nmHgWms4
xIMD+wjT/ikosPnIh4GXguWe/6C4z5sRpeVmnGKzTjQCiPEkXycnc4e0Kgnq3T+y
2rEddoBAZknh/SojXyVb+64UKia24TWMZ33txtgZCnDmdaroGh+SaFfE/a7qX3EC
rb5qJoRJyHxMB2MK6a3cdTkAfoPkAU++8tADGY5jafGEKrl7S1wKMVqYPCZ2RUsa
XPsLpd1locxiflOCzqFWeslmPZTuag==
=MWNW
-----END PGP SIGNATURE-----

--nextPart1912177.Pb6u6yzub0--
