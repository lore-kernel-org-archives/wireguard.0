Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5A2C04AB5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:36:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EB0A20684
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:36:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dba8giiD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EB0A20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2f0eb93;
	Thu, 6 Jun 2019 09:36:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bc71f02
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 May 2019 12:03:16 +0000 (UTC)
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c28c4645
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 May 2019 12:03:16 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id w25so8564424qkj.11
 for <wireguard@lists.zx2c4.com>; Mon, 20 May 2019 05:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kQc4EUB7kd0/oI9DdEVKEvw6Y7HdKhtWqZ3iiTEmYTk=;
 b=dba8giiDf5AACcr9O4yzzacJhKf/VvL/Yf3fmdIZD+hFOBBuEUup25P9/FnwFBdUiV
 giWTs1/Rd/U6UW5dcSdKvL1UVYgCGPaI1otKWXUYiSqqf3yf0qC5HW3DKUR+yK8Y86rN
 8vxYrxlTWZjHJt9Xnb4LG9744eLPOarsJKNEA29ayCnTVQtKMJZZMo77c+foDKOT5Wck
 ouT+yWgA3iF/9nAD7YxYqrZMUIGynD+2prrt9zx4lD9/lt5dbnWKT5TXMp50/yh5zEQL
 DotCYgX4EYC/WX463AQit/6uuHzJ1oWgvobE7FeHZHt8TpS5SqUgrn9dvBm+Gurte14p
 Tbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kQc4EUB7kd0/oI9DdEVKEvw6Y7HdKhtWqZ3iiTEmYTk=;
 b=g5UHGYjaiqesxnSYZ35ObjDbznSgQ4cnjp2xjRUWFGg9IZgY8YNCk7EI592FnHEiTJ
 pDqlSD78D2VATkwqt4xSlI6gjQlc3jYtPvb2epQzQDly6A9RJnblApiiO9NPE4reWKcm
 53gPotxqV0yQ86pavocK6fy5ZriRLJXCkeyXC8gOhmcapUess6zDhWxPxJC+pRP/++9k
 ynPVoX29rCK81WK5W53nF0PMWk7B8zf237wosDi0OaS66bpBzYwzoo9vLtKFqpNTD82v
 4tSRf/FYRRMVstK6n8Y6ogPQVOeN6xGOHM4fLk+5b5S6K/QkL45uYsKJRz9+mLG590ir
 NRiQ==
X-Gm-Message-State: APjAAAXMmfYridVlox9MfVxR3r9sXuoOYgvYvnzogr1ZdYTrC4K3Lh/s
 c1dJgU5nEvk5eNFQ+bjgfexkLujo/8ppBDxHadw=
X-Google-Smtp-Source: APXvYqzPV7c4OF3RiWQw0MubRV5CZXijp8/n07EEw9HYt62J+M5ckN56IoOAqabvvTfIy9lpz/QY9/IpGHanUx9pobc=
X-Received: by 2002:a37:63c2:: with SMTP id x185mr57638140qkb.40.1558353795910; 
 Mon, 20 May 2019 05:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAGyAFMV=HvOYDRSB7eRpBDp-47wX2vie8JPgp48in1fH+eXn=A@mail.gmail.com>
 <CAFHpkQFVpN-+Uoc6QsLmD8hjwEC7Ba1Q2SP4SuS_EMu_PT=3nw@mail.gmail.com>
 <7bdf712d-4e0c-0667-c9eb-1bdd862b1e40@sf.lists.topphemmelig.net>
 <bfead88f-3e91-6d49-ea70-e73f626468f1@nikhef.nl>
 <CAGyAFMW10tUVswPa8NfVieUJMm1oX1BFQaa9a0GP3NmgWpRshg@mail.gmail.com>
In-Reply-To: <CAGyAFMW10tUVswPa8NfVieUJMm1oX1BFQaa9a0GP3NmgWpRshg@mail.gmail.com>
From: Lev Stipakov <lstipakov@gmail.com>
Date: Mon, 20 May 2019 15:03:04 +0300
Message-ID: <CAGyAFMWODccNnD+yby7HrOUfdDFaceC3AX70+jG9_hL9vF=q+A@mail.gmail.com>
Subject: Re: [Openvpn-devel] Wintun performance results
To: Jan Just Keijser <janjust@nikhef.nl>
X-Mailman-Approved-At: Thu, 06 Jun 2019 11:36:07 +0200
Cc: David Sommerseth <openvpn@sf.lists.topphemmelig.net>,
 openvpn-devel <openvpn-devel@lists.sourceforge.net>, wireguard@lists.zx2c4.com,
 =?UTF-8?B?0JjQu9GM0Y8g0KjQuNC/0LjRhtC40L0=?= <chipitsine@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6363676663424153367=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6363676663424153367==
Content-Type: multipart/alternative; boundary="0000000000007091790589508456"

--0000000000007091790589508456
Content-Type: text/plain; charset="UTF-8"

Hi,

