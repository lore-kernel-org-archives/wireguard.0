Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438D8C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 26 Nov 2021 07:33:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 872f5125;
	Fri, 26 Nov 2021 07:33:25 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4d228f33
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Nov 2021 07:33:23 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id n8so6141325plf.4
 for <wireguard@lists.zx2c4.com>; Thu, 25 Nov 2021 23:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=nb3DRmXxjriXnfPM03u6t7XCsRe0JcvsPA4yi3R4MYY=;
 b=beHkuRBH3w4CyjkRMe/77wKXapnGR+4E3Iv5nccn/jTNTL7Oqj7Ok13XvJPt5l2mFE
 HzkPFQ0rIFzUnT+2X3GMdpLhrAjeJv5l/pG8RnyDmD4OcW54D5R3hJGegZQhqObIMzco
 57Uom4JdqeItpZvNZbJ0/yGbrLdfJEv/7i2F2H4xe1L3w6qpb08la4mIk9kgLPNWPLJs
 0eclgcvwO99nRlIR/2QPcxwYhRRFGD6ZKIpjqVKwcDMIe+PwWIxlm/fgdJE8JCstN1cn
 2RT19nTN84w+QCD3Uu00PuPJ2orMpkGLFTg5EoKKItr3/3yV1VYiutYb+Q5gzaRQuqH6
 UC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=nb3DRmXxjriXnfPM03u6t7XCsRe0JcvsPA4yi3R4MYY=;
 b=IdCs9fBI8rm6z1Hgf575MDzdYBelvQMAdBWz2CFJDEj2JVNCIlG0ascbJNXJcuO8Q4
 dgkNCtHDo9jmg8o+Nidvh0TnN8XCZoPsWmvHucwl4mwBNoWbCjzeNODzgngGLra6cIiF
 Q2p8/A7uMXw0iQc8Fsuu9MkIYWoXNwZidOFWcFMb5FOXxUCQHSkLkqTGyRj60jxw6nsQ
 oCJ3GJxQQ7W7eyjcre7J2+oXXEeVCzofrFj0EMeC9uWZM4JHe3xtjpq9PHMBCt55KJPs
 ZHbqTZ9+TEtSYZ0csmk1gIF8uAF7UAam13pQpK6IJBhHbeCb7dmck+WQe8TNRR2QLN+q
 CHAA==
X-Gm-Message-State: AOAM530PYumi2SY30RSqtpLTa5ODjnyIhUR7QR8lRNF/oAftajc4Z4C3
 l5xfbqhkj9tV3/GHBNxXKtzDQMPKBzCRKWuD
X-Google-Smtp-Source: ABdhPJw27hneLFtUP6GeCVHpdepKvgazCssOYPCiljVsCFeBQabos9f3e3JnhyKXh69J11lu6EPC9w==
X-Received: by 2002:a17:903:2093:b0:142:7dff:f7de with SMTP id
 d19-20020a170903209300b001427dfff7demr36769613plc.75.1637912001705; 
 Thu, 25 Nov 2021 23:33:21 -0800 (PST)
Received: from smtpclient.apple
 (108-206-116-173.lightspeed.frokca.sbcglobal.net. [108.206.116.173])
 by smtp.gmail.com with ESMTPSA id y10sm5367431pfl.21.2021.11.25.23.33.20
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Nov 2021 23:33:21 -0800 (PST)
From: Andrii Petrenko <aplsms@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Wireguard DNS error. 
Message-Id: <FDA1FABB-8432-4259-BFF5-ED3E7EB632C3@gmail.com>
Date: Thu, 25 Nov 2021 23:33:18 -0800
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3693.20.0.1.32)
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

Hello, I have a problem with Wireguard DNS proxy.

Issue looks like:=20

Trough DNS proxy

$ host presence.teams.microsoft.com.                                     =
                                                                         =
                             =20

Host presence.teams.microsoft.com not found: 2(SERVFAIL)

Trough the upstream DNS server:

$ host presence.teams.microsoft.com. 10.10.10.1=20
Using domain server:
Name: 10.10.10.1
Address: 10.10.10.1#53
Aliases:

presence.teams.microsoft.com is an alias for =
presence.services.sfb.trafficmanager.net.
presence.services.sfb.trafficmanager.net is an alias for =
a-ups-presence0-prod-azsc.eastus2.cloudapp.azure.com.
a-ups-presence0-prod-azsc.eastus2.cloudapp.azure.com has address =
52.114.142.202

Logs from server:=20

time=3D"2021-11-26T02:33:56Z" level=3Ddebug msg=3D"dns query: dns query =
for: presence.teams.microsoft.com.:1:1" file=3D"server.go:70"
time=3D"2021-11-26T02:33:56Z" level=3Derror msg=3D"failed lookup record =
with error: dns: overflowing header size\n;; opcode: QUERY, status: =
NOERROR, id: 53952\n;; flags: rd; QUERY: 1, ANSWER: 0, AUTHORITY: 0, =
ADDITIONAL: 0\n\n;; QUESTION =
SECTION:\n;presence.teams.microsoft.com.\tIN\t A\n" file=3D"server.go:76"

Another error:

$ host ocsp2.apple.com
Host ocsp2.apple.com not found: 2(SERVFAIL)

$ host ocsp2.apple.com 10.10.10.1
Using domain server:
Name: 10.10.10.1
Address: 10.10.10.1#53
Aliases:

ocsp2.apple.com is an alias for ocsp2-lb.apple.com.akadns.net.
ocsp2-lb.apple.com.akadns.net is an alias for ocsp2.g.aaplimg.com.
ocsp2.g.aaplimg.com has address 17.253.5.203
ocsp2.g.aaplimg.com has address 17.253.1.201
ocsp2.g.aaplimg.com has IPv6 address 2620:149:a00:f000::5
ocsp2.g.aaplimg.com has IPv6 address 2620:149:a1c:f000::1


time=3D"2021-11-26T02:32:17Z" level=3Ddebug msg=3D"dns query: dns query =
for: ocsp2.apple.com.:1:1" file=3D"server.go:70"
time=3D"2021-11-26T02:32:17Z" level=3Derror msg=3D"failed lookup record =
with error: dns: overflow unpacking uint32\n;; opcode: QUERY, status: =
NOERROR, id: 18718\n;; flags: rd; QUERY: 1, ANSWER: 0, AUTHORITY: 0, =
ADDITIONAL: 0\n\n;; QUESTION SECTION:\n;ocsp2.apple.com.\tIN\t A\n" =
file=3D"server.go:76=E2=80=9D


How to fix this problem? Please advise.

Thank you,
---
Andrii Petrenko
aplsms@gmail.com=09

