Return-Path: <SRS0=zGfa=LJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0937BC48BDF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jun 2021 08:36:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AA6E613D0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jun 2021 08:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AA6E613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43f79687;
	Tue, 15 Jun 2021 08:35:59 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e883d7e2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Jun 2021 08:35:57 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id a127so6881203pfa.10
 for <wireguard@lists.zx2c4.com>; Tue, 15 Jun 2021 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=btTlrEnIpSplOUcY4V4Atkfxa0+Ioy3FFe7D35qVmBg=;
 b=MzF+VZwh4UQu2fpD5wIjN3mvI3s+ChPNoif3jAWc3+XHw40DVgBMtCUA/8PIw6/PX/
 mNGlwghug+phD7ufYMV8x5WVe9JzWWqOeU1NrQdcgmi7v+YI7D2ZgMAo+s3Bmg3HjALR
 rlqmlLkdtdX4gYgj1asmIY3YbmTPPIABhx+qvQWs28VHD5j1iiqTbWXlJ0L3yKOfPcfX
 Te3V/DKm2IKM5Qx23zac20b4oZaRnXeIfrdHq982KKM2WrSxeJwWVzLVN4tNQgKlCERZ
 e63IC1nIaFp8vTh5FNQ3dDIYPNhenrtqUB3qfYcrTU5kxoV8Egar6c2vjLZdmubxML0P
 TsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=btTlrEnIpSplOUcY4V4Atkfxa0+Ioy3FFe7D35qVmBg=;
 b=cIlmXNUQeY+Ikqntr6VOu+0HhPV8MD1rmx0TGkgUpXcXUhem+Oe84MGAcXQ7Lf+T0o
 zhRK+xdG50+65HdDVFdHV1j1z2PtIO1n1LKYi/Bwpa0rI0eJvuGOcNF4Wvvm3HRpbDDX
 OqSFQNcJ9sH652DLkZSDe8QhvWvDSAPqohW5daDZjGkemgqQW1M5ERTioXdkp1XL2qz5
 nw+Srrf04jsalvyg6toLBrUSsWiy3/4CHz06v+0oZd45tzSLJJ9zx71mWfXmFibWXCXi
 GTaN4177ihGzAmvvNA81C1NWEP9CvOn7uPOdeuFqINXRqs0arS4nH03DqjcsDLNigXiM
 LTCQ==
X-Gm-Message-State: AOAM533jF11rg4n7++MH0H4A0v0nAMq/3LuN/8PSNc9+YeOUT24a2KUO
 meZXr8bv3ZCNl66sRQ3oWmhx4T4fZ5d7hq9wDPyu6zg+Fkc=
X-Google-Smtp-Source: ABdhPJzuZIzn5FYBa5AqigNwVz1u0UvG4yS0I0w7AQaG7gVAeSavjnEoXoDb+mTWwWr7GmDcv7N/WLSDgehqVeC3BOc=
X-Received: by 2002:a63:eb02:: with SMTP id t2mr21154072pgh.413.1623746155651; 
 Tue, 15 Jun 2021 01:35:55 -0700 (PDT)
MIME-Version: 1.0
From: Christian McDonald <rcmcdonald91@gmail.com>
Date: Tue, 15 Jun 2021 04:35:43 -0400
Message-ID: <CADTMz0Kfxc3pQAM=KNstz-dZeHfYDWeqz360pPZLC1RvrW6+pw@mail.gmail.com>
Subject: wg syncconf (and setconf) error when one or more endpoints is
 unresolvable
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Jason,

Assume a tunnel with say 3 peers. Peer A is accessible via an IPv4
address, Peer B by some FQDN, and Peer C by some other FQDN. Let's
also assume that Peer C was misconfigured with an unresolvable FQDN.
wg syncconf (and setconf) fails with 'Name does not
resolve...Configuration parsing error'

Is it expected behavior in this case that *none* of the peer
configurations are actually applied? It seems like a more appropriate
behavior would be to go ahead and configure the remaining peers (Peer
A + B) but only fail on the peer with an unresolvable endpoint (Peer
C). It of course is completely possible to re-implement syncconf and
setconf using explicit `wg set` calls as a workaround.

Am I missing something here?

Thanks,
Christian
-- 
R. Christian McDonald
E: rcmcdonald91@gmail.com
