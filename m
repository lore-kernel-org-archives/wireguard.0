Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA83C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 10:57:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FB876103B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 10:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FB876103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37284d55;
	Wed, 3 Nov 2021 10:53:19 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 637fbbd3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Oct 2021 21:07:03 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id n18so7620775plc.2
 for <wireguard@lists.zx2c4.com>; Fri, 29 Oct 2021 14:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=aSOZxhTvGFKPoodzyRcM1D6FF+LoYXMroeAUBB596wM=;
 b=IGhoqLB54kYt3pcwj4CX6L+fy1RAwTq4mRw+SR+Jy7A1vLPcZaoU98EnQJCyPuP9Xz
 joGhRecGrJ4bsIij4AKxIM0aYZRKxMF5o0ctyR1uR7XQeC8yMLCPbp/r50n0JEm0WLMj
 xm2T1UPPZuZ77ba9p8URDJspp10MoRbZ534GEjkAbEUL73cIe8Hu3UDlNojorvGG+AkQ
 mgkSUTDrh0Q6hdaiPyIM/2ICiTdLk7OGIK7vAMBTXEPTVmZj1jCLlAuyTkkkraGm8fkP
 EpcYJ8oZ7bIXgdMIByazmrF7KO3KLt8vhlNU2MtB3vB0c6Keo1cNpOx/ieP84kq8ZLzY
 1ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=aSOZxhTvGFKPoodzyRcM1D6FF+LoYXMroeAUBB596wM=;
 b=gRWMkaQVl8G5V2K1x1aGIUUr8F7WUScIrj9z2wvBQn9nx0W6k/SAY7mYsFtDwQW5e4
 uPPDcR2FsKHZHPTFejKwiHdMZudbHqZbfoLkvzNzGu+zo4wAUtiIxedZ9U9i4u1N7+py
 n/JJgMAt7MsyZv/R7OY9YS6rVCrueb0mylE77QslJaeGqlmCK22HRAoJgFKIC/D1Hasf
 PV3YdGaddnrz3Vw7JPF63fQjLxTadAiHQ6ZjyLC4uExCGoqzEMhtdct7eVKNa+Ax92Hb
 NErttW7wH3H2VniKGgiKuQPj4Qw8z1uJjAwSRGnIWYnnEblccQkjYarTXSw8ud8g+kbw
 VqBA==
X-Gm-Message-State: AOAM532OBqxzVFLFPpQofSqs13Ojn5kBOkFX8is4jHnYEmk/eVZiqbai
 KJx7INS1cOWxF8dvMVymmrC5/3cySQ5AobQc3/TBBiu2/rg=
X-Google-Smtp-Source: ABdhPJzmo7LZFO9LE25dK97T2Asa7I5zCLI8yUNH47Gq8Sev/TIW49bJrrt5Xb3BBtGIBL/4JKH2MBPuMiii/PALEok=
X-Received: by 2002:a17:902:d88c:b0:13f:f584:f630 with SMTP id
 b12-20020a170902d88c00b0013ff584f630mr11792900plz.58.1635541621260; Fri, 29
 Oct 2021 14:07:01 -0700 (PDT)
MIME-Version: 1.0
From: Matty Driessen <mhp.driessen@gmail.com>
Date: Fri, 29 Oct 2021 23:06:50 +0200
Message-ID: <CAHsVW7N2JA25KXDRM0ghNrn-9BZpuqY0OMHX4WTi7hmXjS9nGA@mail.gmail.com>
Subject: Re: Split DNS for macOS
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 03 Nov 2021 10:53:18 +0000
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello Andrew,

I just want to chime in here and say that I think the current
implementation of search domains is simply not working the way it
should on the MacOS client.

My use case is pretty common, an internal DNS server that has entries
for internal servers. I defined a search domain in the WireGuard
configuration; DNS =3D 10.13.13.1 mydomain.internal. The search domain
is for convenience, so I can just use the servername instead of
servername.mydomain.internal. Now this works fine when I route all the
traffic through the VPN (AllowedIPs =3D 0.0.0.0/0) but the search domain
is completely ignored when I only route the traffic I need to
(AllowedIPs =3D 10.13.13.0/24 192.168.0.0/24).

I don't think this is a configuration error on my side. The DNS
responds fine when using servername.mydomain.internal. This problem is
even mentioned in the "WireGuard macOS & iOS TODO List"
9. matchDomains=3D[=E2=80=9C=E2=80=9D] doesn=E2=80=99t do what the document=
ation says.
Specifically, DNS servers are not used if allowed IPs isn=E2=80=99t 0.0.0.0=
/0.

The description isn't 100% accurate (or outdated), the DNS server is
used but the search domain isn't being set on the primary resolver.
Some have solved this issue by adding the search domains to the list
of matchDomains; dnsSettings.matchDomains =3D [""] +
dnsSettings.searchDomains. But that way the DNS server specified in
WireGuard is still the primary resolver for all DNS queries.

Here is a link on how OpenVPN handles this and I think it's how it
should work when not using AllowedIPs 0.0.0.0/0.
https://openvpn.net/faq/how-does-ios-interpret-pushed-dns-servers-and-searc=
h-domains/
On a split-tunnel, where redirect-gateway is not pushed by the server,
and at least one pushed DNS server is present:
- route all DNS requests through pushed DNS server(s) if no added
search domains.
- route DNS requests for added search domains only, if at least one
added search domain.

Yours sincerely,
Matty

--

Hi Stephen,

A better solution to your problem would be to deploy DNSDIST:
        https://dnsdist.org/

I for one would hope that esoteric requests that address a solution
for less than 1% of the users would be rejected with the overall goal
of preventing feature creep and bloat.

Andrew
