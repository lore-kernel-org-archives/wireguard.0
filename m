Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727DBC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jun 2022 13:19:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id aa22e969;
	Tue, 14 Jun 2022 13:19:09 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id fe48f619
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Jun 2022 13:19:08 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id AE51D2047E;
 Tue, 14 Jun 2022 15:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1655212739;
 bh=InbvhTZxX6TKCWugI+Sg+QSlTleZnuMyJq1geznNak8=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=GnOo+m3cJd7Y04f/U0eS0lJE9VrRu+FXEVtO8xbS9XtZlOaRdRzUU/qJvlf6zDNlg
 ls3Fcnh7A+EE2I/4/DXdy0iGwao0cDqigulZL9Su7VUjFXw3nLSxHTEEP9McPRCw5Q
 J8HXb63JJh8VpwJ/aploZxioRT6+xisgwcfoZBdkatvMKGDLVyon0RGJhQG1QRXLnh
 WFsojGoEHs7HZlNL1ZwOB2wrXlS7yfgAmhuQOqcp8yc/xs8vhpWJIQxd05WkHlx28y
 yRVC6nKogvn+GhUM92w/Avr2d9+hUVB2CQTfIFOMMlW66J+aD8kmg7GvyRHsy86QwY
 ZT62XoGjLhNFQ==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 26EED14C00D1; Tue, 14 Jun 2022 15:19:25 +0200 (CEST)
References: <20220609220522.kwqa4uvuc3sijlka@bamsoftware.com>
User-agent: mu4e 1.7.21; emacs 28.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: David Fifield <david@bamsoftware.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: WireGuard protocol blocking in China, swgp-go (userspace
 obfuscation proxy)
Date: Tue, 14 Jun 2022 15:13:11 +0200
In-reply-to: <20220609220522.kwqa4uvuc3sijlka@bamsoftware.com>
Message-ID: <87pmjbpele.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
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


David Fifield <david@bamsoftware.com> writes:

> I am forwarding some information about WireGuard blocking and
> anti-blocking that was posted to a censorship circumvention forum.

In regards to this topic I was wondering if it makes sense to have a
more generic obfuscation proxy that can carry tcp/udp payload?

Maybe this already exists, but I would think that something that hops
protocols (IPv6, IPv4 endpoints, tcp/udp encapsolution), changes ports
and uses envelope based tunneling (http, https, smtp, imap - worst case
DNS) would make it easier to sustain communication even in more serious
filtering scenarios.

Given such a "generic obfuscator", it could be combined with "protocol"
modes, i.e. enhancing protocols such as wireguard with the presented
algorithm, making it even harder to predict the content.

I'd assume some performance regressions using such an obfuscator, but
maybe it could even "learn" the proper obfuscation by detecting blocks
on easier to detect obfuscation and then switching to a stronger, but
less efficient obfuscation.

Wondering what your thoughts are on this.

Best regards,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