While wintun support is not yet added to openvpn3 master, I think it would
be beneficial to share my own branch.

https://github.com/lstipakov/openvpn3/tree/feature/wintun-wip#building-the-openvpn-3-client-on-windows


See instructions in README on how to build openvpn3 library and test client
on Windows.

Note that only "topology subnet" is supported (see
https://community.openvpn.net/openvpn/wiki/Topology#Topologysubnet).

I have included test client and wintun driver binaries if someone would
like to try it out (Tested on Windows 10 and Windows Server 2016):

1. Since wintun driver is not signed, you need to enable loading of test
signed code. For that, run

> bcdedit /set testsigning

in admin command prompt and restart Windows.

2. Download and unzip wintun driver
https://github.com/lstipakov/openvpn3/blob/feature/wintun-wip/wintun.7z

3. Open Device Manager (Control Panel\System and Security\System\Device
Manager).
Right click on tree root, select "Add legacy hardware" -> "Next" -> "..
hardware that I manually select from a list" ->
"Next" -> "Show all devices" -> "Have Disk..." -> Locate wintun.inf
unpacked at step 2 -> select "Wintun Userspace Tunnel" ->
"Next" -> "Install this software anyway" (since driver is not signed).

4. Make sure you see "Wintun Userspace Tunnel" under Device Manager ->
Network adapters.

5. Download cli_wintun.exe from
https://github.com/lstipakov/openvpn3/blob/feature/wintun-wip/cli_wintun.exe

6. Open command prompt as an administrator and run:

> C:\Users\Administrator\Downloads>cli_wintun.exe <your_vpn_profile.ovpn>

7. Enjoy!

-- 
-Lev

--0000000000007091790589508456
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>While wi=
ntun support is not yet added to openvpn3 master, I think it would be benef=
icial to share my own branch.</div><div><br></div><div><a href=3D"https://g=
ithub.com/lstipakov/openvpn3/tree/feature/wintun-wip#building-the-openvpn-3=
-client-on-windows">https://github.com/lstipakov/openvpn3/tree/feature/wint=
un-wip#building-the-openvpn-3-client-on-windows</a>=C2=A0=C2=A0<br></div><d=
iv><br></div><div>See instructions in README on how to build openvpn3 libra=
ry and test client on Windows.<br></div><div><br></div><div>Note that only =
&quot;topology subnet&quot; is supported (see=C2=A0<a href=3D"https://commu=
nity.openvpn.net/openvpn/wiki/Topology#Topologysubnet">https://community.op=
envpn.net/openvpn/wiki/Topology#Topologysubnet</a>).</div><div><br></div><d=
iv>I have included test client and wintun driver binaries if someone would =
like to try it out (Tested on Windows 10 and Windows Server 2016):</div><di=
v><br></div><div>1. Since wintun driver is not signed, you need to enable l=
oading of test signed code. For that, run</div><div><br></div><div>&gt;=C2=
=A0bcdedit /set testsigning</div><div><br></div><div>in admin command promp=
t and restart Windows.</div><div><br></div><div>2. Download and unzip wintu=
n driver=C2=A0<a href=3D"https://github.com/lstipakov/openvpn3/blob/feature=
/wintun-wip/wintun.7z">https://github.com/lstipakov/openvpn3/blob/feature/w=
intun-wip/wintun.7z</a></div><div><br></div><div>3. Open Device Manager (Co=
ntrol Panel\System and Security\System\Device Manager).=C2=A0</div><div>Rig=
ht click on tree root, select &quot;Add legacy hardware&quot; -&gt; &quot;N=
ext&quot; -&gt; &quot;.. hardware that I manually select from a list&quot; =
-&gt;=C2=A0</div><div>&quot;Next&quot; -&gt; &quot;Show all devices&quot; -=
&gt; &quot;Have Disk...&quot; -&gt; Locate wintun.inf unpacked at step 2 -&=
gt; select &quot;Wintun Userspace Tunnel&quot; -&gt;</div><div>&quot;Next&q=
uot; -&gt; &quot;Install this software anyway&quot; (since driver is not si=
gned).</div><div><br></div><div>4. Make sure you see &quot;Wintun Userspace=
 Tunnel&quot; under Device Manager -&gt; Network adapters.</div><div><br></=
div><div>5. Download cli_wintun.exe from <a href=3D"https://github.com/lsti=
pakov/openvpn3/blob/feature/wintun-wip/cli_wintun.exe">https://github.com/l=
stipakov/openvpn3/blob/feature/wintun-wip/cli_wintun.exe</a></div><div><br>=
</div><div>6. Open command prompt as an administrator and run:</div><div><b=
r></div><div>&gt; C:\Users\Administrator\Downloads&gt;cli_wintun.exe &lt;yo=
ur_vpn_profile.ovpn&gt;<br></div><div><br></div><div>7. Enjoy!</div></div><=
/div></div></div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">-Lev</div></div>

--0000000000007091790589508456--

--===============6363676663424153367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6363676663424153367==--
