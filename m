Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8B4C28D1D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:36:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4D0620684
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:36:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FN5rZB14"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4D0620684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 863a8a7d;
	Thu, 6 Jun 2019 09:36:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e94d186
 for <wireguard@lists.zx2c4.com>; Mon, 3 Jun 2019 18:05:06 +0000 (UTC)
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 644afe77
 for <wireguard@lists.zx2c4.com>; Mon, 3 Jun 2019 18:05:06 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id a27so1029023qkk.5
 for <wireguard@lists.zx2c4.com>; Mon, 03 Jun 2019 11:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=3hinAkBctEXbK2Ml8Rim9KFpN07r+rTz9cbvZzk2Mh4=;
 b=FN5rZB14nnAZIRnIzU3N99Jh56QKl3vxXczDhqimBs9glG6XZSRZDp1zUppBBlcf57
 VAyy6WQy1fnuOyFAdZStISPuVYb0NdwbEn1/EV5CzRL7Zy8/InCd6/igUxnxHgpjNhuj
 qPn2+2xqkSMs86if5YTuGD0pOvW3matmbL6GZ9NCyhiFz+Ar540QGZ+KFAcRb8rzfa10
 0YzDtvObBV1Ne5wlQPEJKLm7jHuGY0oBgBkbf1Ulz0nEmne/vmtpzEqRxDlOV+HZwbxE
 roiNqYOQgI5zwiZE4VN4z18hVAOG/PKE0OypWgv8fd1GihFCEKnLC/iKye/N5tpfW6/7
 f8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=3hinAkBctEXbK2Ml8Rim9KFpN07r+rTz9cbvZzk2Mh4=;
 b=axrpTpf7NeLndWha6BfworuXqUQv4gTUBIXpPN1GXgnxGFj19y7RAo5n3oNN6Vd6Ry
 KAFicblrPfcUuhIiqa2ZhC86AWLqVS7zbPGgCFjwYv+PuiKKhKedw/+GPVKguecwwgFS
 8fNzaTc8zINkjF7ETyaMpDGuQhb4iDq694LdlDhsxdF8S1c46yXt4AaJKerVCIpnB+nj
 kDn6IBfOx+WF2Wdf8pvLU2FpGt87kQQ8e8uf4jgWrZEJ+X4On3aRvXnoQv2+ClsmznZA
 OENyBGlvQW/vDk6qgB7hhKfWWsdkzFwl8uT2+6XxB8M4w5z3U8F9vpw+k2ICsVxjJl6F
 2S6Q==
X-Gm-Message-State: APjAAAVJGx5hmRJua3hg7brXE4EothJOaZiF5Y8O+EzlKhVwjm22SHWB
 /y5s3cUNeoB9ImCu+k69xBJbjNF0D8/5OH13XQk=
X-Google-Smtp-Source: APXvYqy/u5UyzkSef7sBe5wVNtVp/JwqUTFZ1PWAnzKTlDytq9RYT6p9Vz5AFMwOBWlNfA1sdERAP/cqJkdHX0NXNtM=
X-Received: by 2002:a37:2f87:: with SMTP id v129mr4308643qkh.151.1559585106115; 
 Mon, 03 Jun 2019 11:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAGyAFMV=HvOYDRSB7eRpBDp-47wX2vie8JPgp48in1fH+eXn=A@mail.gmail.com>
 <CAFHpkQFVpN-+Uoc6QsLmD8hjwEC7Ba1Q2SP4SuS_EMu_PT=3nw@mail.gmail.com>
 <7bdf712d-4e0c-0667-c9eb-1bdd862b1e40@sf.lists.topphemmelig.net>
 <bfead88f-3e91-6d49-ea70-e73f626468f1@nikhef.nl>
 <CAGyAFMW10tUVswPa8NfVieUJMm1oX1BFQaa9a0GP3NmgWpRshg@mail.gmail.com>
 <CAGyAFMWODccNnD+yby7HrOUfdDFaceC3AX70+jG9_hL9vF=q+A@mail.gmail.com>
In-Reply-To: <CAGyAFMWODccNnD+yby7HrOUfdDFaceC3AX70+jG9_hL9vF=q+A@mail.gmail.com>
From: Lev Stipakov <lstipakov@gmail.com>
Date: Mon, 3 Jun 2019 21:04:53 +0300
Message-ID: <CAGyAFMUqqjF67DDdr+BQXvFU515_zK=fDehUJH1TF+zjyjuiAA@mail.gmail.com>
Subject: Re: [Openvpn-devel] Wintun performance results
To: openvpn-devel <openvpn-devel@lists.sourceforge.net>,
 wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 06 Jun 2019 11:36:07 +0200
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
Content-Type: multipart/mixed; boundary="===============3239693521800776973=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3239693521800776973==
Content-Type: multipart/alternative; boundary="0000000000003f4325058a6f348c"

--0000000000003f4325058a6f348c
Content-Type: text/plain; charset="UTF-8"

Hi,

Here you can get the latest binary of openvpn3 test Windows client with
both wintun and tap-windows6 support.

https://ci.appveyor.com/project/openvpn/openvpn3/build/artifacts

To use it with wintun, open admin command prompt and run:

> cli.exe -w profile.ovpn

To use tap-windows6, just omit "-w" switch.

Please note that this is a development tool first of all, not a client to
be consumed by most of users.

-Lev

--0000000000003f4325058a6f348c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>Here you can get t=
he latest binary of openvpn3 test Windows client with both wintun and tap-w=
indows6 support.</div><div><br></div><div><a href=3D"https://ci.appveyor.co=
m/project/openvpn/openvpn3/build/artifacts">https://ci.appveyor.com/project=
/openvpn/openvpn3/build/artifacts</a>=C2=A0</div><div><br></div><div>To use=
 it with wintun, open admin command prompt and run:</div><div><br></div><di=
v>&gt; cli.exe -w profile.ovpn<br></div><div><br></div><div>To use tap-wind=
ows6, just omit &quot;-w&quot; switch.</div><div><br></div><div>Please note=
 that this is a development tool first of all, not a client to be consumed =
by most of users.=C2=A0</div><div><br></div><div>-Lev</div></div></div>

--0000000000003f4325058a6f348c--

--===============3239693521800776973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3239693521800776973==--
