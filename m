Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MIME_HTML_MOSTLY,MIME_QP_LONG_LINE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587D6C35DE1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 13:09:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2561020CC7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 13:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2561020CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=libassi.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93d978d2;
	Tue, 25 Feb 2020 13:05:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21f07577
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 13:05:49 +0000 (UTC)
Received: from smtp2.outgoing.loopia.se (smtp2.outgoing.loopia.se
 [93.188.3.37])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b730ac57
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 13:05:49 +0000 (UTC)
Received: from s807.loopia.se (localhost [127.0.0.1])
 by s807.loopia.se (Postfix) with ESMTP id 5D94C2E43E4A
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 14:08:34 +0100 (CET)
Received: from s499.loopia.se (unknown [172.22.191.5])
 by s807.loopia.se (Postfix) with ESMTP id 3EAF42E27ADF;
 Tue, 25 Feb 2020 14:08:34 +0100 (CET)
Received: from s472.loopia.se (unknown [172.22.191.5])
 by s499.loopia.se (Postfix) with ESMTP id 39F7E1CDAF02;
 Tue, 25 Feb 2020 14:08:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s630.loopia.se ([172.22.191.5])
 by s472.loopia.se (s472.loopia.se [172.22.190.12]) (amavisd-new, port 10024)
 with UTF8LMTP id VTLuVodHVSCI; Tue, 25 Feb 2020 14:08:32 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: peter@libassi.se
X-Loopia-Originating-IP: IPv6:2a00:801:3cd:df4b:9505:d796:fd39:7746
Received: from [IPv6:2a00:801:3cd:df4b:9505:d796:fd39:7746] (unknown
 [IPv6:2a00:801:3cd:df4b:9505:d796:fd39:7746])
 (Authenticated sender: peter@libassi.se)
 by s630.loopia.se (Postfix) with ESMTPSA id B81CF13ABECC;
 Tue, 25 Feb 2020 14:08:31 +0100 (CET)
From: Peter Libassi <peter@libassi.se>
Mime-Version: 1.0 (1.0)
Date: Tue, 25 Feb 2020 14:08:30 +0100
Message-Id: <97422B13-B927-4D86-BB45-AC1E9FBD8E79@libassi.se>
References: <4c6af2b0-62bc-84bd-f1ec-ce11a152d348@gmail.com>
In-Reply-To: <4c6af2b0-62bc-84bd-f1ec-ce11a152d348@gmail.com>
Subject: Re: FreeBSD wireguard wg-quick remote IP address assignment is
 incorrect
To: Jan Novak <repcom@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailer: iPhone Mail (17D50)
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8697779894563161453=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============8697779894563161453==
Content-Type: multipart/alternative; boundary=Apple-Mail-23D62BF1-3634-4296-8017-ACC755F05135
Content-Transfer-Encoding: 7bit


--Apple-Mail-23D62BF1-3634-4296-8017-ACC755F05135
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


>> 25 feb. 2020 kl. 07:24 skrev Jan Novak <repcom@gmail.com>:
> =EF=BB=BFAm 25.02.20 um 07:07 schrieb Peter Libassi:
>>>> 23 feb. 2020 kl. 16:32 skrev Jason A. Donenfeld <Jason@zx2c4.com>:
>>> On Sun, Feb 23, 2020 at 2:25 PM Peter Libassi <peter@libassi.se> wrote:
>>>> Ok, Well even if using another local IP in range 127.0.0.0/8 we can=E2=80=
=99t be certain we will clash with something else.
>>>> How about adding a directive for the remote interface address in wg.con=
f? Like this:
>>>> # cat /usr/local/etc/wireguard/wg0.conf
>>>> [Interface]
>>>> PrivateKey =3D <->
>>>> ListenPort =3D 7777
>>>> Address =3D 192.168.2.1/32
>>>> RemoteAddress =3D 192.168.2.2
>>>> [Peer]
>>>> PublicKey =3D <->
>>>> AllowedIPs =3D 192.168.2.0/24
>>>> Endpoint =3D 172.16.0.23:7777
>>>> # diff /usr/local/bin/wg-quick.org ./wg-quick
>>>> 17a18
>>>>> REMOTE_ADDRESS=3D""
>>>> 86a88
>>>>> RemoteAddress) REMOTEADDRESS=3D"$value"; continue ;;
>>>> 175c177,181
>>>> < cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias
>>>> ---
>>>>>    if [[ -n $REMOTEADDRESS ]]; then
>>>>> cmd ifconfig "$INTERFACE" inet "$1" "$REMOTEADDRESS" alias
>>>>>    else
>>>>>                cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias
>>>>>    fi
>>> This is not a correct fix; we're not going to add a configuration nob
>>> to work around FreeBSD network stack gotchas.
>>> Rather, I'd prefer to see all the FreeBSD wg-quick semantics redone
>>> around multiple routing tables and marks, much like on Linux, though I
>>> don't know if that's possible. Barring that, a proper solution
>>> probably involves re-reading the ifconfig man page a few dozen times
>>> to find out how to have interface addresses as we need them.
>> It works perfectly for my single site-2-site use case. You have two optio=
ns as I see it. Either convince the FreeBSD team to drop the dest_address re=
quirement or implement local/remote address awareness per [Peer] in the wg-q=
uick script.
>=20
> Hi Peter,
>=20
> Can you show me an example for "... implement local/remote address awarene=
ss per [Peer] in the wg-quick script... "
>=20
>=20
> Bfo
>=20
>=20
>=20
Here is one way to do it:

