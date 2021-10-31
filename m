Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3545EC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 10:57:10 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48D556103B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 10:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48D556103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=deze.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2a58988;
	Wed, 3 Nov 2021 10:53:24 +0000 (UTC)
Received: from tampoco.espindola.nl (tampoco.espindola.nl [149.210.133.191])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a72c5113
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Oct 2021 18:41:52 +0000 (UTC)
Received: from [192.168.68.249] (drawbridge.espindola.nl [62.251.122.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: frank-deze)
 by tampoco.espindola.nl (Postfix) with ESMTPSA id 7A26D3C01A5
 for <wireguard@lists.zx2c4.com>; Sun, 31 Oct 2021 19:41:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deze.org; s=default;
 t=1635705711; bh=SV2ajjkdRQ/nUFUSAyhtAoony8GOEGbaq6MOY087CXQ=;
 h=Date:To:From:Subject;
 b=jPxcqxA/VbsZFdlepNYYMFrbQQ06qEviQ6t50aL8wTq0ahtBVcM8ji7ygMcRnevnd
 a28dhT/pNf1Fll5O5IZEbu07Cu5m+VfhZqIvpUsqMiTsAT0IzF4o7sx4s2EBjQFtIf
 vggHyxgOIjO5m4x2YRLknvwp9Lh5Z3Ue+cf0Nrw9OE2/ksYN1DCXD56Cp6vsVH7A9M
 Vv6uaLFTf1wY/SSv07q9bGQMwd5xmxKvGAqvGU9girBcsiau9tIi1YxVM5uKEQX+jb
 cxHzT1Sqx2NDM75dvgJZfYM1td2ZrPn1v32jEylMogaHfAGUzTlctDRtuKZ5ZmKu26
 2ZgaUFE4t6ABA==
Message-ID: <cfddc41d-0768-af1a-d527-d2bccd5cfd56@deze.org>
Date: Sun, 31 Oct 2021 19:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
To: wireguard@lists.zx2c4.com
Content-Language: en-US
From: Frank Volf <frank@deze.org>
Subject: Wireguard on FreeBSD - a few questions
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


Hi,

This weekend I installed Wireguard on FreeBSD 13.0 and until now 
everything seems to work fine (I use the kernel module).
Installation and configuration was easy and connecting with the Android 
app works great as well.

I do have a few questions.

1) Is it possible on FreeBSD to enable some kind of logging? I did made 
a small configuration error with my first client and it was hard to find 
the error, because there does not seem to be any logging at all.  Some 
logging information would be appreciated and probably wold have pointed 
me faster to the fact that I needed to switch two keys in my config.

2) I noticed that Wireguard uses a wildcard to listen to all IP 
addresses on my multi-homed machine on his dedicated UDP port. I would 
prefer if Wireguard would only bind to the specific IP address on the 
outside interface that is designated for that use. Is this possible?

3) Final question: is it possible on the server side to restrict the 
destinations that clients can connect to it? I know, that I can set the 
AllowedIPs on the client side to restrict that, but that setting can be 
changed at the client side. It would be nice if I could restrict 
destinations at the server side (so client X can only connect to an IP 
address of an internal server that it needs access to but nothing else). 
I can probably use a state full packet filtering firewall for this, but 
it would it be possible to configure this on the Wireguard server side 
as well?

That said, I'm pleased with the first test results of Wireguard on 
FreeBSD and hopefully it keeps on running fine. Great product!

Kind regards,

Frank

