Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3CFC388F9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 20:37:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F2B20715
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 20:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24F2B20715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=friedels.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7aa8b944;
	Mon, 23 Nov 2020 20:32:04 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 15e4db69
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 20:32:01 +0000 (UTC)
Received: from [192.168.177.174] ([91.63.166.210]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MSbov-1koGdB44xl-00SwV0; Mon, 23 Nov 2020 21:37:25 +0100
From: "Hendrik Friedel" <hendrik@friedels.name>
To: "Max R. P. Grossmann" <m@max.pm>
Subject: Re[2]: Connection works, ping does not
Cc: wireguard@lists.zx2c4.com
Date: Mon, 23 Nov 2020 20:37:24 +0000
Message-Id: <emb79b6386-4a15-4186-aebf-9a21540c6055@desktop-g0r648m>
In-Reply-To: <20201123170255.joa7zsjvztukjxd4@desktop42>
References: <embf875782-3b93-421c-bb54-3c3566b671bb@desktop-g0r648m>
 <20201123170255.joa7zsjvztukjxd4@desktop42>
User-Agent: eM_Client/8.0.3385.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NaBPC1XzaEgh1ma6uiM+dsapmm7W7WV70bzy3pwmbcCw3d+DKGZ
 FDinhneg+c0k9Fa7FIVNnMquqCEXbx39JSwsIWIWw2FnU/Zq/MxYcqgNaDjkzW3UPq7QUx2
 yABO/rzkykGOYumysbTf5x7jEZe2zi1oamJu7wksa06fJ9sqk2ELsdVLdHkhYSMPn9jdsXL
 KVF6PvUodE9db1slBZF3w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/OTco58472o=:TRtj8dZ+kAnO5F7QEec2p0
 Lp19+e5053HKChUju07RUA1tb0LUx8UxcCRka2IW/SfrtI57sG/lJor2Hi30dc+WTccSPpquB
 jZdvrfX2YFWGeyPd7Y1Te33VO2lgmuMUeBAHYlP8+AFg4MC2ExjVRt/drNUbxyqYg/HN8N7bI
 mS5uULRvlufzOhGTSPY8JWE0C+fAuCTX1W223x27jMsfjoHUB/R8e9n96xboCtMwD4hTqGMiJ
 3x/JQ+0ycFoAk4CYaTnJr7XX94iBr/F3pFeruPbOLWsCEr1uAQfLi51V0ThF0MFb3S1PBA+sX
 mIwkfgXR1vhvijZZK51XsSzx+1PvDGaEDa29ZAuZem3oD5K/POp+73xkacxnLegzCTScIP5Hd
 YfNA6Z/v7XOsvb+c94zoohWvv+SpqzNJwNLwTVPxXZs9AzEoag3o6uSurdn7JIXUTn8UE5YGg
 W/D+aeHTSw==
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Reply-To: Hendrik Friedel <hendrik@friedels.name>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello Max,

thanks for your reply.

>
>Could it be that some kind of firewall is restricting UDP traffic to your=
 other server?
>
Well, locally, I do use this machine as Host for many tunnels.


>
>E.g. could you try to run `mtr --udp [other server's public IP address]` o=
n your computer (while disabling your other WireGuard connection, if applic=
able) and report back whether there is any kind of packet loss?
I used traceroute on the commandline for this:

Remote_

wg-quick up wgnet0
[#] ip link add wgnet0 type wireguard
[#] wg setconf wgnet0 /dev/fd/63
[#] ip -4 address add 10.192.122.3/32 dev wgnet0
[#] ip link set mtu 1420 up dev wgnet0
[#] wg set wgnet0 fwmark 51820
[#] ip -4 route add 0.0.0.0/0 dev wgnet0 table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0

root@openmediavault:/etc/wireguard# wg show
interface: wgnet0
   public key: cebXSaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxMFw=3D
   private key: (hidden)
   listening port: 42759
   fwmark: 0xca6c

peer: oNjmmmmmmmmmmmmmmmmmmmmmmmmmmmmU=3D
   endpoint: [2003:cb:97ff:33d8:9ec7:a6ff:fefd:3a6d]:51820
   allowed ips: 0.0.0.0/0
   transfer: 0 B received, 444 B sent
   persistent keepalive: every 25 seconds


Local:
traceroute to 2a00:sdfs:sdfsdf:sdfs:erre:ereee:sdf:c33a=20
(2a00:sdfs:sdfsdf:sdfs:erre:ereee:sdf:c33a), 30 hops max, 80 byte=20
packets
  1  p200300cb9733ca009ec7a6fffefd3a69.dip0.t-ipconnect.de=20
(2003:cb:9733:ca00:9ec7:a6ff:fefd:3a69)  0.946 ms  3.435 ms  3.645 ms
  2  2003:0:8501::1 (2003:0:8501::1)  13.884 ms  13.839 ms  14.193 ms
  3  * * *
  4  2001:2000:3019:6b::1 (2001:2000:3019:6b::1)  86.609 ms  88.002 ms =20
87.874 ms
  5  ddf-b2-v6.telia.net (2001:2000:3018:21::1)  88.137 ms  89.508 ms =20
89.639 ms
  6  * * *
  7  2a00:6020:0:b::2 (2a00:6020:0:b::2)  81.576 ms  81.989 ms=20
2a00:6020:0:a::2 (2a00:6020:0:a::2)  82.201 ms
  8  lo1007.kr1.dc1-bor.dg-ao.de (2a00:6020:1000:3::1)  86.281 ms  84.259=
=20
ms  85.760 ms
  9  2a00:xxxx:1000:3:yyyy:7f3d:d93e:f23d=20
(2a00:xxxx:1000:3:yyyy:7f3d:d93e:f23d)  88.483 ms !X  87.579 ms !X =20
88.447 ms !X

And here the mtr results (wg up and down)
https://1drv.ms/u/s!AvbzKdYzkh6gl0BVLcuR9eeWUaqj?e=3D9wKxSC
https://1drv.ms/u/s!AvbzKdYzkh6gl0HVwPz1FabOtemM?e=3Dc7bCcB

>If not, you may wish to check whether the port on the machine is reachable=
, e.g. by running `nc -v -l -u -p 12345` on your server and then executing=
 `echo test | nc -u [server's IP] 12345`, to check whether the message arriv=
es at the server.

I am using the machine that is here, locally as server for many tunnels.=20
So, the wireguard port is reachable.
On the remote machine, I have NOT done any port forwarding. Is that=20
neccessary at all? I thought that only the machine that is NOT=20
initiating the connection needs a port forwarding.

Greetings,
Hendrik

>
>
>Best,
>
>Max
>
>On 20/11/22 07:39pm, Hendrik Friedel wrote:
>>  Hello,
>>
>>  (I posted this a while ago, but it never appeared on the list; if the l=
ist is the wrong place for this question, please let me know; I would appre=
ciate a hint for a more appropriate place)
>>
>>  I am using wireguard to connect two machines.
>>  My local server is connected  to the internet via a router. I am using=
 theis Server also for connecting other devices (e.g. mobile phones) to my h=
ome network. This works great.
>>
>>  But when connecting to another server (both debian 10), I only get a su=
ccessful connection, but no ping.
>>  *My server:*
>>
>>  wg show
>>  interface: wgnet0
>>    public key: xxxxx=3D
>>    private key: (hidden)
>>    listening port: 51820
>>
>>  peer: sdfsdfsdfsdfsdfsdf=3D
>>    endpoint: 109.41.64.83:15167
>>    allowed ips: 10.192.122.2/32
>>    latest handshake: 1 minute, 7 seconds ago
>>    transfer: 10.95 MiB received, 40.35 MiB sent
>>
>>  peer: yyyy=3D
>>    endpoint: 185.22.142.254:51380
>>    allowed ips: 10.192.122.3/32
>>    transfer: 0 B received, 5.20 KiB sent
>>
>>  peer: yyyy=3D
>>    endpoint: 93.214.229.137:64119
>>    allowed ips: 10.192.122.4/32
>>
>>  peer: yyyy=3D
>>    endpoint: 93.214.225.116:49819
>>    allowed ips: 10.192.122.5/32
>>
>>  peer: yyyy=3D
>>    allowed ips: 10.192.122.6/32
>>
>>  peer: yyyy=3D
>>    allowed ips: 10.192.122.7/32
>>
>>
>>  more /etc/wireguard/wgnet0.conf
>>  [Interface]
>>  Address =3D 10.192.122.1/24
>>  SaveConfig =3D true
>>  PostUp =3D iptables -A FORWARD -i wgnet0 -j ACCEPT; iptables -A FORWARD =
-o wgnet0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>>  PostDown =3D iptables -D FORWARD -i wgnet0 -j ACCEPT; iptables -D FORWA=
RD -o wgnet0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERAD=
E
>>  ListenPort =3D 51820
>>  PrivateKey =3D aaa=3D
>>
>>  [Peer]
>>  PublicKey =3D yyyy=3D
>>  AllowedIPs =3D 10.192.122.2/32
>>  Endpoint =3D 123.41.67.233:18314
>>
>>  [Peer]
>>  PublicKey =3D xxx=3D
>>  AllowedIPs =3D 10.192.122.3/32
>>  Endpoint =3D 123.22.142.254:51380
>>
>>
>>
>>
>>
>>  ip route
>>  default via 192.168.177.1 dev eth0 proto static
>>  10.192.122.0/24 dev wgnet0 proto kernel scope link src 10.192.122.1
>>
>>  and the other side/server:
>>
>>  interface: wgnet0
>>    public key: xxxxx=3D
>>    private key: (hidden)
>>    listening port: 54004
>>    fwmark: 0xca6c
>>
>>  peer: yyyyy=3D
>>    endpoint: [2003:cb:aaa:bbb:9ec7:a6ff:fefd:3a6d]:51820
>>    allowed ips: 0.0.0.0/0
>>    transfer: 0 B received, 2.75 KiB sent
>>    persistent keepalive: every 25 seconds
>>
>>
>>
>>    more wgnet0.conf
>>  [Interface]
>>  Address =3D 10.192.122.3/32
>>  PrivateKey =3D xxxxx=3D
>>
>>  [Peer]
>>  PublicKey =3D yyyyy=3D
>>  Endpoint =3D v.myfritz.net:51820
>>  AllowedIPs =3D 0.0.0.0/0
>>  PersistentKeepalive =3D 25
>>
>>  It seems to me, that the connection is successfully established , but d=
ata is only transmitted in one direction.
>>
>>  How can I find the reason?
>>
>>  Regards,
>>  Hendrik
>>