root@vpn1:~ # cat /usr/local/etc/wireguard/wg0.conf
[Interface]
  PrivateKey =3D <->
  ListenPort =3D 7777
=20
[Peer]
  PublicKey =3D <->
  LinkAddress =3D 10.0.0.1/10.0.0.2
  Endpoint =3D 192.168.59.155:7777
  AllowedIPs =3D 10.0.0.2/32
=20
[Peer]
  PublicKey =3D <->
  LinkAddress =3D 10.1.1.1/10.1.1.2
  Endpoint =3D 192.168.58.155:7777
  AllowedIPs =3D 10.1.1.2/32
=20
$ diff /usr/local/bin/wg-quick wg-quick
16a17
> LADDRESSES=3D( )
63c64
<       local interface_section=3D0 line key value stripped path
---
>       local interface_section=3D0 peer_section=3D0 line key value stripped=
 path
95a97,102
>               [[ $key =3D=3D "[Peer]" ]] && peer_section=3D1
>               if [[ $peer_section -eq 1 ]]; then
>                       case "$key" in
>                       LinkAddress) LADDRESSES+=3D( ${value//,/ } ); contin=
ue ;;
>                       esac
>               fi
175c182
<               cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias
---
>               cmd ifconfig "$INTERFACE" inet "${1%/*}/32" "${1#*/}" alias
419c426
<       for i in "${ADDRESSES[@]}"; do
---
>       for i in "${LADDRESSES[@]}"; do
=20
root@vpn1:~ # /home/peter/wg-quick up wg0
[#] wireguard-go wg0
INFO: (wg0) 2020/02/25 13:49:54 Starting wireguard-go version 0.0.20200121
[#] wg setconf wg0 /tmp/tmp.vXURfmKj/sh-np.pCIWwG
[#] ifconfig wg0 inet 10.0.0.1/32 10.0.0.2 alias
[#] ifconfig wg0 inet 10.1.1.1/32 10.1.1.2 alias
[#] ifconfig wg0 mtu 1420
[#] ifconfig wg0 up
[#] route -q -n add -inet 10.1.1.2/32 -interface wg0
[#] route -q -n add -inet 10.0.0.2/32 -interface wg0
[+] Backgrounding route monitor
=20
root@vpn1:~ # ifconfig wg0
wg0: flags=3D8051<UP,POINTOPOINT,RUNNING,MULTICAST> metric 0 mtu 1420
        options=3D80000<LINKSTATE>
        inet 10.0.0.1 --> 10.0.0.2 netmask 0xffffffff
        inet 10.1.1.1 --> 10.1.1.2 netmask 0xffffffff
        groups: tun
        nd6 options=3D101<PERFORMNUD,NO_DAD>
        Opened by PID 2033
=20
root@VPN1:~ # netstat -rn4
Routing tables
=20
Internet:
Destination        Gateway            Flags     Netif Expire
default            192.168.59.2       UGS         em0
10.0.0.1           link#4             UHS         lo0
10.0.0.2           link#4             UH          wg0
10.0.0.2/32        wg0                US          wg0
10.1.1.1           link#4             UHS         lo0
10.1.1.2           link#4             UH          wg0
10.1.1.2/32        wg0                US          wg0
127.0.0.1          link#3             UH          lo0
192.168.59.0/24    link#1             U           em0
192.168.59.154     link#1             UHS         lo0
192.168.153.0/24   link#2             U           em1
192.168.153.130    link#2             UHS         lo0
=20
root@vpn1:~ # ping -c1 10.0.0.1
PING 10.0.0.1 (10.0.0.1): 56 data bytes
64 bytes from 10.0.0.1: icmp_seq=3D0 ttl=3D64 time=3D0.373 ms
=20
--- 10.0.0.1 ping statistics ---
1 packets transmitted, 1 packets received, 0.0% packet loss
round-trip min/avg/max/stddev =3D 0.373/0.373/0.373/0.000 ms
=20
root@vpn1:~ # ping -c1 10.1.1.1
PING 10.1.1.1 (10.1.1.1): 56 data bytes
64 bytes from 10.1.1.1: icmp_seq=3D0 ttl=3D64 time=3D0.277 ms
=20
--- 10.1.1.1 ping statistics ---
1 packets transmitted, 1 packets received, 0.0% packet loss
round-trip min/avg/max/stddev =3D 0.277/0.277/0.277/0.000 ms
=20
/Peter=

--Apple-Mail-23D62BF1-3634-4296-8017-ACC755F05135
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><meta http-equiv=3D"conten=
t-type" content=3D"text/html; charset=3Dutf-8"><br><div dir=3D"ltr"><blockqu=
ote type=3D"cite">25 feb. 2020 kl. 07:24 skrev Jan Novak &lt;repcom@gmail.co=
m&gt;:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=
=EF=BB=BF<span>Am 25.02.20 um 07:07 schrieb Peter Libassi:</span><br><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>23 feb. 2020 kl. 16:32 sk=
rev Jason A. Donenfeld &lt;Jason@zx2c4.com&gt;:</span><br></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>On Sun, Feb 23, 2020 at 2:25 PM Peter Libassi &lt;peter@libassi.se&=
gt; wrote:</span><br></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>Ok, Well even if usin=
g another local IP in range 127.0.0.0/8 we can=E2=80=99t be certain we will c=
lash with something else.</span><br></blockquote></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span></span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>How about a=
dding a directive for the remote interface address in wg.conf? Like this:</s=
pan><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquo=
te></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span># cat /usr/local/etc/wireguard/wg0.conf=
</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>[Interface]</span>=
<br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>PrivateKey =3D &lt;-&gt;<=
/span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span>ListenPort =3D 7777=
</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>Address =3D 192.16=
8.2.1/32</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>RemoteAddre=
ss =3D 192.168.2.2</span><br></blockquote></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>[Peer]</span><br><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>PublicKey =3D &lt;-&gt;</span><=
br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>AllowedIPs =3D 192.168.2.0=
/24</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Endpoint =3D 17=
2.16.0.23:7777</span><br></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></spa=
n><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span># diff /usr/local/bin/w=
g-quick.org ./wg-quick</span><br></blockquote></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>17a18</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>REMOTE_ADDRESS=3D""</span><br></blockquote></blockquote></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>86a88</span><br></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>RemoteAddress) REMOTEADDRESS=3D"$valu=
e"; continue ;;</span><br></blockquote></blockquote></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>175c177,181</span><br></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>&lt; cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias</span><br></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>---</span><br></blockquote></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;if [=
[ -n $REMOTEADDRESS ]]; then</span><br></blockquote></blockquote></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>cmd ifconfig "$INTERFACE" i=
net "$1" "$REMOTEADDRESS" alias</span><br></blockquote></blockquote></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;else<=
/span><br></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cmd ifconfig "$INTERFACE" inet "$1" "${1%%=
/*}" alias</span><br></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;fi</span><br></blockquote>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>This is not a correct fix; we're not going to add a con=
figuration nob</span><br></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>to work around FreeBSD network stack gotcha=
s.</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>Rather, I'd prefer to see all the Fre=
eBSD wg-quick semantics redone</span><br></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>around multiple routing tab=
les and marks, much like on Linux, though I</span><br></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>don't know if t=
hat's possible. Barring that, a proper solution</span><br></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>probably i=
nvolves re-reading the ifconfig man page a few dozen times</span><br></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>to find out how to have interface addresses as we need them.</span><br></bl=
ockquote></blockquote><blockquote type=3D"cite"><span>It works perfectly for=
 my single site-2-site use case. You have two options as I see it. Either co=
nvince the FreeBSD team to drop the dest_address requirement or implement lo=
cal/remote address awareness per [Peer] in the wg-quick script.</span><br></=
blockquote><blockquote type=3D"cite"><span></span><br></blockquote><span></s=
pan><br><span>Hi Peter,</span><br><span></span><br><span>Can you show me an e=
xample for "... implement local/remote address awareness per [Peer] in the w=
g-quick script... "</span><br><span></span><br><span></span><br><span>Bfo</s=
pan><br><span></span><br><span></span><br><span></span><br></div></blockquot=
e>Here is one way to do it:<div><br><div><p class=3D"MsoNormal" style=3D"-we=
bkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font=
-family: Calibri, sans-serif;">root@vpn1:~ # cat /usr/local/etc/wireguard/wg=
0.conf<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjus=
t: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sa=
ns-serif;">[Interface]<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit=
-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-fam=
ily: Calibri, sans-serif;">&nbsp; PrivateKey =3D &lt;-&gt;<o:p></o:p></p><p c=
lass=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0=
.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp; ListenPo=
rt =3D 7777<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-=
adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibr=
i, sans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-webkit=
-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-fam=
ily: Calibri, sans-serif;">[Peer]<o:p></o:p></p><p class=3D"MsoNormal" style=
=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11p=
t; font-family: Calibri, sans-serif;">&nbsp; PublicKey =3D &lt;-&gt;<o:p></o=
:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margi=
n: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">&nb=
sp; LinkAddress =3D 10.0.0.1/10.0.0.2<o:p></o:p></p><p class=3D"MsoNormal" s=
tyle=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size:=
 11pt; font-family: Calibri, sans-serif;">&nbsp; Endpoint =3D 192.168.59.155=
:7777<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust=
: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, san=
s-serif;">&nbsp; AllowedIPs =3D 10.0.0.2/32<o:p></o:p></p><p class=3D"MsoNor=
mal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font=
-size: 11pt; font-family: Calibri, sans-serif;"><o:p>&nbsp;</o:p></p><p clas=
s=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0=
001pt; font-size: 11pt; font-family: Calibri, sans-serif;">[Peer]<o:p></o:p>=
</p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0=
cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp; P=
ublicKey =3D &lt;-&gt;<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit=
-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-fam=
ily: Calibri, sans-serif;">&nbsp; LinkAddress =3D 10.1.1.1/10.1.1.2<o:p></o:=
p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin=
: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">&nbs=
p; Endpoint =3D 192.168.58.155:7777<o:p></o:p></p><p class=3D"MsoNormal" sty=
le=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 1=
1pt; font-family: Calibri, sans-serif;">&nbsp; AllowedIPs =3D 10.1.1.2/32<o:=
p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; m=
argin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;"=
><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adju=
st: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, s=
ans-serif;">$ diff /usr/local/bin/wg-quick wg-quick<o:p></o:p></p><p class=3D=
"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001p=
t; font-size: 11pt; font-family: Calibri, sans-serif;">16a17<o:p></o:p></p><=
p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0=
cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">&gt; LADDRE=
SSES=3D( )<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-a=
djust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">63c64<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-t=
ext-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-famil=
y: Calibri, sans-serif;">&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; local inte=
rface_section=3D0 line key value stripped path<o:p></o:p></p><p class=3D"Mso=
Normal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; f=
ont-size: 11pt; font-family: Calibri, sans-serif;">---<o:p></o:p></p><p clas=
s=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0=
001pt; font-size: 11pt; font-family: Calibri, sans-serif;">&gt;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; local interface_section=3D0 peer_section=3D0 line ke=
y value stripped path<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-=
text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-fami=
ly: Calibri, sans-serif;">95a97,102<o:p></o:p></p><p class=3D"MsoNormal" sty=
le=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 1=
1pt; font-family: Calibri, sans-serif;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [[ $key =3D=3D "[Peer]"=
 ]] &amp;&amp; peer_section=3D1<o:p></o:p></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; f=
ont-family: Calibri, sans-serif;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [[ $peer_section -eq 1 ]];=
 then<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust=
: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, san=
s-serif;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case "=
$key" in<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adj=
ust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, s=
ans-serif;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lin=
kAddress) LADDRESSES+=3D( ${value//,/ } ); continue ;;<o:p></o:p></p><p clas=
s=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0=
001pt; font-size: 11pt; font-family: Calibri, sans-serif;">&gt;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; esac<o:p></o:p></p><p class=3D"M=
soNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt;=
 font-size: 11pt; font-family: Calibri, sans-serif;">&gt;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<o:p></o=
:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margi=
n: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">175=
c182<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust:=
 auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans=
-serif;">&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias<o=
:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto;=
 margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif=
;">---<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjus=
t: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sa=
ns-serif;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; cmd ifconfig "$INTERFACE" inet "${1%/*}/32" "${1#*/}=
" alias<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adju=
st: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, s=
ans-serif;">419c426<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-te=
xt-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family=
: Calibri, sans-serif;">&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for i in "$=
{ADDRESSES[@]}"; do<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-te=
xt-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family=
: Calibri, sans-serif;">---<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-w=
ebkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; fon=
t-family: Calibri, sans-serif;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for=
 i in "${LADDRESSES[@]}"; do<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-=
webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; fo=
nt-family: Calibri, sans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal"=
 style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-siz=
e: 11pt; font-family: Calibri, sans-serif;">root@vpn1:~ # /home/peter/wg-qui=
ck up wg0<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-ad=
just: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri,=
 sans-serif;">[#] wireguard-go wg0<o:p></o:p></p><p class=3D"MsoNormal" styl=
e=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11=
pt; font-family: Calibri, sans-serif;">INFO: (wg0) 2020/02/25 13:49:54 Start=
ing wireguard-go version 0.0.20200121<o:p></o:p></p><p class=3D"MsoNormal" s=
tyle=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size:=
 11pt; font-family: Calibri, sans-serif;">[#] wg setconf wg0 /tmp/tmp.vXURfm=
Kj/sh-np.pCIWwG<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-s=
ize-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Ca=
libri, sans-serif;">[#] ifconfig wg0 inet 10.0.0.1/32 10.0.0.2 alias<o:p></o=
:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margi=
n: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">[#]=
 ifconfig wg0 inet 10.1.1.1/32 10.1.1.2 alias<o:p></o:p></p><p class=3D"MsoN=
ormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; fo=
nt-size: 11pt; font-family: Calibri, sans-serif;">[#] ifconfig wg0 mtu 1420<=
o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto=
; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-seri=
f;">[#] ifconfig wg0 up<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webki=
t-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-fa=
mily: Calibri, sans-serif;">[#] route -q -n add -inet 10.1.1.2/32 -interface=
 wg0<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust:=
 auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans=
-serif;">[#] route -q -n add -inet 10.0.0.2/32 -interface wg0<o:p></o:p></p>=
<p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0=
cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">[+] Backgro=
unding route monitor<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-t=
ext-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-famil=
y: Calibri, sans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; f=
ont-family: Calibri, sans-serif;">root@vpn1:~ # ifconfig wg0<o:p></o:p></p><=
p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0=
cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">wg0: flags=3D=
8051&lt;UP,POINTOPOINT,RUNNING,MULTICAST&gt; metric 0 mtu 1420<o:p></o:p></p=
><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm=
 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; options=3D80000&lt;LINKSTATE&gt;<o:p></o:p=
></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin:=
 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inet 10.0.0.1 --&gt; 10.0.0.2 netmask 0=
xffffffff<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-ad=
just: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri,=
 sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inet 10.1.1.1 --&gt=
; 10.1.1.2 netmask 0xffffffff<o:p></o:p></p><p class=3D"MsoNormal" style=3D"=
-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; f=
ont-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 groups: tun<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size=
-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calib=
ri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nd6 options=3D10=
1&lt;PERFORMNUD,NO_DAD&gt;<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-we=
bkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font=
-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Op=
ened by PID 2033<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-=
size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: C=
alibri, sans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-w=
ebkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; fon=
t-family: Calibri, sans-serif;">root@VPN1:~ # netstat -rn4<o:p></o:p></p><p c=
lass=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0=
.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">Routing tables<=
o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto=
; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-seri=
f;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-a=
djust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">Internet:<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webk=
it-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-f=
amily: Calibri, sans-serif;">Destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; Gateway&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; Flags&nbsp;&nbsp;&nbsp;&nbsp; Netif Expire<o:p></o:p></p><p class=3D"Ms=
oNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; f=
ont-size: 11pt; font-family: Calibri, sans-serif;">default&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 192.168.59.2&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; UGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; em=
0<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: au=
to; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-se=
rif;">10.0.0.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l=
ink#4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; UHS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lo0<o:p></o:p></p><p c=
lass=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0=
.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">10.0.0.2&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; link#4&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UH&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wg0<o:p></o:p></p><p class=3D"MsoNorma=
l" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-s=
ize: 11pt; font-family: Calibri, sans-serif;">10.0.0.2/32&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; wg0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; US&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; wg0<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-we=
bkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font=
-family: Calibri, sans-serif;">10.1.1.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; link#4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; UHS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; lo0<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjus=
t: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sa=
ns-serif;">10.1.1.2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; link#4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; UH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wg0<o:p></o:=
p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin=
: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">10.1=
.1.2/32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wg0&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; US&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wg0<o:p></o:p></p><p class=3D=
"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001p=
t; font-size: 11pt; font-family: Calibri, sans-serif;">127.0.0.1&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; link#3&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UH&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; lo0<o:p></o:p></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; f=
ont-family: Calibri, sans-serif;">192.168.59.0/24&nbsp;&nbsp;&nbsp; link#1&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; U&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; em0<o:p></o:p></p><=
p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0=
cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">192.168.59.=
154&nbsp;&nbsp;&nbsp;&nbsp; link#1 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UHS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; lo0<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-a=
djust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">192.168.153.0/24&nbsp;&nbsp; link#2&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; em1<o:p></o:p></p><p class=3D"MsoNormal" st=
yle=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 1=
1pt; font-family: Calibri, sans-serif;">192.168.153.130&nbsp;&nbsp;&nbsp; li=
nk#2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 UHS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lo0<o:p></o:p></p><p cl=
ass=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0=
.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;"><o:p>&nbsp;</o:=
p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin=
: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">root=
@vpn1:~ # ping -c1 10.0.0.1<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-w=
ebkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; fon=
t-family: Calibri, sans-serif;">PING 10.0.0.1 (10.0.0.1): 56 data bytes<o:p>=
</o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; ma=
rgin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">=
64 bytes from 10.0.0.1: icmp_seq=3D0 ttl=3D64 time=3D0.373 ms<o:p></o:p></p>=
<p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0=
cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;"><o:p>&nbsp;=
</o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; ma=
rgin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">=
--- 10.0.0.1 ping statistics ---<o:p></o:p></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; f=
ont-family: Calibri, sans-serif;">1 packets transmitted, 1 packets received,=
 0.0% packet loss<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text=
-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: C=
alibri, sans-serif;">round-trip min/avg/max/stddev =3D 0.373/0.373/0.373/0.0=
00 ms<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust=
: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, san=
s-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-=
size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: C=
alibri, sans-serif;">root@vpn1:~ # ping -c1 10.1.1.1<o:p></o:p></p><p class=3D=
"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001p=
t; font-size: 11pt; font-family: Calibri, sans-serif;">PING 10.1.1.1 (10.1.1=
.1): 56 data bytes<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-tex=
t-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family:=
 Calibri, sans-serif;">64 bytes from 10.1.1.1: icmp_seq=3D0 ttl=3D64 time=3D=
0.277 ms<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adj=
ust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, s=
ans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-webkit-tex=
t-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family:=
 Calibri, sans-serif;">--- 10.1.1.1 ping statistics ---<o:p></o:p></p><p cla=
ss=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.=
0001pt; font-size: 11pt; font-family: Calibri, sans-serif;">1 packets transm=
itted, 1 packets received, 0.0% packet loss<o:p></o:p></p><p class=3D"MsoNor=
mal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font=
-size: 11pt; font-family: Calibri, sans-serif;">round-trip min/avg/max/stdde=
v =3D 0.277/0.277/0.277/0.000 ms<o:p></o:p></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-size: 11pt; f=
ont-family: Calibri, sans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal=
" style=3D"-webkit-text-size-adjust: auto; margin: 0cm 0cm 0.0001pt; font-si=
ze: 11pt; font-family: Calibri, sans-serif;"><o:p>/Peter</o:p></p></div></di=
v></div></body></html>=

--Apple-Mail-23D62BF1-3634-4296-8017-ACC755F05135--

--===============8697779894563161453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8697779894563161453==--
