Return-Path: barhom@netsat.se
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fdc06d6
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 May 2017 09:18:42 +0000 (UTC)
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a681fcc
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 May 2017 09:18:42 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id d127so11555331wmf.0
 for <wireguard@lists.zx2c4.com>; Wed, 31 May 2017 02:31:48 -0700 (PDT)
MIME-Version: 1.0
From: Ibrahim Tachijian <barhom@netsat.se>
Date: Wed, 31 May 2017 09:31:35 +0000
Message-ID: <CACTq0bRBqH85OhjF2gRmkRGay91+L=XXy7Y6mAYuodGPz9L62w@mail.gmail.com>
Subject: Wireguard and MTU
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="f403045c0d04c595920550ce96e6"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045c0d04c595920550ce96e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I understand that by default wireguard chooses an MTU of 1420.
The way that I have setup wireguard now is that I have a router (running
LEDE/openwrt) connecting to wireguard running on an arch server.

I then set the default gw to go through wireguard and properly do iptables
nat masquerading so that the only ip inside the tunnel is the ones in
allowed_ips.
Basically all my traffic from the router (lede/openwrt) now flows over
wireguard and then to the internet.


   - Router -> wireguard -> Internet
      - working good because the MTU is properly set to 1420.
   - Wifi Client -> Router -> wireguard -> internet
      - Not working properly because of MTU is set at 1500 at wifi/wired
      dhcp clients.

How do we propose that we advertise the correct MTU that the NAT clients of
the router should use? Is there any other way to solve this issue?

Thanks,



--=20
*Ibrahim Tachijian*

CEO Net Sat AB
Mobile: +46723321377
barhom@netsat.se

_________________________


*Net Sat ABC/O Jayway AB*Klara =C3=96stra Kyrkogata 2B, 1TR, 111 52 Stockho=
lm,
Sweden
Office: +46 (0)8 408 394 53

--f403045c0d04c595920550ce96e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I understand that by default wireguard chooses an MTU of 1=
420.<div>The way that I have setup wireguard now is that I have a router (r=
unning LEDE/openwrt) connecting to wireguard running on an arch server.</di=
v><div><br></div><div>I then set the default gw to go through wireguard and=
 properly do iptables nat masquerading so that the only ip inside the tunne=
l is the ones in allowed_ips.</div><div>Basically all my traffic from the r=
outer (lede/openwrt) now flows over wireguard and then to the internet.</di=
v><div><br></div><div><ul><li>Router -&gt; wireguard -&gt; Internet</li><ul=
><li>working good because the MTU is properly set to 1420.</li></ul><li>Wif=
i Client -&gt; Router -&gt; wireguard -&gt; internet</li><ul><li>Not workin=
g properly because of MTU is set at 1500 at wifi/wired dhcp clients.</li></=
ul></ul><div>How do we propose that we advertise the correct MTU that the N=
AT clients of the router should use? Is there any other way to solve this i=
ssue?</div></div><div><br></div><div>Thanks,</div><div><br></div><div><br><=
/div><div><br></div></div><div dir=3D"ltr">-- <br></div><div data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><b style=3D"color:black;font-family:a=
rial,sans-serif;font-size:small"><span style=3D"font-size:11px;line-height:=
12.2667px">Ibrahim Tachijian</span></b><div class=3D"gmail_signature" style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small"><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><p><span style=3D"color:=
black;font-size:7.5pt;line-height:11.5px">CEO Net Sat AB<br></span><span st=
yle=3D"font-size:7.5pt;line-height:11.5px"><font color=3D"#000000">Mobile: =
+46723321377<br></font></span><a href=3D"mailto:barhom@netsat.se" target=3D=
"_blank" style=3D"color:rgb(17,85,204);font-size:7.5pt;line-height:11.5px">=
barhom@netsat.se</a></p><p style=3D"line-height:14.72px"><span style=3D"fon=
t-size:7.5pt;line-height:11.5px;color:black">_________________________<br><=
b>Net Sat AB<br>C/O Jayway AB<br></b></span><span style=3D"color:black;font=
-size:7.5pt;line-height:11.5px">Klara =C3=96stra Kyrkogata 2B, 1TR, 111 52 =
Stockholm, Sweden<br></span><span style=3D"color:black;font-size:7.5pt;line=
-height:11.5px">Office: +46 (0)8 408 394 53</span></p></div></div></div></d=
iv></div></div></div>

--f403045c0d04c595920550ce96e6--
