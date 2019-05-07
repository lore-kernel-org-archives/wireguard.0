Return-Path: <SRS0=sgLz=TL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61622C04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:08:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE8802173B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:08:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=swtk.info header.i=@swtk.info header.b="i8JOWhFp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE8802173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=swtk.info
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 745f10a6;
	Sat, 11 May 2019 13:07:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a13c18d4
 for <wireguard@lists.zx2c4.com>; Tue, 7 May 2019 12:36:45 +0000 (UTC)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 534650bd
 for <wireguard@lists.zx2c4.com>; Tue, 7 May 2019 12:36:45 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id 143so12224405oii.4
 for <wireguard@lists.zx2c4.com>; Tue, 07 May 2019 05:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swtk.info; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=jv0sd1sOQHIN7jkNr51PcCI6+hhvIcIAJ2PwqHUeivQ=;
 b=i8JOWhFpAFdFIIJOZNhotYK99eaZLlIw7KeQII2npcih8pO9wquEIgFkctd2L1E4xI
 SU3xXV3M3LMq5lBdkTSPaFfe71VlxZp7Ln9kj7/CwPzliyizw26PiYiqORU9MuNo/C4+
 npRzqk4xtGUxku/fpNaahfJAsdYm1whH8in0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jv0sd1sOQHIN7jkNr51PcCI6+hhvIcIAJ2PwqHUeivQ=;
 b=YPaJKGWqrNfGIK/VHpwizlGEYJEDpY3iI8PC/xmj353YOmoOa7RJJVbC69XwygYg3l
 Q/4Hb3Ke0juawKqlMGG+nu2Iha+G9t+72bASLEdrXyed4xB8DhmX0UX/oF6lXjBGkbGE
 Gt8XvlO7lAbxYjr/za92QPhHctwEI4UN8zPbjxJaWp3cBXCb2XqrLC0EF6eqhZa17x/K
 4tRzy15TElzrRVxUlKdzDpLh3Nf5w2REpwXKO/6i18hY5M30CpkO8TFDgpt/u25eUk0y
 2DaP3WZFrhytVneXnNU/cdsufjbzuG+JNqE141kebEkA8y+ljYDloUUBEmQ5tbsQmhDX
 T2qQ==
X-Gm-Message-State: APjAAAUGv+JhBFiN1hHk7zMv496Zvn1TaTUG2WY/ZEXfGb76THIWDBR7
 ufCRRMjjMziQlNYi3NXsB8nw5wnQ1N07xv918Z2bE984rxI=
X-Google-Smtp-Source: APXvYqz6QJY7ji86uACmIVrFjCC1QG4vBT0/kJMBbsSDFWaIN/jJuNXOSCUoJQX4ctugZ/K8tIRcz4lzj6KYFblxkPI=
X-Received: by 2002:aca:7585:: with SMTP id q127mr4141oic.166.1557232604375;
 Tue, 07 May 2019 05:36:44 -0700 (PDT)
MIME-Version: 1.0
From: Wojtek Swiatek <w@swtk.info>
Date: Tue, 7 May 2019 14:36:08 +0200
Message-ID: <CAPRYYOaqQsyWsnvZDu3=OQ+DMBLDcn2CtNf9_7WuKsV5tLfr9w@mail.gmail.com>
Subject: wireguard forces its host DNS on clients (?)
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 11 May 2019 15:07:56 +0200
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
Content-Type: multipart/mixed; boundary="===============0851391378682570336=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0851391378682570336==
Content-Type: multipart/alternative; boundary="0000000000003781f405884b78b1"

--0000000000003781f405884b78b1
Content-Type: text/plain; charset="UTF-8"

Hello

I set up Wireguard to connect an Ubuntu machine (client) to a Ubuntu
server. Everything works fine, except that when the VPN is up the DNS on
the client machine is forced to (apparently) the DNS of the host the
Wireguard server is on.

- when the VPN is down, the client machine has its DHCP provided DNS
servers set up
- when the VPN is up, the DNS is changed to the DNS of the VPN server host

How can this behaviour be switched off?

I tried to add a DNS = 127.0.0.1 entry on the client [Interface] definition
(to use a locally available DNS server) but it did not change anything
(after rebooting just in case).

--0000000000003781f405884b78b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello<div><br></div><div>I set up Wireguard to connect an =
Ubuntu machine (client) to a Ubuntu server. Everything works fine, except t=
hat when the VPN is up the DNS on the client machine is forced to (apparent=
ly) the DNS of the host the Wireguard server is on.</div><div><br></div><di=
v>- when the VPN is down, the client machine has its DHCP provided DNS serv=
ers set up</div><div>- when the VPN is up, the DNS is changed to the DNS of=
 the VPN server host</div><div><br></div><div>How can this behaviour be swi=
tched off?</div><div><br></div><div>I tried to add a DNS =3D 127.0.0.1 entr=
y on the client [Interface] definition (to use a locally available DNS serv=
er) but it did not change anything (after rebooting just in case).</div><di=
v><br></div></div>

--0000000000003781f405884b78b1--

--===============0851391378682570336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0851391378682570336==--
