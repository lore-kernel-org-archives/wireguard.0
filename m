Return-Path: jacob.schooley@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09885dd6
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 17:25:04 +0000 (UTC)
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2397a28b
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 17:25:04 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id o189so4430537wme.4
 for <wireguard@lists.zx2c4.com>; Wed, 14 Feb 2018 09:31:57 -0800 (PST)
MIME-Version: 1.0
From: Jacob Schooley <jacob.schooley@gmail.com>
Date: Wed, 14 Feb 2018 12:31:55 -0500
Message-ID: <CAHjFYUJqNB6AYTe1GO7pQr39ed6m6uO=pFo_wB_N=V2Tn1a5Kg@mail.gmail.com>
Subject: Running WireGuard on embedded devices with older kernel versions
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="f403045dcaded7551705652f7c05"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045dcaded7551705652f7c05
Content-Type: text/plain; charset="UTF-8"

I have a few verizon mobile hotspots and think this would be a perfect
place to implement wireguard. The only problem is the kernel versions
included with these hotspots:

- Novatel 5510 and Pantech MHS291 (also the Pantech UML290 USB stick) run
3.0.x
- Novatel 6620 runs 3.4.0

Also, I don't think they include CONFIG_NET_UDP_TUNNEL. Lots of proprietary
modules so the kernel can't be replaced without Novatel's sources.

These can be found pretty cheap on ebay and craigslist. I've heard the
newer ones, Netgear 791 and Novatel 7730 run 3.10 or newer, but I haven't
found any for a decent price.

OpenVPN can be run on these, but maxes out around 10mbps due to CPU
limitations.

Is there any way to run wireguard on older kernels and without this config
option?

--f403045dcaded7551705652f7c05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a few verizon mobile hotspots and think this would =
be a perfect place to implement wireguard. The only problem is the kernel v=
ersions included with these hotspots:<div><br></div><div>- Novatel 5510 and=
 Pantech MHS291 (also the Pantech UML290 USB stick) run 3.0.x</div><div>- N=
ovatel 6620 runs 3.4.0</div><div><br></div><div>Also, I don&#39;t think the=
y include=20

<span style=3D"color:rgb(51,51,51);font-family:&quot;Source Code Pro&quot;,=
Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13.5px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:left;text-indent:0px;text-tran=
sform:none;white-space:nowrap;word-spacing:0px;background-color:rgb(245,245=
,245);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">CONFIG_NET_UDP_TUNNEL</span>. Lots of proprietary modules=
 so the kernel can&#39;t be replaced without Novatel&#39;s sources.</div><d=
iv><br></div><div>These can be found pretty cheap on ebay and craigslist. I=
&#39;ve heard the newer ones, Netgear 791 and Novatel 7730 run 3.10 or newe=
r, but I haven&#39;t found any for a decent price.</div><div><br></div><div=
>OpenVPN can be run on these, but maxes out around 10mbps due to CPU limita=
tions.</div><div><br></div><div>Is there any way to run wireguard on older =
kernels and without this config option?</div></div>

--f403045dcaded7551705652f7c05--
