Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0F8C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 12:21:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7af924f;
	Sun, 19 Feb 2023 12:16:56 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 37e626ef
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 12:16:55 +0000 (UTC)
Received: from blind.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 8934920FB1;
 Sun, 19 Feb 2023 13:16:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1676808995;
 bh=OEAYAw7odvDI+3MiomTm7GZWG3nYvZ7G1sJK6uPZnQk=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=RrmUcx5s3hRthFHWWKse+D6kVPGBNpYlGSqa1QjThH1Sd9Uc0zjQndinSd8q6vexI
 tmazPmwkuR76VMmreHCmVVLKZdnL3l+7mNhCz4OJgijyZMvUPQq7mQfGlLBKLvTZP7
 D6XHGYVNuzZ9uLoaI45g/eVUERMl6Tl3f7WbKXFUW/6r55izm5ZY3MBq283hRsWUYG
 7N+pPKuA5de4S+gSOzZziii93SwfHES+ZZ7k3bAI0rdEfjHWWjoXYZBtb9MwPnWeUR
 Ig+IrzrMQ9bA4uxWGFTFD6+MStO6a2yJeGoA5gMwladQrp96mvOTr3bOBVmoZsYNS9
 Bu3rMrhoF51Bg==
Received: by blind.localdomain (Postfix, from userid 1000)
 id 7AC6613A11F1; Sun, 19 Feb 2023 13:16:54 +0100 (CET)
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
User-agent: mu4e 1.7.26; emacs 28.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Sebastian Hyrwall <sh@keff.org>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>, Mike O'Connor
 <mike@pineview.net>, WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Source IP incorrect on multi homed systems
Date: Sun, 19 Feb 2023 13:13:58 +0100
In-reply-to: <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
Message-ID: <87ttzhc0jt.fsf@ungleich.ch>
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


Hey Sebastian,

Sebastian Hyrwall <sh@keff.org> writes:

> It is kinda. It's been mentioned multiple times over the years but no one seems to want to fix it. Atleast you should be able to specify bind/src ip in the
> config. I gave up WG because of it. Wasn't accepted by my projects security policy since src ip could not be configured.
>
> There is an unofficial patch however,
>
> https://github.com/torvalds/linux/commit/5fa98082093344c86345f9f63305cae9d5f9f281

the binding is somewhat related to this issue and I was looking for that
feature some time ago, too. While it is correlated and I would really
appreciate binding support, I am not sure whether the linked patch does
actually fix the problem I am seeing in multi homed devices.

As long as wireguard does not reply with the same IP address it was
contacted with, packets will get dropped on stateful firewalls, because
the returning packet does not match the state session database.

Best regards,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
