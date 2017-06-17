Return-Path: pranesh@cis-india.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21aaf36e
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Jun 2017 04:11:21 +0000 (UTC)
Received: from smarthost1.greenhost.nl (smarthost1.greenhost.nl
 [195.190.28.81])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b047f90
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Jun 2017 04:11:21 +0000 (UTC)
Subject: Re: Trouble running a proxy VPN
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <3bd46519-ee20-8b1a-ca88-95b60bbc9e81@cis-india.org>
 <CAHmME9rRBxMvHMkGMRchDoDU1Ok7_J-nxCKydg6oo=3O+1b00g@mail.gmail.com>
From: Pranesh Prakash <pranesh@cis-india.org>
Message-ID: <8645b2da-6787-8b3a-737b-c3fbc8f7b6a2@cis-india.org>
Date: Sat, 17 Jun 2017 09:56:27 +0530
MIME-Version: 1.0
In-Reply-To: <CAHmME9rRBxMvHMkGMRchDoDU1Ok7_J-nxCKydg6oo=3O+1b00g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="r68vx8RfNRo32WkXkTquCPUdFdDSiXDOP"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--r68vx8RfNRo32WkXkTquCPUdFdDSiXDOP
Content-Type: multipart/mixed; boundary="BqdTRcpMSlIQaKJxSwdJxnxwEbRGwsG2J";
 protected-headers="v1"
From: Pranesh Prakash <pranesh@cis-india.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <8645b2da-6787-8b3a-737b-c3fbc8f7b6a2@cis-india.org>
Subject: Re: Trouble running a proxy VPN
References: <3bd46519-ee20-8b1a-ca88-95b60bbc9e81@cis-india.org>
 <CAHmME9rRBxMvHMkGMRchDoDU1Ok7_J-nxCKydg6oo=3O+1b00g@mail.gmail.com>
In-Reply-To: <CAHmME9rRBxMvHMkGMRchDoDU1Ok7_J-nxCKydg6oo=3O+1b00g@mail.gmail.com>

--BqdTRcpMSlIQaKJxSwdJxnxwEbRGwsG2J
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Jason A. Donenfeld <Jason@zx2c4.com> [2017-06-14 13:48:45 +0200]:
> Looks like maybe you forgot to enable IP forwarding and masquerading
> on the server.

This was exactly it.  Thanks for the help on the IRC as well.

I had forwarding configured for OpenVPN on a different IP range, but had =

to change it for WireGuard and the IP range I was using with it.

For future novices reading this thread, the things one has to do on a=20
*fresh* Ubuntu installation:

Step 1: Change /proc/sys/net/ipv4/ip_forward to allow IPv4 packets to be =

forwarded in this session:
$ sudo sysctl -w net.ipv4.ip_forward=3D1

Step 2: Change /etc/sysctl.conf to allow the forwarding of IPv4 packets=20
even after reboots:
$ sudo sed '/ip_forward/s/^# *//' /etc/sysctl.conf

Step 3: Enable masquerading for the IP range which is there in the=20
AcceptedIPs line on what is to act as the proxy server (ex: 10.10.10.0/24=
)
$ sudo iptables -t nat -A POSTROUTING -o <external interface> -s=20
10.10.10.0/24 -j MASQUERADE

=2E.. where <external interface> is something like eth0, enp0s25, wlan0, =

wlp3s0, etc., depending on which network interface is being used to=20
connect to the Internet.  You can do this by checking via:

$ ip route ls

Once you've done that, this should work

$ sudo wg-quick up <name>

Cheers,
Pranesh



--=20
Pranesh Prakash
Policy Director, Centre for Internet and Society
http://cis-india.org | tel:+91 80 40926283
sip:pranesh@ostel.co | xmpp:pranesh@cis-india.org
https://twitter.com/pranesh


--BqdTRcpMSlIQaKJxSwdJxnxwEbRGwsG2J--

--r68vx8RfNRo32WkXkTquCPUdFdDSiXDOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJZRK9zAAoJEE0qlBAVWSN1+ZIP/0Uz/dxlJF3Dz4ZUhh044QXS
IbTSJ8r96jja2XmlLQJj5FtVYEMcInUhWyEfnQJHXyVH21ZL+d5AStGCeG5i7aF3
FUBAgvPSrrH4q9SYIanTLWycV9O5Dzq9eC3qQfVZZePTkO0FHWLorfYz/MICTAx5
1WZD658gIJso+iz3EbH9qG7o1UXpoyK2elWAxDOxW/IDxb9KSLLG05HmEOdeQJ3S
CwsngrxNBiAH++2X9xGJi68OPluv1SQqx3cjk5BzPbD2cvpGarvGq0X2I/JgKhkE
krW8SsPt0cpde1e6UKh2PYu1s7MX9r6gERnqOY315VgS3N1/qcz66J8yyzmiP+WG
sc+G/1RkMwgAospwxmDho8nvdEw8YZMu+PKxzfrkzP8moY8DMDrKIzpGc7L6Cj+z
qiFdRxKCguYNznt9KSuJ8o8+4cxTTPDYkiTnkDT2lqG2x1G24TO8jyzmaNAYLr1R
PhdgCQJx6q5wkMVuA2+I6HdrkQ+30MaO53ikLFDROYr9m/L+EoskOXjxelE1t9H6
2wj6H4FEagDSEbzq8k5dTLErcKFHFS5osL7vmjV3UqrkxAp9abgrAoevyuCihVqT
IB8xhkWbO8BtgixXeN0py2AaD8inKMQyA9rgDpF/UOr6Vz4nhNzj0t/7d8q50yVa
dTPAIIssf4nokVmdhk8Q
=3yln
-----END PGP SIGNATURE-----

--r68vx8RfNRo32WkXkTquCPUdFdDSiXDOP--
