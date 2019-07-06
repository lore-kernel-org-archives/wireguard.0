Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A876C76195
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:43:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF9812184E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:43:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDiCUFAE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF9812184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05670b51;
	Wed, 17 Jul 2019 20:41:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ae8003b
 for <wireguard@lists.zx2c4.com>; Sat, 6 Jul 2019 11:15:59 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79cee081
 for <wireguard@lists.zx2c4.com>; Sat, 6 Jul 2019 11:15:59 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b17so4275053lff.7
 for <wireguard@lists.zx2c4.com>; Sat, 06 Jul 2019 04:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wjl6WNmjyq9Yi5L5gg4M8H2ZXTW+IJvpTI6qJmsZFsU=;
 b=fDiCUFAEg4iBEXEcwHlhcejVxPd+FszzlDdqJ6GnaOjmgRwJvFWAWARSwH9iwVMr8g
 Q7/O61g5RQkArF2L3tZYVGYnPUxAXQPJjH/GyVvQ3wBLC5iZD51HGqLkZ4oQCRZnlG+a
 HsuTOU5LJApOGbEJPyazmJ+lo//l9qyxMBeiGg1jTvdeeXivXZHd8u1DYOhwQ5mlbB9h
 jzP/QLDMo7vQjgfzzxbsfdvz32oTJn4loaNkzOuFP9gjm1LcoW1tuuru+FnxfiM6FzBI
 9z1zb1wzlTakels0qo3I1vqaqaabN9RWvNdgCjsBKtzZEwo7Ggdz6MBGzV2NAKUXTybz
 AnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wjl6WNmjyq9Yi5L5gg4M8H2ZXTW+IJvpTI6qJmsZFsU=;
 b=rp18a74DB6WnPWHuadrijFAfr9vAhrkTwCCg98n1wcfCDX+ELnJdz3s8U+xydrnkTq
 kJrfUbJrDq2gBdYgyG5fQ+eeCcB922tA/p+n3Ss+UABi+CQBY6nH5FZPIAMaoRkryiFl
 vtEjVO38/uPlvBRiBhs4qw+7lOdYHbEMleLbYsRvbpc6n7+U1dcRG5holglbcT2meV7a
 akE+doR7rLxIiZP09bRmI6/H478bhTaL3WX+oD3bg2TdtVAsvGEcsUx/LYRyU4p5IlMe
 l/Hadb/sHKs/U0TIxCDbfuv6ZQcMs6FybitLnS4fxR0RcEJUU6A2HPQqL+ZZiZEUbxcN
 5jug==
X-Gm-Message-State: APjAAAWq/8a2TfojXoyIpF0xe0CONWSLEY08gd5054CNCNYnuIEn/mcr
 +SHmnqcwAX5JR0VkgUKknN1nMKIIbCkq5sksElY6YB9lg/I=
X-Google-Smtp-Source: APXvYqyoWgNZuavQJppnhej9P6725ob/8ELgPrWvAMxEnev7IhjCEYhtMnnDYlFcaVsVnSsivmtGSRbpdrn0GbfcVzo=
X-Received: by 2002:a19:c514:: with SMTP id w20mr3411230lfe.182.1562411757012; 
 Sat, 06 Jul 2019 04:15:57 -0700 (PDT)
MIME-Version: 1.0
From: "Berend D." <cyberwizzard@gmail.com>
Date: Sat, 6 Jul 2019 13:15:46 +0200
Message-ID: <CAJBx0EO-oYFbu11BfGatcgVExBztN2D7S2zudjAt_iFGhjVjyQ@mail.gmail.com>
Subject: Trouble with WG on Synology NAS
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 17 Jul 2019 22:41:39 +0200
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
Content-Type: multipart/mixed; boundary="===============3705783879482144454=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3705783879482144454==
Content-Type: multipart/alternative; boundary="000000000000c50ae7058d01551a"

--000000000000c50ae7058d01551a
Content-Type: text/plain; charset="UTF-8"

I am using WireGuard on my Synology 415+ NAS which runs Linux kernel
3.10.105.

I tried a couple versions of wireguard now, using
https://github.com/runfalk/synology-wireguard as inspiration to compile
them, but none of them seem to work.

The problem I experience is that everything is seemingly correctly set up
(I have a Linux server elsewhere to compare configs with) but after
connecting to Wireguard, the server only seems to be able to receive
packets, not send them: when pinging the NAS I can see the ifconfig RX
packet counter go up, and at the same time the TX error counter as well.

