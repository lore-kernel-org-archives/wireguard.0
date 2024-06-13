Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F71DC27C4F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Jun 2024 14:34:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87377fd4;
	Thu, 13 Jun 2024 14:34:41 +0000 (UTC)
Received: from cynic.org (harbard.cynic.org [75.144.22.203])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0022fa30
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2024 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cynic.org;
 s=default; t=1718289279;
 bh=ZrZVMDn9JmOvArXQpWiM69qEw26hyhAfK09aJNtrM1k=;
 h=From:Subject:Date:To;
 b=gxY0vFiz4JVi5OJ3N6PlbVim13ulzN+1S7H6MMjVNpb6obRe5eM5C9gvW5KmwZhCv
 R2ZdpzX24ZRqj5O/MgJhdQEHkMsDX1rA52O/NPn/9RptNpPK4As5SHqL204OgA1HdH
 NiXpRGJ3M4VrO3fZ3y9wbmPsz+sNrqKv3LJFMDvwj8485zTIATr7kkzCPFjM4V7i0+
 qq83yvGtWhTSU9LNDZM+6J64zQ+myMPkC9pGNP3XFgdLHFwPSDKHoDgT2R52JB8Bgm
 93NBRi8zP6TrYlBklN6YxPtVh9mAIpShaIi+w3yDdWnazN5hICTspK6t+rfiSVklRM
 9Hw+cCpW3V7fw==
X-Default-Received-SPF: pass (skip=loggedin (res=PASS)) x-ip-name=10.10.10.100;
 envelope-from=<perry@cynic.org>; 
Received: from smtpclient.apple (unverified [10.10.10.100]) 
 by cynic.org (SurgeMail 7.8b) with ESMTP (TLS) id 10681-1278429 
 for <wireguard@lists.zx2c4.com>; Thu, 13 Jun 2024 07:34:38 -0700
From: Perry The Cynic <perry@cynic.org>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Wireguard, iPhone, and cruise ships
Message-Id: <60B826FA-3FCA-40B5-9771-8FFEDA6278AB@cynic.org>
Date: Thu, 13 Jun 2024 07:34:32 -0700
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Qnum: 10681
X-Authenticated-User: perry@cynic.org 
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

Dear wg community,

I recently enjoyed a cruise to Alaska. Fun and easy, and with Starlink =
on board, the WiFi connectivity was actually not bad (some sporadic =
packet drops, mostly). Sadly, the cruise company=E2=80=99s network =
unceremoniously drops UDP of most kinds, leading to my Wireguard VPN (to =
my inside network at home) failing entirely. The cruise line is utterly =
immovable on this: =E2=80=9Cit=E2=80=99s someone else=E2=80=99s fault, =
and how dare you want to do this nonstandard thing?=E2=80=9D Yes, I =
actually talked to their onboard IT guy. =E2=80=9CIt=E2=80=99s on the =
network path somewhere, and they don=E2=80=99t even tell me how and =
why."

Now I totally understand Wireguard=E2=80=99s attitude towards this: =
It=E2=80=99s not a =E2=80=9Ccore=E2=80=9D wg problem, and should be =
solved on the outside by whatever tools happen to fit the problem. If =
this was a linux-to-linux connection, I=E2=80=99d just pop in my =
favorite TCP-ish tunnel tool and move on. But it=E2=80=99s an iPhone =
(and iPad). And iOS doesn=E2=80=99t seem to like network composability. =
At all. Once you move outside the =E2=80=9Cit=E2=80=99s a VPN =
endpoint=E2=80=9D paradigm, things get stuck very quickly. I realize =
this is all Apple=E2=80=99s fault, and they should allow building =
arbitrary network stacks in iOS. But they don=E2=80=99t (yet). =
NWConnection is getting pretty good, but it requires in-app code =
composition. AFAIK, you can=E2=80=99t stack two iOS VPNs on top of each =
other (right?).

So what are the practically available options here? I can set up =
whatever is needed on the server endpoint (it=E2=80=99s Debian), but =
what can I do on my phone to make wg work through an HTTP(s)-shaped =
pinhole? I=E2=80=99d hate to have to ditch wg for some other vpn just =
for that rare case=E2=80=A6 but what=E2=80=99s the answer?

And, to prefetch a possible ending of this discussion: if I coded up =
patches to the iOS client that add some tcp-wrapper option, would you =
take it?

Cheers
  =E2=80=94 perry
=
--------------------------------------------------------------------------=
-
Perry The Cynic                                             =
perry@cynic.org
To a blind optimist, an optimistic realist must seem like an Accursed =
Cynic.
=
--------------------------------------------------------------------------=
-

