Return-Path: <SRS0=sgLz=TL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9A8C04AB1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:10:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07222173B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O79QYbAM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B07222173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf7c62ef;
	Sat, 11 May 2019 13:10:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af22802f
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 19:13:22 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76eead07
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 19:13:22 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id f7so18318821wrq.1
 for <wireguard@lists.zx2c4.com>; Wed, 08 May 2019 12:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:to:from:subject:date:importance;
 bh=K0B6TRNfj8Ku/KRsHB3g3HjASHji/QVFO7qwCgmZAF8=;
 b=O79QYbAMSHWjTGVRCaU3DO9zU6IpkxuhfjVs0AclR6Qnqbln4af3DPgZ+EEl4Oq1mm
 Dz2nNUPZOLtClufL5KRmfR1hoyzT7Sb7oNXfjfCHLVn3zQ7giZJLl43jUTjyx1oQBMPt
 kMrOAhZ/RsI/9fCSaajTh3UfMt24dLhWeLqa+WdxvTEq43zCpDvLAMb8ctp7sWEKzvtY
 SYMg4vyu+npNlXID38muyigMzsg3K0Y13CecLL5KA3y4TG5H/9MkTp72W1H8LsG17qlj
 TOYr86QhLCYKrZKyzNDSwF6k1YWsctqeNOSTtKbsxte8Ah70aRLmgHJKiUbQWn3RqIk3
 erdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:to:from:subject:date
 :importance;
 bh=K0B6TRNfj8Ku/KRsHB3g3HjASHji/QVFO7qwCgmZAF8=;
 b=gF84+Sg6w3EMiH2c0WsqrdSGbHJGpRifgIZjWu6n9dpgnpVWUkv3NALqw16bP2CUpV
 hOx+MFmmXNBEhVzX4rJwIU7WJMJHoqq3HWzEGy6hQEPSc4ibFja8xlu0L877QLrRjDIE
 6XieJsbGm9Bc+corV5UKkTLW+64aOMEXIh/qq+n8Abqy1ZdMb4IXeTrwRtfmht+qcqIc
 iDCmk0zevv6wyAaas3QYB5y7+U7K7zQCnxKfDa0ViVNjKx79kDbEOEs+HYFKOy9A+Bq2
 GPk+FxCXezEcOwaAWt46UfDwWVb/53OsXw9zXNYfuOZMN96GNuz7yB/qdf6T+5aOdS+U
 lK0A==
X-Gm-Message-State: APjAAAXKmEg3pBz6OD7HXygey6locmDGyGasAbufGGVONDnUB5jhNcin
 R41IUpsTnwRB6+ktC/CGkLd2xAxvh16kGg==
X-Google-Smtp-Source: APXvYqyTAiPFMDO9Nu8zgxuvN05DtSCw3FqhB4WTMI/HrwogbzbPNfzcugHw89dj2qYxu6jqcKqZUQ==
X-Received: by 2002:adf:eb0c:: with SMTP id s12mr26995663wrn.229.1557342801716; 
 Wed, 08 May 2019 12:13:21 -0700 (PDT)
Received: from ?IPv6:::ffff:192.168.0.10?
 (cpc87337-slou4-2-0-cust92.17-4.cable.virginm.net. [81.97.164.93])
 by smtp.gmail.com with ESMTPSA id g3sm4117040wmf.9.2019.05.08.12.13.21
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 12:13:21 -0700 (PDT)
Message-ID: <5cd32a51.1c69fb81.6fcd6.4f9d@mx.google.com>
MIME-Version: 1.0
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: D Neiroukh <officiallazerl0rd@gmail.com>
Subject: BUG: When building on RHEL 8, duplicate function
Date: Wed, 8 May 2019 20:13:21 +0100
Importance: normal
X-Priority: 3
X-Mailman-Approved-At: Sat, 11 May 2019 15:10:06 +0200
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
Content-Type: multipart/mixed; boundary="===============3246130436585821461=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3246130436585821461==
Content-Type: multipart/alternative;
	boundary="_88D066AD-26DA-403D-A37B-3FDD724824E2_"

--_88D066AD-26DA-403D-A37B-3FDD724824E2_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

I insmod=E2=80=99d the UDP tunnel module for both IPv4 and IPv6 then...

During a build on RHEL 8 I came across this:

In file included from <command-line>:
/home/****/WireGuard/src/compat/compat.h:815:20: error: redefinition of =E2=
=80=98skb_mark_not_on_list=E2=80=99
static inline void skb_mark_not_on_list(struct sk_buff *skb)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~
In file included from /home/****/WireGuard/src/compat/compat.h:777,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 from <command-line>:
./include/linux/skbuff.h:1362:20: note: previous definition of =E2=80=98skb=
_mark_not_on_list=E2=80=99 was here
static inline void skb_mark_not_on_list(struct sk_buff *skb)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~
make[2]: *** [scripts/Makefile.build:316: /home/s34cr/WireGuard/src/main.o]=
 Error 1