wg0       Link encap:UNSPEC  HWaddr
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet addr:192.168.33.1  P-t-P:192.168.33.1  Mask:255.255.255.0
          UP POINTOPOINT RUNNING NOARP  MTU:1420  Metric:1
          RX packets:5 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2 errors:21 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:564 (564.0 B)  TX bytes:124 (124.0 B)

I ran over my config multiple times now but I can not spot a difference to
my working setup on the other server. I also tried various clients
(Android, Ubuntu, Windows 10 both the WG client and an alternative
implementation).

Tested versions:
- 0.0.20190227-2
- 0.0.20190601
- 0.0.20190 <https://git.zx2c4.com/WireGuard/tag/?h=0.0.20190601>702

The only thing the Synology build changes is to force memneq on since its
not supported (the 'ifeq' in Kbuild.include is removed via patch so its
always included).

I can not find a way to make it all more verbose to figure out why the
packets are dropped by WG.

What can I try to debug this?

Cheers,
Berend

--000000000000c50ae7058d01551a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am using WireGuard on my Synology 415+ NAS which runs Li=
nux kernel 3.10.105.<div><br></div><div>I tried a couple versions of wiregu=
ard now, using=C2=A0<a href=3D"https://github.com/runfalk/synology-wireguar=
d">https://github.com/runfalk/synology-wireguard</a>=C2=A0as inspiration to=
 compile them, but none of them seem to=C2=A0work.</div><div><br></div><div=
>The problem I experience is that everything is seemingly correctly set up =
(I have a Linux server elsewhere to compare configs with) but after connect=
ing to Wireguard, the server only seems to be able to receive packets, not =
send them: when pinging the NAS I can see the ifconfig RX packet counter go=
 up, and at the same time the TX error counter as well.</div><div><br></div=
><div>wg0 =C2=A0 =C2=A0 =C2=A0 Link encap:UNSPEC =C2=A0HWaddr 00-00-00-00-0=
0-00-00-00-00-00-00-00-00-00-00-00<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in=
et addr:192.168.33.1 =C2=A0P-t-P:192.168.33.1 =C2=A0Mask:255.255.255.0<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP POINTOPOINT RUNNING NOARP =C2=A0MTU:1=
420 =C2=A0Metric:1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:5 error=
s:0 dropped:0 overruns:0 frame:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX p=
ackets:2 errors:21 dropped:0 overruns:0 carrier:0<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 collisions:0 txqueuelen:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 RX bytes:564 (564.0 B) =C2=A0TX bytes:124 (124.0 B)<br></div><div><br><=
/div><div>I ran over my config multiple times now but I can not spot a diff=
erence to my working setup on the other server. I also tried various client=
s (Android, Ubuntu, Windows 10 both the WG client and an alte<font face=3D"=
arial, sans-serif">rnative implementation).</font></div><div><font face=3D"=
arial, sans-serif"><br></font></div><div><font face=3D"arial, sans-serif">T=
ested versions:</font></div><div><font face=3D"arial, sans-serif"><span sty=
le=3D"color:rgb(3,47,98);white-space:pre">- 0.0.20190227-2</span>=C2=A0</fo=
nt></div><div><font face=3D"arial, sans-serif">-=C2=A00.0.20190601</font></=
div><div><font face=3D"arial, sans-serif">-=C2=A0</font><a href=3D"https://=
git.zx2c4.com/WireGuard/tag/?h=3D0.0.20190601" style=3D"color:black;text-de=
coration-line:none;font-family:sans-serif;font-size:13.3333px;white-space:n=
owrap;background-color:rgb(247,247,247)">0.0.20190</a>702</div><div><br></d=
iv><div>The only thing the Synology build changes is to force memneq on sin=
ce its not supported (the &#39;ifeq&#39; in Kbuild.include is removed via p=
atch so its always included).</div><div><br></div><div>I can not find a way=
 to make it all more verbose to figure out why the packets are dropped by W=
G.</div><div><br></div><div>What can I try to debug this?</div><div><br></d=
iv><div>Cheers,</div><div>Berend</div><div>=C2=A0<br></div></div>

--000000000000c50ae7058d01551a--

--===============3705783879482144454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3705783879482144454==--
