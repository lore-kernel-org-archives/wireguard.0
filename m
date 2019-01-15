Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A42C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:36:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F0BA20657
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:36:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pdub-net.20150623.gappssmtp.com header.i=@pdub-net.20150623.gappssmtp.com header.b="LVvlgi3F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F0BA20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pdub.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20fdc210;
	Wed, 16 Jan 2019 16:32:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02ca0fd5
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Jan 2019 16:41:33 +0000 (UTC)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c70c34be
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Jan 2019 16:41:32 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id t16so1283998ybk.10
 for <wireguard@lists.zx2c4.com>; Tue, 15 Jan 2019 08:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdub-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=5GvErlq2fz2gURPLpzXvmo5Gjw0uiud2M6cfuYQLTIg=;
 b=LVvlgi3FfMNL16I/Qh8QBsv4sjJNsJUDdMPKaHY7E9vfCQScouUfEnkCEHj8VFWe9I
 w8OeezILgTiA2dNkk0GCosMXwkUwr+X+ZuixIw/jX57U9o0uglw2WqHDA3ls5NbKTT9x
 oDI4D/RyLmgX1nwCbLnTJAwly7C+IqhqZILbQXe6zJWxwopFHzrfugMczvBXnN1LDQ74
 AT95RS3UJcHlSOsO6Rh9ac3JOq3QLltNYcHFEZhrIljRuJXQ3lgmsoyZ6F7uSgf2JgSs
 tKTxUzNC60MqRnvHBjS7DKf+PusC/jCNvGW0T2820PAxde1TjZfPLxIfUi31AwqQExPp
 MWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5GvErlq2fz2gURPLpzXvmo5Gjw0uiud2M6cfuYQLTIg=;
 b=WD0fRQUU7t7pVTTL3pe4rL/howSajfSA2q4owCeAYcgHN/fXPG3lEmy5Y41LfFAIU0
 dXIHm0BgcIOCXZNcTVzI5LN4UCY3sGdu6/coZj9PtththELY80SlKUIVrKv6Ym/lDGWp
 bvhix1tkIGY9yyj5J/ukqVIqjVP7G0e/+UyOSB313L4o27ro3pZ4fA2ySP6AezvjfrTY
 VO3DvuTfONtmqlGgFEoWWmdRy04X12HvK9uk5ZASSDy/I9C5z+A/31ws1f+bqVVxXexQ
 GW6QJxaB0xWjQ7l+4tNY8zD4vPKI9X57/+OKQ0kZZdP2IEP6dDfmQXUlZtlf8aHOm5qI
 c5Rg==
X-Gm-Message-State: AJcUuke5RKWlyogmikvF8Rt90sGSkizUTOOCi3QItYa95QarKUHMAt6b
 o8eX2e0KwI+VIbkOU7NPEk5GfoskbQXs0InKucSFaFv/9bo=
X-Google-Smtp-Source: ALg8bN4YX9vq2yRUCVsFh5s9xgKzNYTjE7AUXLe5Wnbvs3x6GKs2tm+LlmyTB/a9d2UPrUOLH1ug7sKU8mKX3i9uIXw=
X-Received: by 2002:a25:81d1:: with SMTP id n17mr3677411ybm.382.1547570735178; 
 Tue, 15 Jan 2019 08:45:35 -0800 (PST)
MIME-Version: 1.0
From: pdub <pdub@pdub.net>
Date: Tue, 15 Jan 2019 11:45:23 -0500
Message-ID: <CABbM=Lk6WQGctp7Z3YBYBcq9CKwRn-KWC-e8DeHxvYF+Cda8Og@mail.gmail.com>
Subject: WireGuard roaming behind a load balancer
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 16 Jan 2019 17:32:07 +0100
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
Content-Type: multipart/mixed; boundary="===============1059947084320040045=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1059947084320040045==
Content-Type: multipart/alternative; boundary="000000000000ef7bd8057f81e3d3"

--000000000000ef7bd8057f81e3d3
Content-Type: text/plain; charset="UTF-8"

Greetings,

WireGuard is a really cool project! Thanks!

With WireGuard's native roaming support, I have a question about just how
stateful/stateless the roaming is. Here's a hypothetical situation:

Let's say WireGuard is being used to tunnel into a location and is served
behind a load balancer for high availability. If both nodes have identical
WireGuard config files at the start of WireGuard (and, for simplicity,
let's assume the configurations don't change). If one node dies, the load
balancer will automatically start sending packets to the standby node
running WireGuard (perhaps existing on the same subnet as the other node,
but with a different IP).

In a sense, the server-side "peer" has just roamed from machine to another,
but the public/Internet IP address didn't change (because that is assigned
to the load balancer itself). Will this work with WireGuard today?

TIA

--000000000000ef7bd8057f81e3d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Greetings,</div><div><br></div><div>WireGuard is a re=
ally cool project! Thanks!</div><div><br></div><div>With WireGuard&#39;s na=
tive roaming support, I have a question about just how stateful/stateless t=
he roaming is. Here&#39;s a hypothetical situation:</div><div><br></div><di=
v>Let&#39;s say WireGuard is being used to tunnel into a location and is se=
rved behind a load balancer for high availability. If both nodes have ident=
ical WireGuard config files at the start of WireGuard (and, for simplicity,=
 let&#39;s assume the configurations don&#39;t change). If one node dies, t=
he load balancer will automatically start sending packets to the standby no=
de running WireGuard (perhaps existing on the same subnet as the other node=
, but with a different IP).</div><div><br></div><div>In a sense, the server=
-side &quot;peer&quot; has just roamed from machine to another, but the pub=
lic/Internet IP address didn&#39;t change (because that is assigned to the =
load balancer itself). Will this work with WireGuard today?</div><div><br><=
/div><div>TIA<br></div></div>

--000000000000ef7bd8057f81e3d3--

--===============1059947084320040045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1059947084320040045==--