make[1]: *** [Makefile:1528: _module_/home/s34cr/WireGuard/src] Error 2
make: *** [Makefile:37: module] Error 2

I nullified the first definition:

#if 0
static inline void skb_mark_not_on_list(struct sk_buff *skb)
{
       skb->next =3D NULL;
}
#endif

And left the second (the include):
#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 1, 0)
#include <linux/skbuff.h>=20
#define skb_probe_transport_header(a) skb_probe_transport_header(a, 0)
#endif

In order to build. I would like to state RHEL 8 builds with GCC 8.2.1 if th=
at=E2=80=99s any help too. Seems I cannot connect, however. Will try removi=
ng the include in the second one.

Seems somewhere in between the RHEL kernel upgrade to 4.18 that function go=
t added in.


--_88D066AD-26DA-403D-A37B-3FDD724824E2_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-GB><div class=3DWordSection1><p class=3DM=
soNormal>I insmod=E2=80=99d the UDP tunnel module for both IPv4 and IPv6 th=
en...<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMs=
oNormal>During a build on RHEL 8 I came across this:<o:p></o:p></p><p class=
=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>In file included fro=
m &lt;command-line&gt;:<o:p></o:p></p><p class=3DMsoNormal>/home/****/WireG=
uard/src/compat/compat.h:815:20: error: redefinition of =E2=80=98skb_mark_n=
ot_on_list=E2=80=99<o:p></o:p></p><p class=3DMsoNormal>static inline void s=
kb_mark_not_on_list(struct sk_buff *skb)<o:p></o:p></p><p class=3DMsoNormal=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~~~~~<o:p></o:p></p=
><p class=3DMsoNormal>In file included from /home/****/WireGuard/src/compat=
/compat.h:777,<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fro=
m &lt;command-line&gt;:<o:p></o:p></p><p class=3DMsoNormal>./include/linux/=
skbuff.h:1362:20: note: previous definition of =E2=80=98skb_mark_not_on_lis=
t=E2=80=99 was here<o:p></o:p></p><p class=3DMsoNormal>static inline void s=
kb_mark_not_on_list(struct sk_buff *skb)<o:p></o:p></p><p class=3DMsoNormal=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~~~~~<o:p></o:p></p=
><p class=3DMsoNormal>make[2]: *** [scripts/Makefile.build:316: /home/s34cr=
/WireGuard/src/main.o] Error 1<o:p></o:p></p><p class=3DMsoNormal>make[1]: =
*** [Makefile:1528: _module_/home/s34cr/WireGuard/src] Error 2<o:p></o:p></=
p><p class=3DMsoNormal>make: *** [Makefile:37: module] Error 2<br><br>I nul=
lified the first definition:<br><br>#if 0<o:p></o:p></p><p class=3DMsoNorma=
l>static inline void skb_mark_not_on_list(struct sk_buff *skb)<o:p></o:p></=
p><p class=3DMsoNormal>{<o:p></o:p></p><p class=3DMsoNormal style=3D'text-i=
ndent:36.0pt'>skb-&gt;next =3D NULL;<o:p></o:p></p><p class=3DMsoNormal>}<o=
:p></o:p></p><p class=3DMsoNormal>#endif<o:p></o:p></p><p class=3DMsoNormal=
><o:p>&nbsp;</o:p></p><p class=3DMsoNormal style=3D'margin-bottom:12.0pt'>A=
nd left the second (the include):<o:p></o:p></p><p class=3DMsoNormal>#if LI=
NUX_VERSION_CODE &lt; KERNEL_VERSION(5, 1, 0)<br>#include &lt;linux/skbuff.=
h&gt; <br>#define skb_probe_transport_header(a) skb_probe_transport_header(=
a, 0)<o:p></o:p></p><p class=3DMsoNormal>#endif<br><br>In order to build. I=
 would like to state RHEL 8 builds with GCC 8.2.1 if that=E2=80=99s any hel=
p too. Seems I cannot connect, however. Will try removing the include in th=
e second one.<br><br>Seems somewhere in between the RHEL kernel upgrade to =
4.18 that function got added in.<o:p></o:p></p><p class=3DMsoNormal><o:p>&n=
bsp;</o:p></p></div></body></html>=

--_88D066AD-26DA-403D-A37B-3FDD724824E2_--


--===============3246130436585821461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3246130436585821461==--

