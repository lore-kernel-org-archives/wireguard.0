Return-Path: <SRS0=i/Df=GF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F2EC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Jan 2021 14:37:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB232076D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Jan 2021 14:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EB232076D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 263d2b75;
	Sat, 2 Jan 2021 14:26:47 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id accd9586
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jan 2021 14:26:45 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bd4da82
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jan 2021 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:cc:content-type; s=mail; bh=mXb
 2SLb9+vRvp1RyISvNb3u+knw=; b=aVuYaJb1BTrVU9CTmz3WmIWgQKljKy3GBqR
 x3IUwXvLdq//U3s6RoTkU3FYlrmYvRNap4DHWO3RyraTk61DYlUbv24XwDyVFGDP
 t1sgB7ZtFL0F6zB1bLcmhW0CB5+UGv1PyKwgp15BSYg+WwoeDdBMEa7JU8ygPccJ
 nGyWytSCpmOgWps7G+4a6VN4whFG0EDA7Rl7cnAT7SY7T7C1oPaP9IPl1Urv02Ti
 un3hkSp9/Jpyv7xsCpLHSlAUZNjM5JGbisTg/qvRmlk6adLbMauReqSuFSJCvRqK
 xC5ItKMKNViVidRavjZye5nsAr+JCCGONsd90i1iYqBNxEizJ7g==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 53f630d8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jan 2021 14:27:31 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id x2so21707586ybt.11
 for <wireguard@lists.zx2c4.com>; Sat, 02 Jan 2021 06:37:20 -0800 (PST)
X-Gm-Message-State: AOAM531nJnhMGYapbT/BcL4uSs5iAARFcPM5DzE9BxT7rlWB4IKLt15R
 zHvrSlRmt8sk2KfNeocsF2npkHpl6oTokZmcNGM=
X-Google-Smtp-Source: ABdhPJzVwczrZmBotSkMTwqzCXxCkmrRDVl9EfMst42SInt1HGHzJQcRZMtLn7lF6es9LvnIX4BfgSPL3/WDCmfy6Jk=
X-Received: by 2002:a25:2cd6:: with SMTP id
 s205mr92855456ybs.279.1609598240455; 
 Sat, 02 Jan 2021 06:37:20 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 2 Jan 2021 15:37:09 +0100
X-Gmail-Original-Message-ID: <CAHmME9oGiqbq1LtGtV=-wUu7K4OajdQO+6RiEZFw9jP73zpJ2Q@mail.gmail.com>
Message-ID: <CAHmME9oGiqbq1LtGtV=-wUu7K4OajdQO+6RiEZFw9jP73zpJ2Q@mail.gmail.com>
Subject: Continued use of `wg-quick save` and SaveConfig=true?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Mira Ressel <aranea@aixah.de>, A Jones <aaronmdjones@gmail.com>
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

Hi,

I was thinking recently that most people have switched from a model of
updating the runtime configuration and then reading that back into a
config file, to editing the config file and then syncing that with the
runtime config. In other words, people have moved from doing:

# wg set wg0 peer ... allowed-ips ...
# wg-quick save wg0

To doing:

# vim /etc/wireguard/wg0.conf
# wg syncconf wg0 <(wg-quick strip wg0)

I think this is mostly a positive change too in terms of reliability.
Reading back the runtime configuration was always a bit hit or miss,
and I suspect that more times than not people have been confused by
SaveConfig=true.

That raises the question: are there good uses left for SaveConfig=true
and `wg-quick save` that warrant keeping the feature around?
Temporarily caching a roamed endpoint IP, perhaps, but how helpful is
that?

I haven't thought too deeply about this in order to be wedded to one
outcome over the other yet, but seeing some confusion today, again, in
#wireguard over the feature made me wonder.

Any opinions on this? Any one on this list actively use this feature
and see replacements for it (e.g. syncconf) as clearly inferior?

Jason
