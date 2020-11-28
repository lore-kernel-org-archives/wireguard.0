Return-Path: <SRS0=Yklm=FC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URI_NOVOWEL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F94DC63697
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Nov 2020 16:50:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF68246CF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Nov 2020 16:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DF68246CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=friedels.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e5b168a;
	Sat, 28 Nov 2020 16:44:07 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4c9e93df
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Nov 2020 16:44:05 +0000 (UTC)
Received: from [192.168.177.174] ([91.56.68.139]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N9L64-1k6ZLO01Se-015FPF; Sat, 28 Nov 2020 17:50:06 +0100
From: "Hendrik Friedel" <hendrik@friedels.name>
To: "Max R. P. Grossmann" <m@max.pm>, wireguard@lists.zx2c4.com
Subject: Re[4]: Connection works, ping does not
Date: Sat, 28 Nov 2020 16:50:06 +0000
Message-Id: <em0d8407bb-2467-41ad-9d4d-5db6dabbe1c6@desktop-g0r648m>
In-Reply-To: <em1f4c294f-4708-4a7c-b268-300b1b5df65d@desktop-g0r648m>
References: <embf875782-3b93-421c-bb54-3c3566b671bb@desktop-g0r648m>
 <20201123170255.joa7zsjvztukjxd4@desktop42>
 <emb79b6386-4a15-4186-aebf-9a21540c6055@desktop-g0r648m>
 <em1f4c294f-4708-4a7c-b268-300b1b5df65d@desktop-g0r648m>
User-Agent: eM_Client/8.0.3385.0
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DsoGxSxQQww8OgLYupEogbRYGqmwMIKBwcG9KreG9zoS8WqTM4s
 Nsj4P+QriAZRvzP23XivuUdlXLXCwcCJEZNSiceqjiJ3ORB34GShjWL+JGhKl9E87oD8R/9
 jFzPkj6PH0PVw3ZwwbNvamNA3kjrfyxpr1kw7AIQE8DoNpcWrbjv+9K9GXgr01zIwDRSs7P
 cSFs9gwAwU7Vq5ewElEmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9lIgQYa34lU=:3oHp8q+bq7BLpsCTQNHmnZ
 hmZ1Qs8C365DJV3xt9qYcRL2XYZCr33gjzFWuh1pJhD4q2rwQQcf9ztEmvbxuyBnK8iRtx+Tl
 6Q6bQpGFzAvqfQowm3Af9togjT+nE9s4not6ruFyz/lA4AN+58PTfDi2UVKJkW4ojYNowsLTI
 9SFZZMfFdolHoiT5QwDO91vthHib/kinjjWxVeDt91Slh2JrJApE7qut9eXShF/bUnmsjZT5M
 /u1CuxAr441cYI5NlXadaUAuN47LR1vimo9kJ7111uKX0KRmt4ijtqzg5hbwJ0rIkYBGmbMLw
 ra0tZTF6buQU8nSq/hNtf/WRIt96mqyF/UccmGCYXoMZAfzZ7zyQidMyTibSCI4VCeSoRgjmw
 f5WepPs2Fcc/Z5V+yre6rtgQzc8mKXtF67tS3aCzFKL2qYGCMNEg3qJW7gJnt8THxrbL9P4XT
 6U1k/unrog==
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

Hello,

in the mail below the mtr results as picture, as "mtr" opens a GUI for=20
me.

Here the results again, but from the commandline:
homeserver.fritz.box (2003:xxxxxxxxx:feaa:27bb)                         =20
                                                 2020-11-28T17:39:11+0100
Keys:  Help   Display mode   Restart statistics   Order of fields   quit
                                                                         =
=20
                                             Packets               Pings
  Host                                                                   =
=20
                                           Loss%   Snt   Last   Avg  Best=
=20
  Wrst StDev
  1. p200300cb972aa0009ec7a6fffefd3a69.dip0.t-ipconnect.de               =
=20
                                            0.0%    15    0.5   0.5   0.5=
=20
   0.7   0.1
  2. 2003:0:8501::1                                                      =
=20
                                            0.0%    15    7.9  13.1   7.5=
=20
  47.7  11.1
  3. ???
  4. ???
  5. ddf-b2-v6.telia.net                                                 =
=20
                                            0.0%    14   75.9  81.7  75.9=
=20
  96.7   5.0
  6. glasfaser-svc070650-ic356771.c.telia.net                            =
=20
                                           76.9%    14   78.2  81.0  78.2=
=20
  82.4   2.4
  7. 2a00:6020:0:a::2                                                    =
=20
                                            0.0%    14   82.5  79.7  72.0=
=20
  83.2   3.4
  8. lo1007.kr1.dc1-bor.dg-ao.de                                         =
=20
                                            0.0%    14   81.8  82.9  68.1=
=20
  87.6   4.9
  9. 2a00:6020:1000:3:dd0e:7f3d:d93e:f23d                                =
=20
                                            0.0%    14   84.0  85.6  71.6=
=20
  90.5   5.0
10. 2a00:yyyyyyyyyyy:fe7f:c33a                                          =20
                               0.0%    14   84.3  84.1  77.4  88.9   3.8


and in the opposite direction


Keys:  Help   Display mode   Restart statistics   Order of fields   quit
                                                                         =
=20
                                             Packets               Pings
  Host                                                                   =
=20
                                           Loss%   Snt   Last   Avg  Best=
=20
  Wrst StDev
  1. fritz.box                                                           =
=20
                                            0.0%    15    0.5   0.5   0.4=
=20
   0.8   0.0
  2. ???
  3. 2a00:6020:0:a::1                                                    =
=20
                                           20.0%    15    7.5   7.6   7.5=
=20
   8.5   0.0
  4. ddf-b2-link.telia.net                                               =
=20
                                            0.0%    15    6.2   7.7   6.0=
=20
  26.8   5.3
  5. ???
  6. hbg-b2-v6.telia.net                                                 =
=20
                                           26.7%    15   12.9  13.0  12.8=
=20
  14.0   0.0
  7. 2003:0:1400:c004::1                                                 =
=20
                                           33.3%    15   71.6  72.1  68.7=
=20
  75.9   2.8
  8. 2003:0:8501::1                                                      =
=20
                                            0.0%    14   80.2  76.9  69.1=
=20
  80.3   3.1
  9. ddddddddddddd.dip0.t-ipconnect.de                                   =
=20
                        0.0%    14   83.6  85.4  66.0  92.9   6.2


There are many packet losses, as far as I see.
But also many packets seem to go through (never 100% loss).
Does that help?

Regards,
Hendrik



















>
>------ Originalnachricht ------
>Von: "Hendrik Friedel" <hendrik@friedels.name>
>An: "Max R. P. Grossmann" <m@max.pm>
>Cc: wireguard@lists.zx2c4.com
>Gesendet: 23.11.2020 21:37:24
>Betreff: Re[2]: Connection works, ping does not
>
>>Hello Max,
>>
>>thanks for your reply.
>>
>>>
>>>Could it be that some kind of firewall is restricting UDP traffic to you=
r other server?
>>>
>>Well, locally, I do use this machine as Host for many tunnels.
>>
>>
>>>
>>>E.g. could you try to run `mtr --udp [other server's public IP address]` =
on your computer (while disabling your other WireGuard connection, if appl=
icable) and report back whether there is any kind of packet loss?
>>I used traceroute on the commandline for this:
>>
>>Remote_
>>
>>wg-quick up wgnet0
>>[#] ip link add wgnet0 type wireguard
>>[#] wg setconf wgnet0 /dev/fd/63
>>[#] ip -4 address add 10.192.122.3/32 dev wgnet0
>>[#] ip link set mtu 1420 up dev wgnet0
>>[#] wg set wgnet0 fwmark 51820
>>[#] ip -4 route add 0.0.0.0/0 dev wgnet0 table 51820
>>[#] ip -4 rule add not fwmark 51820 table 51820
>>[#] ip -4 rule add table main suppress_prefixlength 0
>>
>>root@openmediavault:/etc/wireguard# wg show
>>interface: wgnet0
>>   public key: cebXSaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxMFw=3D
>>   private key: (hidden)
>>   listening port: 42759
>>   fwmark: 0xca6c
>>
>>peer: oNjmmmmmmmmmmmmmmmmmmmmmmmmmmmmU=3D
>>   endpoint: [2003:cb:97ff:33d8:9ec7:a6ff:fefd:3a6d]:51820
>>   allowed ips: 0.0.0.0/0
>>   transfer: 0 B received, 444 B sent
>>   persistent keepalive: every 25 seconds
>>
>>
>>Local:
>>traceroute to 2a00:sdfs:sdfsdf:sdfs:erre:ereee:sdf:c33a (2a00:sdfs:sdfsdf=
:sdfs:erre:ereee:sdf:c33a), 30 hops max, 80 byte packets
>>  1  p200300cb9733ca009ec7a6fffefd3a69.dip0.t-ipconnect.de (2003:cb:9733:=
ca00:9ec7:a6ff:fefd:3a69)  0.946 ms  3.435 ms  3.645 ms
>>  2  2003:0:8501::1 (2003:0:8501::1)  13.884 ms  13.839 ms  14.193 ms
>>  3  * * *
>>  4  2001:2000:3019:6b::1 (2001:2000:3019:6b::1)  86.609 ms  88.002 ms  8=
7.874 ms
>>  5  ddf-b2-v6.telia.net (2001:2000:3018:21::1)  88.137 ms  89.508 ms  89=
.639 ms
>>  6  * * *
>>  7  2a00:6020:0:b::2 (2a00:6020:0:b::2)  81.576 ms  81.989 ms 2a00:6020:=
0:a::2 (2a00:6020:0:a::2)  82.201 ms
>>  8  lo1007.kr1.dc1-bor.dg-ao.de (2a00:6020:1000:3::1)  86.281 ms  84.259 =
ms  85.760 ms
>>  9  2a00:xxxx:1000:3:yyyy:7f3d:d93e:f23d (2a00:xxxx:1000:3:yyyy:7f3d:d93=
e:f23d)  88.483 ms !X  87.579 ms !X  88.447 ms !X
>>
>>And here the mtr results (wg up and down)
>>https://1drv.ms/u/s!AvbzKdYzkh6gl0BVLcuR9eeWUaqj?e=3D9wKxSC
>>https://1drv.ms/u/s!AvbzKdYzkh6gl0HVwPz1FabOtemM?e=3Dc7bCcB
>>
>>>If not, you may wish to check whether the port on the machine is reachab=
le, e.g. by running `nc -v -l -u -p 12345` on your server and then executin=
g `echo test | nc -u [server's IP] 12345`, to check whether the message arr=
ives at the server.
>>
>>I am using the machine that is here, locally as server for many tunnels.=
 So, the wireguard port is reachable.
>>On the remote machine, I have NOT done any port forwarding. Is that necce=
ssary at all? I thought that only the machine that is NOT initiating the co=
nnection needs a port forwarding.
>>
>>Greetings,
>>Hendrik
>>
>>>
>>>
>>>Best,
>>>
>>>Max
>>>
>>>On 20/11/22 07:39pm, Hendrik Friedel wrote:
>>>>  Hello,
>>>>
>>>>  (I posted this a while ago, but it never appeared on the list; if the =
list is the wrong place for this question, please let me know; I would app=
reciate a hint for a more appropriate place)
>>>>
>>>>  I am using wireguard to connect two machines.
>>>>  My local server is connected  to the internet via a router. I am usin=
g theis Server also for connecting other devices (e.g. mobile phones) to my =
home network. This works great.
>>>>
>>>>  But when connecting to another server (both debian 10), I only get a=
 successful connection, but no ping.
>>>>  *My server:*
>>>>
>>>>  wg show
>>>>  interface: wgnet0
>>>>    public key: xxxxx=3D
>>>>    private key: (hidden)
>>>>    listening port: 51820
>>>>
>>>>  peer: sdfsdfsdfsdfsdfsdf=3D
>>>>    endpoint: 109.41.64.83:15167
>>>>    allowed ips: 10.192.122.2/32
>>>>    latest handshake: 1 minute, 7 seconds ago
>>>>    transfer: 10.95 MiB received, 40.35 MiB sent
>>>>
>>>>  peer: yyyy=3D
>>>>    endpoint: 185.22.142.254:51380
>>>>    allowed ips: 10.192.122.3/32
>>>>    transfer: 0 B received, 5.20 KiB sent
>>>>
>>>>  peer: yyyy=3D
>>>>    endpoint: 93.214.229.137:64119
>>>>    allowed ips: 10.192.122.4/32
>>>>
>>>>  peer: yyyy=3D
>>>>    endpoint: 93.214.225.116:49819
>>>>    allowed ips: 10.192.122.5/32
>>>>
>>>>  peer: yyyy=3D
>>>>    allowed ips: 10.192.122.6/32
>>>>
>>>>  peer: yyyy=3D
>>>>    allowed ips: 10.192.122.7/32
>>>>
>>>>
>>>>  more /etc/wireguard/wgnet0.conf
>>>>  [Interface]
>>>>  Address =3D 10.192.122.1/24
>>>>  SaveConfig =3D true
>>>>  PostUp =3D iptables -A FORWARD -i wgnet0 -j ACCEPT; iptables -A FORWA=
RD -o wgnet0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERAD=
E
>>>>  PostDown =3D iptables -D FORWARD -i wgnet0 -j ACCEPT; iptables -D FOR=
WARD -o wgnet0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUER=
ADE
>>>>  ListenPort =3D 51820
>>>>  PrivateKey =3D aaa=3D
>>>>
>>>>  [Peer]
>>>>  PublicKey =3D yyyy=3D
>>>>  AllowedIPs =3D 10.192.122.2/32
>>>>  Endpoint =3D 123.41.67.233:18314
>>>>
>>>>  [Peer]
>>>>  PublicKey =3D xxx=3D
>>>>  AllowedIPs =3D 10.192.122.3/32
>>>>  Endpoint =3D 123.22.142.254:51380
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>  ip route
>>>>  default via 192.168.177.1 dev eth0 proto static
>>>>  10.192.122.0/24 dev wgnet0 proto kernel scope link src 10.192.122.1
>>>>
>>>>  and the other side/server:
>>>>
>>>>  interface: wgnet0
>>>>    public key: xxxxx=3D
>>>>    private key: (hidden)
>>>>    listening port: 54004
>>>>    fwmark: 0xca6c
>>>>
>>>>  peer: yyyyy=3D
>>>>    endpoint: [2003:cb:aaa:bbb:9ec7:a6ff:fefd:3a6d]:51820
>>>>    allowed ips: 0.0.0.0/0
>>>>    transfer: 0 B received, 2.75 KiB sent
>>>>    persistent keepalive: every 25 seconds
>>>>
>>>>
>>>>
>>>>    more wgnet0.conf
>>>>  [Interface]
>>>>  Address =3D 10.192.122.3/32
>>>>  PrivateKey =3D xxxxx=3D
>>>>
>>>>  [Peer]
>>>>  PublicKey =3D yyyyy=3D
>>>>  Endpoint =3D v.myfritz.net:51820
>>>>  AllowedIPs =3D 0.0.0.0/0
>>>>  PersistentKeepalive =3D 25
>>>>
>>>>  It seems to me, that the connection is successfully established , but =
data is only transmitted in one direction.
>>>>
>>>>  How can I find the reason?
>>>>
>>>>  Regards,
>>>>  Hendrik
>>>>
>

