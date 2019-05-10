Return-Path: <SRS0=opgr=TK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529D3C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 May 2019 11:55:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7F4320989
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 May 2019 11:55:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUgpb9BO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7F4320989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 276d0c8a;
	Fri, 10 May 2019 11:54:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 076554a6
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 May 2019 11:54:52 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 236cf431
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 May 2019 11:54:52 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id c66so1148149wme.0
 for <wireguard@lists.zx2c4.com>; Fri, 10 May 2019 04:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=i3Eyoy8UPIkkDRJT/BdS5EEonCmw32PsAp8B60odHYs=;
 b=jUgpb9BOl/V0vVwPcgj/JwLkRSj6Z+OwnkwRA26rf7CSl3qdkXxtVKE+xLvt2K1FfF
 ninU2A4uCOJKSQi/pmle6b58K0Q0ilKBYps899mXH3HGMiBHARM5U0nKbUH6ucX0OrwC
 xF2vd4M/SP+xj2JeUBG1zkQGV9pCtwfvCwU9zuZZyzWiLfnN+PMdaJDjVeTcF5vj0o/7
 86ocf5GYkpTPRXQOTyxbqrpbfotpGjm9m23/oW3JnO+H7GtCpGbZj/6+kUmkKqmSQM8Z
 L6AYFLK657zllCHvdl6iKzXiBAgqrMXkoceqcENJFdoJbEC/WcZPtsiwbr/vQvf0JLE2
 JAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=i3Eyoy8UPIkkDRJT/BdS5EEonCmw32PsAp8B60odHYs=;
 b=TAQZBlI8mXl0AjMxtl3XyJqw0EHByq3uOC6ajhuQG3G0xrzt4FRrzX+mcEUIKy1mL3
 /8rKtRdruLPahmgCMbPR2Re3OK95WE88GEuWTFm8mANqBjGrvXNOdHE+tpwqXngH+4gL
 U0jh4ZNS0/o5zK29TOdxN2glLMeiiSk9RTfqmBzPzvopSQC+8UBqvC+/ysRGd0ZZ5F2n
 0jdWC1MZECyE6jSEBw39B5dWHYJ4FFRHGUB8eWnoYG4xxceD2zKnAkrv+5mwqxKgKNo4
 lyWwViNENIDEMAcc7gQNWTPU1RsJ7k0ZpNFwhSsjmIntPQ6WBOQOjx06ysZfo8YttqQi
 0MJg==
X-Gm-Message-State: APjAAAWc0xB8DyBlGPwmG1di6YD2JWuVrKqPI7GwT66liuzQwWP1/m2a
 bLdMurV3iy0mVl3hGv1+ByA0DHDgNl0=
X-Google-Smtp-Source: APXvYqyBq9JqDT5ZVqIboJ3KyPUUiE2vsOP7MZfOluAgApgLdGO5BosanZBfzC0C6JpOkybMSUQPPQ==
X-Received: by 2002:a1c:6206:: with SMTP id w6mr1079577wmb.56.1557489290518;
 Fri, 10 May 2019 04:54:50 -0700 (PDT)
Received: from sita-dell (static.133.162.46.78.clients.your-server.de.
 [78.46.162.133])
 by smtp.gmail.com with ESMTPSA id x1sm1921359wrp.35.2019.05.10.04.54.48
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 10 May 2019 04:54:49 -0700 (PDT)
Date: Fri, 10 May 2019 17:24:45 +0530
From: Sitaram Chamarty <sitaramc@gmail.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: bypassing wireguard using firejail
Message-ID: <20190510115445.GA29887@sita-dell>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I am able to bypass the VPN by using firejail (which is a
sandbox program to run untrusted applications).

Below, the IP addresses and domain names are fake but that
should not matter:

    # wg
    interface: wg0
      public key: ....
      private key: (hidden)
      listening port: 59457
      fwmark: 0xca6c

    peer: ....
      endpoint: 11.22.33.44:51820
      allowed ips: 0.0.0.0/0
      latest handshake: 41 seconds ago
      transfer: 35.42 MiB received, 2.74 MiB sent

    $ curl zx2c4.com/ip
    11.22.33.44                 <--- my wg VPN end point IP
    static.44.33.22.11.elided.tld
    curl/7.64.0

    $ firejail --net=wlp2s0 --dns=8.8.8.8 curl zx2c4.com/ip
    55.66.77.88                 <--- my actual external IP
    elided.hostname.myisp.in
    curl/7.64.0

My questions:

1.  I know firejail is suid root, but still... is there any way
    to prevent this from happening, or at least make it less
    trivial?

    I'm OK with a "this is the way it is, if your untrusted app
    is running as root you're already toast" response; just want
    to make sure I'm not missing a bet here.

2.  I guess I don't know as much about Linux networking as I
    *thought* I knew, especially about policy routing, so I am
    feeling a bit lost here.

    I would prefer not to have to learn lots of things about
    policy routing and so on, so I wonder if there is a simple,
    (wireguard-specific, if possible) explanation of how linux
    policy routing and iptables work behind the scenes to direct
    packets when wireguard is in play?

regards
sitaram
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
