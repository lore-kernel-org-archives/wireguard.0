Return-Path: sorcus@inwebse.com
Received: from server.inwebse.org (static.118.237.9.5.clients.your-server.de
 [5.9.237.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a979fc22
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Aug 2016 15:55:21 +0000 (UTC)
Mime-Version: 1.0
Date: Fri, 19 Aug 2016 16:00:37 +0000
Content-Type: text/plain; charset="utf-8"
Message-ID: <890b834ba4e320e55889f2bcae74a020@mail.inwebse.com>
From: sorcus@inwebse.com
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <2c13c33b73f45d3bbdeee59b60d736de@mail.inwebse.com>
References: <2c13c33b73f45d3bbdeee59b60d736de@mail.inwebse.com>
 <CAHmME9pZmAi9tjOzZL178f3tM1MYCQZFR-VFR-bJd0S1FFMruA@mail.gmail.com>
 <acb454d0c202fc330d0a349aeee29256@mail.inwebse.com>
 <CAHmME9ozzYBLJ-0xMocFbWuHWCDsONuVqS_hQpVtWJtMKspd5g@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard doesn't work with network namespace on
 ArchLinux
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-------- Forwarded message -------=0AFrom: sorcus@inwebse.com=0ATo: "Jaso=
n A. Donenfeld" <Jason@zx2c4.com>=0ASent: August 19 2016 11:49 AM=0ASubje=
ct: Re: [WireGuard] WireGuard doesn't work with network namespace on Arch=
Linux=0AAugust 19 2016 8:54 AM, "Jason A. Donenfeld" <Jason@zx2c4.com> wr=
ote:=0A=0A>>> $ cat /etc/wireguard/client.conf=0A>>> [Interface]=0A>>> Pr=
ivateKey =3D OAT5r6E1hid***iVBnY=3D=0A> =0A> Never post any part of your =
private key to the internet. I advise you=0A> to change your keys now.=0A=
=0AOk, i understand.=0A=0A>>> ListenPort =3D 52345=0A>>> [Peer]=0A>>> Pub=
licKey =3D aMC3f6kw***UDQVwo=3D=0A>>> EndPoint =3D [2a01:4f8:***:***::5]:=
40111=0A>>> AllowedIPs =3D fc00::10/7=0A> =0A> Here's where you go wrong.=
 On the _client_ you want:=0A> AllowedIPs=3D::/0,0.0.0.0/0=0A> In other w=
ords, the client trusts the server to send data as any IP,=0A> and the cl=
ient will send any IP data to the server.=0A> =0A> The AllowedIPs you use=
 on the server should most likely be a /128 and=0A> a /32, however.=0A=0A=
There is no error anymore, but packets don't leave on the server.=0A=0AOu=
tput of tcpdump -i wg0 on client:=0AIP6 localhost > 2a00:1450:4010:c01::8=
a ICPMP6, echo request, seq 1, length 64=0AIP6 localhost > 2a00:1450:4010=
:c01::8a ICPMP6, echo request, seq 2, length 64=0AIP6 localhost > 2a00:14=
50:4010:c01::8a ICPMP6, echo request, seq 3, length 64=0A=0AOutput of ip =
netns exec physical tcpdump -t on client:=0AIP6 localhost.52345 > 2a01:4f=
8:***:***::5.40111: UDP, length 141=0AIP6 localhost.52345 > 2a01:4f8:***:=
***::5.40111: UDP, length 141=0AIP6 localhost.52345 > 2a01:4f8:***:***::5=
.40111: UDP, length 141=0A=0AOn server tcpdump doesn't catch any packets.=
 Maybe i need to set some rules with firewall=0A(iptables, nftables)?=0A=
=0AP.S. I apologize for silly questions.
