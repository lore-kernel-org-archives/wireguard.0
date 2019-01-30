Return-Path: <SRS0=kH4x=QG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD34DC282D7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jan 2019 15:46:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59B4521473
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jan 2019 15:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59B4521473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wenarab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 720ba292;
	Wed, 30 Jan 2019 15:40:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d85ce61
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Jan 2019 15:40:32 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d459ac8a
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Jan 2019 15:40:32 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id x28so14499043vsh.12
 for <wireguard@lists.zx2c4.com>; Wed, 30 Jan 2019 07:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=kUh5d/z4cfarBZHgt5hKU5/ZlZXElz5T1fZw/Wd+p8c=;
 b=AnpnZ9QiVSEBzseWsuS5bpcDarAHljjyRNUri6fDzplskYQ5TjFLaFpyjRukuwxeBy
 fZ28BerbQphxMOFOki6skd7fPMLgMEmmGU5G/aezzypEwTmdnkxNj3P5QrnYzFwlzk9O
 GRjLHmRC/HFCFsCkeDVp02IV5Ob0cJ1UoqGRo3tdMAB3CeiZRTTAJpsNJg9J4DG3wANU
 mlJ6jS+LCS0lpQXpg5yTVxt0diAj8/LYWWdQsEcpsIf+a5oCZ7Xo7bMU7E0JR1cv0hMm
 /+UM95fI5w0g79sQVjbDcZuvg8kiZiJIgRGA1gEXLW1ioXu2oAD+fkRZpVolVi4RtRIP
 Mjgg==
X-Gm-Message-State: AJcUukenhWes+AbE/GoIIyYMNa6B17WdFpfAOvWfgaOtjBeNuNki4TmD
 SUT6x34QODXtXOAb0s7tAJubFNC4z7DvwVC3xn82lp2cKRg=
X-Google-Smtp-Source: ALg8bN5LjIePu6XB1aTqxEZZkM2fOWZ+tWWfpkh4PMXketVkj9qr7q2QLCIsS+bsGaTCkdjxDszw6eFtfK8OSTUrVYI=
X-Received: by 2002:a05:6102:cb:: with SMTP id
 u11mr13557343vsp.68.1548863190649; 
 Wed, 30 Jan 2019 07:46:30 -0800 (PST)
MIME-Version: 1.0
References: <CADjxVNq-PPTrzd9qDZK+ZFF8v70eme8n87xBK-77e=PNMGCQwg@mail.gmail.com>
 <CAJQSx3aQLGT9Hr=3NNTnrvq2JJCqiJ2vkV092n_zCN2LNjP-1Q@mail.gmail.com>
 <CADjxVNrNNbRpanwm4ZEOLbY_e4FEohP=2YzpQFXe28JiHzj-yQ@mail.gmail.com>
In-Reply-To: <CADjxVNrNNbRpanwm4ZEOLbY_e4FEohP=2YzpQFXe28JiHzj-yQ@mail.gmail.com>
From: Gawen ARAB <g@wenarab.com>
Date: Wed, 30 Jan 2019 16:46:19 +0100
Message-ID: <CADjxVNp8JsMGfULG7pzJt3Cjbn9RzXyFmA1kx+vggr4J03nHcw@mail.gmail.com>
Subject: Re: wirehub - decentralized, peer-to-peer and secure overlay networks
 built with WireGuard
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============3714859456910107451=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3714859456910107451==
Content-Type: multipart/alternative; boundary="00000000000048d12e0580aed05d"

--00000000000048d12e0580aed05d
Content-Type: text/plain; charset="UTF-8"

Hey Rene,

> I suggest to use a cryptographically generated IPv6 address (128-bit hash
of Wiregurad public key with first n bits replaced by a Wireguard-specific
IPv6 prefix)
> for routing and management purposes. Adding a reverse-lookup IPv6-address
-> Wireguard public key via DHT would allow a public IPv6 overlay network
> with authorization via firewall rules. Nodes should also be able to
announce their subnets via DHT.

I agree. I plan to use the subnet ORCHID as defined by RFC 4843.
See command `wh orchid`.

Cheers,
Gawen

--00000000000048d12e0580aed05d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hey Rene,<br><br>&gt; I suggest to use a =
cryptographically generated IPv6 address (128-bit hash of Wiregurad public =
key with first n bits replaced by a Wireguard-specific IPv6 prefix)<br>&gt;=
 for routing and management purposes. Adding a reverse-lookup IPv6-address =
-&gt; Wireguard public key via DHT would allow a public IPv6 overlay networ=
k<br>&gt; with authorization via firewall rules. Nodes should also be able =
to announce their subnets via DHT.<br><br>I agree. I plan to use the subnet=
 ORCHID as defined by RFC 4843.</div><div dir=3D"ltr">See command `wh orchi=
d`.<br><br>Cheers,<br>Gawen</div></div>

--00000000000048d12e0580aed05d--

--===============3714859456910107451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3714859456910107451==--
