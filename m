Return-Path: <SRS0=TwOG=MV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BD1ECDFDF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 19:19:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3947213A2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 19:19:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="UFftrYrs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3947213A2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed309174;
	Tue, 9 Oct 2018 19:18:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec72963c
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 19:18:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbad573d
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 19:18:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88aaa4f8
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 19:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=L74d4/MvEqf1fF4Mv6cLvq0+9Sc=; b=UFftrY
 rs4v6SmzJGuXgplelXfJv+JmmAWf1MsRWPtEZeQ5DmpfgGEnHygWPn4g/6bA+xbs
 SaqchWoGiAbwr+7+Ok7xGCYtDGNlLO9SYcLgWoej/CeyZSi6xj9NsNz8OewHS6pe
 eaL0O6wj+Ko0tRFFsch4obAoCEpCJrdLzfYiHaFvXyMUFJeICI+0twymoT8lM1YT
 WEcxh06EH+jwu5/aKraL9SrrJjazbXboVwepaBHK8F0vtrCfYFg0Esa9mNAzP9Ix
 O7A1vBLaunFkScJM5CDOQax2UDp0/9DddLXxDoPlRtiZ/8pSUhwHWicU9VhWLPI4
 zEbMV9pNoKbMMuoQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2fc0319d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 19:18:11 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id i12-v6so2871088otl.1
 for <wireguard@lists.zx2c4.com>; Tue, 09 Oct 2018 12:19:07 -0700 (PDT)
X-Gm-Message-State: ABuFfoj9YQqDOxqaCEYEb/kwOWrhHkkjRYXv6iWg5N7Da3M8vb1Ojv/b
 RviOTr/82Ef0uhtpo9mkp4zC+LxaxPXbjgNBvHo=
X-Google-Smtp-Source: ACcGV62gfIwI44Wzjee0RVO3tm9Q9PBQ8wv2Qu+7XdzbnKkQ+CKFD+2bSEX4a4qbo0dSwD9JNpjLLiXnMKNVWWZTSS0=
X-Received: by 2002:a9d:1d47:: with SMTP id m65mr18922803otm.199.1539112746826; 
 Tue, 09 Oct 2018 12:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <163f39a3-0fb5-3645-b6bd-3ddd797c158b@yahoo.com>
 <796625c4-d114-1b5f-ea79-97b91e682549@newmedia-net.de>
In-Reply-To: <796625c4-d114-1b5f-ea79-97b91e682549@newmedia-net.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 9 Oct 2018 21:18:54 +0200
X-Gmail-Original-Message-ID: <CAHmME9oKzPdrGRibiA7_gB=qZP4qcKkN35-ZAoFkSEeV-wDXyw@mail.gmail.com>
Message-ID: <CAHmME9oKzPdrGRibiA7_gB=qZP4qcKkN35-ZAoFkSEeV-wDXyw@mail.gmail.com>
Subject: Re: Wireguard not coming up on DD-wrt
To: s.gottschall@newmedia-net.de
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Tue, Oct 9, 2018 at 6:30 PM Sebastian Gottschall
<s.gottschall@newmedia-net.de> wrote:
>
> just to make sure. since i'm updating wireguard in dd-wrt very often to the latest state of art code from git.

Do not do this. Rather, use snapshots. If you're distributing builds
based on git master, you're putting your users at unnecessary risk.
The only safe and acceptable distribution of WireGuard is using the
latest snapshot tarball. When you use git master, you're not getting
the "latest state of art code", you're getting "jason's 5am
force-pushes and wacky ideas pre-codereview." On the other hand, when
you use snapshots, you're getting code that I've spent some time
reviewing and double checking to make sure it won't murder kittens and
related atrocities.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
