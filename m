Return-Path: reuben.m.work@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc8799be
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 17:07:03 +0000 (UTC)
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
 [209.85.223.178])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1648fe25
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 17:07:03 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id h134so10987518iof.2
 for <wireguard@lists.zx2c4.com>; Thu, 29 Jun 2017 10:23:50 -0700 (PDT)
Return-Path: <reuben.m.work@gmail.com>
From: Reuben Martin <reuben.m.work@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: snapshot 0.0.20170628 broken?
Date: Thu, 29 Jun 2017 12:23:47 -0500
Message-ID: <11270853.baYkeXQ1L7@travesty>
In-Reply-To: <CAHmME9pSFOcn5DW5JLrfH_QMqUrq1+cJ8OmiMv_NLq6WHEVtGw@mail.gmail.com>
References: <2918068.8WQJdSgOSh@travesty>
 <CAHmME9pSFOcn5DW5JLrfH_QMqUrq1+cJ8OmiMv_NLq6WHEVtGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thursday, June 29, 2017 11:39:33 AM CDT Jason A. Donenfeld wrote:
> Hey Reuben,
>=20
> I'm unable to reproduce these results. How sure are you about this
> situation? Have you tried to reproduce more than once? What are you
> using to configure the peers?
>=20
> Jason

Yes, I can consistantly reproduce when I move all 3 computers to the newer
snapshot. This is Gentoo system using (gasp) systemd. I configure the peers
using the wg-quick@wg0 service unit. I use a post-up and pre-down in the
config to setup a vxlan overlayed on top of the VPN connections, but I don=
=E2=80=99t
think that should matter since this is just using the wg0 interface directl=
y. I
can provide that setup info if you think it might be relevant.

tshark capture of a simple wget from the computer that can=E2=80=99t connec=
t.


    5 7.615139647 192.168.100.12 =E2=86=92 192.168.100.1 TCP 60 54134 =E2=
=86=92 80 [SYN] Seq=3D0 Win=3D27600 Len=3D0 MSS=3D1380 SACK_PERM=3D1 TSval=
=3D3852526353 TSecr=3D0 WS=3D128
    6 7.684940917 192.168.100.1 =E2=86=92 192.168.100.12 TCP 60 80 =E2=86=
=92 54134 [SYN, ACK] Seq=3D0 Ack=3D1 Win=3D27360 Len=3D0 MSS=3D1380 SACK_PE=
RM=3D1 TSval=3D3308550712 TSecr=3D3852526353 WS=3D128
    7 7.684956294 192.168.100.12 =E2=86=92 192.168.100.1 TCP 52 54134 =E2=
=86=92 80 [ACK] Seq=3D1 Ack=3D1 Win=3D27648 Len=3D0 TSval=3D3852526423 TSec=
r=3D3308550712
    8 7.685008715 192.168.100.12 =E2=86=92 192.168.100.1 HTTP 202 GET /inde=
x.html HTTP/1.1=20
    9 7.754723388 192.168.100.1 =E2=86=92 192.168.100.12 TCP 52 80 =E2=86=
=92 54134 [ACK] Seq=3D1 Ack=3D151 Win=3D28544 Len=3D0 TSval=3D3308550782 TS=
ecr=3D3852526423
   10 7.998440304 a6:67:de:b7:51:27 =E2=86=92 Spanning-tree-(for-bridges)_0=
0 STP 88 Conf. Root =3D 0/0/8a:46:93:88:40:8b  Cost =3D 0  Port =3D 0x8003
   11 9.982462221 a6:67:de:b7:51:27 =E2=86=92 Spanning-tree-(for-bridges)_0=
0 STP 88 Conf. Root =3D 0/0/8a:46:93:88:40:8b  Cost =3D 0  Port =3D 0x8003
   12 10.321889091 192.168.100.12 =E2=86=92 192.168.100.1 TCP 52 54134 =E2=
=86=92 80 [FIN, ACK] Seq=3D151 Ack=3D1 Win=3D27648 Len=3D0 TSval=3D38525290=
60 TSecr=3D3308550782
   13 10.392081110 192.168.100.1 =E2=86=92 192.168.100.12 TCP 52 [TCP Previ=
ous segment not captured] 80 =E2=86=92 54134 [FIN, ACK] Seq=3D1010 Ack=3D15=
2 Win=3D28544 Len=3D0 TSval=3D3308553420 TSecr=3D3852529060
   14 10.392097109 192.168.100.12 =E2=86=92 192.168.100.1 TCP 40 54134 =E2=
=86=92 80 [RST] Seq=3D152 Win=3D0 Len=3D0


=2DReuben
