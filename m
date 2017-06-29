Return-Path: admin@hda.me
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8283e9ca
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 17:45:34 +0000 (UTC)
Received: from sender-of-o52.zoho.com (sender-of-o52.zoho.com [135.84.80.217])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9be81b4
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 17:45:34 +0000 (UTC)
Date: Thu, 29 Jun 2017 20:02:15 +0200
From: HDA <admin@hda.me>
To: <wireguard@lists.zx2c4.com>,  <reuben.m.work@gmail.com>
Message-ID: <15cf5049001.efa4dc9c195686.3384309935944529785@hda.me>
Subject: Re: snapshot 0.0.20170628 broken?
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


Just to be sure, you can replace wg-quick for 0.0.20170628 with 0.0.2017061=
3  wg-quick version from https://git.zx2c4.com/WireGuard/tree/src/tools/wg-=
quick.bash?h=3D0.0.20170613 and try it out.
On Thu, Jun 29, 2017, at 17:23, Reuben Martin wrote:
> On Thursday, June 29, 2017 11:39:33 AM CDT Jason A. Donenfeld wrote:
> > Hey Reuben,
> >=20
> > I'm unable to reproduce these results. How sure are you about this
> > situation? Have you tried to reproduce more than once? What are you
> > using to configure the peers?
> >=20
> > Jason
>=20
> Yes, I can consistantly reproduce when I move all 3 computers to the
> newer
> snapshot. This is Gentoo system using (gasp) systemd. I configure the
> peers
> using the wg-quick@wg0 service unit. I use a post-up and pre-down in the
> config to setup a vxlan overlayed on top of the VPN connections, but I
> don=E2=80=99t
> think that should matter since this is just using the wg0 interface
> directly. I
> can provide that setup info if you think it might be relevant.
>=20
> tshark capture of a simple wget from the computer that can=E2=80=99t conn=
ect.
>=20
>=20
>     5 7.615139647 192.168.100.12 =E2=86=92 192.168.100.1 TCP 60 54134 =E2=
=86=92 80 [SYN]
>     Seq=3D0 Win=3D27600 Len=3D0 MSS=3D1380 SACK_PERM=3D1 TSval=3D38525263=
53 TSecr=3D0
>     WS=3D128
>     6 7.684940917 192.168.100.1 =E2=86=92 192.168.100.12 TCP 60 80 =E2=86=
=92 54134 [SYN,
>     ACK] Seq=3D0 Ack=3D1 Win=3D27360 Len=3D0 MSS=3D1380 SACK_PERM=3D1
>     TSval=3D3308550712 TSecr=3D3852526353 WS=3D128
>     7 7.684956294 192.168.100.12 =E2=86=92 192.168.100.1 TCP 52 54134 =E2=
=86=92 80 [ACK]
>     Seq=3D1 Ack=3D1 Win=3D27648 Len=3D0 TSval=3D3852526423 TSecr=3D330855=
0712
>     8 7.685008715 192.168.100.12 =E2=86=92 192.168.100.1 HTTP 202 GET /in=
dex.html
>     HTTP/1.1=20
>     9 7.754723388 192.168.100.1 =E2=86=92 192.168.100.12 TCP 52 80 =E2=86=
=92 54134 [ACK]
>     Seq=3D1 Ack=3D151 Win=3D28544 Len=3D0 TSval=3D3308550782 TSecr=3D3852=
526423
>    10 7.998440304 a6:67:de:b7:51:27 =E2=86=92 Spanning-tree-(for-bridges)=
_00 STP
>    88 Conf. Root =3D 0/0/8a:46:93:88:40:8b  Cost =3D 0  Port =3D 0x8003
>    11 9.982462221 a6:67:de:b7:51:27 =E2=86=92 Spanning-tree-(for-bridges)=
_00 STP
>    88 Conf. Root =3D 0/0/8a:46:93:88:40:8b  Cost =3D 0  Port =3D 0x8003
>    12 10.321889091 192.168.100.12 =E2=86=92 192.168.100.1 TCP 52 54134 =
=E2=86=92 80 [FIN,
>    ACK] Seq=3D151 Ack=3D1 Win=3D27648 Len=3D0 TSval=3D3852529060 TSecr=3D=
3308550782
>    13 10.392081110 192.168.100.1 =E2=86=92 192.168.100.12 TCP 52 [TCP Pre=
vious
>    segment not captured] 80 =E2=86=92 54134 [FIN, ACK] Seq=3D1010 Ack=3D1=
52 Win=3D28544
>    Len=3D0 TSval=3D3308553420 TSecr=3D3852529060
>    14 10.392097109 192.168.100.12 =E2=86=92 192.168.100.1 TCP 40 54134 =
=E2=86=92 80 [RST]
>    Seq=3D152 Win=3D0 Len=3D0
>=20
>=20
> -Reuben
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
