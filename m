Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 700d6f08
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 08:16:23 +0000 (UTC)
Date: Fri, 22 Jul 2016 10:18:21 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Bruno Wolff III <bruno@wolff.to>
Message-ID: <20160722081821.GA11505@lud.polynome.dn42>
References: <20160721205742.GA10312@wolff.to>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
In-Reply-To: <20160721205742.GA10312@wolff.to>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] Using wireguard link as a proxy?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 21, 2016 at 03:57:42PM -0500, Bruno Wolff III wrote:
> I am trying to test using a wireguard link as a proxy and I am having
> trouble. On the source machine I am trying to route packets through wg0
> using a routing entry that has the remote end point tunnel address on a v=
ia
> command. The idea is to have the packets sent through the tunnel and then=
 to
> do source nat on the remote side of the tunnel. The packets go to the
> interface, but do not come out the other end. Ping reports:
> From 192.168.7.2 icmp_seq=3D69 Destination Host Unreachable
> ping: sendmsg: Required key not available
>=20
> So I think the destination address in the packet is being used to find the
> tunnel key to use rather than the immediate next destination for the pack=
et.

Yes, the notion of "immediate next destinaton" does not make sense for
Wireguard.  It encapsulates plain IP, not Ethernet.

> Has anyone else played with something like this an gotten it to work?
>=20
> Some info on what I was trying:
> ip route
> default via 129.89.248.129 dev em1  proto static  metric 100
> 98.103.208.26 via 192.168.7.1 dev wg0

The "via 192.168.7.1" doesn't really make sense, because a wireguard
interface is a layer-3 device, not an Ethernet device.  You can include it
but the kernel will just ignore that part, so the route above is equivalent=
 to:

  98.103.208.26 dev wg0

> 129.89.248.128/27 dev em1  proto kernel  scope link src 129.89.248.147 me=
tric 100
> 192.168.7.1 dev wg0  proto kernel  scope link src 192.168.7.2
>=20
> wg source machine
>  endpoint: 98.103.208.27:992
>  allowed ips: 192.168.7.1/32

You need "allowed ips 0.0.0.0/0" here.  Your situation is just a regular
client/server tunneling setup, there's nothing special about "proxying",
whatever that means.

Basically, you want your client to be able to reach the whole Internet via
the wireguard interface, so any destination IP address should be routed
through the server (and conversely, any source IP address should be
allowed from the server).

> wg proxy machine
>  endpoint: 129.89.248.147:992
>  allowed ips: 192.168.7.2/32
>=20
> tcpdump output from wg0
> 15:54:34.129798 IP 192.168.7.2 > 98.103.208.26: ICMP echo request, id 253=
71, seq 1, length 64

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXkdbEAAoJEL4B7CKgTi5G6YgP/2GnFEeRkKKN5qAHnjXU9y37
juiGj57wGfwbh6ps0zgTcVTVRCQDwIJVBUlIlj52xSL+ltuAjr0whnq1D4mbqv28
OBxyoAqpMGUr2yzHw977PkyxJ7RwsIM5kUXARBYVqZyKxOaKmJ85CHth6nm3A5Ov
0iJF5uyoLzuYhAOSMDbS/+6k/BCO5zhxjqei1bwtblViIqxK3PnVbuIfuTa3Ocmx
vi8QLJ8CqjVFAPBJGxbknsJ7DgTczW3+QQsls9p5l5cRGHiNefUP6EW8N67MZT8/
ruL5DqCU/zLmkOUVlXcfPwpEmo+ex7s9XQFIarVK9aHwmClQLJOH89FvnrRIJpgE
qVsaynXY3qmqKi8rZVmHJheswrxjpjKCrOkgj3gI5FY35mVAps6nVCVguiMBkf+U
J8uDLykjFLrHYSwL8/M4tlH2st8Pxhiv54FkxiUg+PTv8SM1kLdSN5X+ZbACpijc
+WkO3hSduUO2IjIHbRCum7xo3q9mW0rwUXWore/X9+OIX76fn8Lxv1QMBqj5WzNM
zcwS932reWQdGdY9oWN9kimY8yoNKAGiaO25tia2VJmSsc7z03kU6K/nc/vaaFv7
Yjpbpamd5Bmm3RDDWLWxZbzDw5JRGC2S4+3aHhl0akEGthr0aG8kbo/HP4u6fefS
F94em8FZMDlsVGcTEjXh
=/FBY
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
