Return-Path: <SRS0=OeqZ=W5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EEDC3A59E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Sep 2019 19:41:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEAF12087E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Sep 2019 19:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=natulte-net.20150623.gappssmtp.com header.i=@natulte-net.20150623.gappssmtp.com header.b="TQCtz+9y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEAF12087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=natulte.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56af0bbc;
	Mon, 2 Sep 2019 19:41:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 716d0a36
 for <wireguard@lists.zx2c4.com>; Mon, 2 Sep 2019 19:41:42 +0000 (UTC)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 576afcd2
 for <wireguard@lists.zx2c4.com>; Mon, 2 Sep 2019 19:41:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h3so6961377ljb.5
 for <wireguard@lists.zx2c4.com>; Mon, 02 Sep 2019 12:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=natulte-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=YrJ2/cfN0m/bij9Oxvv5JB8JBfFZsKAcBaBpgdSEJRY=;
 b=TQCtz+9y0iJzSI1RtM8EGOu1sSIAEf2xArFLvBEl0z/IB4yQgP2oPmWv6RrZUf7EqK
 fQu1HhLcz6Fgz/I+THm2pJeyO3xk60OIDMPGzGA00A8YATBIpswk/8rD0IfgHapmMAij
 lurffHxg/4koro23/TS1g9RJgQrFYDlssKgx/o89ILa3OD9VrllHR6s+sLQAg5NmEFv5
 yN2hMMjxFUVGh6QYt21KbfpjxlmXKJC201eFkonDQ7YVlifQ7VsC02Fxa8W/iv3HMSIN
 QwrbtEtfxmX+yRJTL1BKEPtc5mRJc9jwafP7y2IRGga/8I8JVD4gBNQWAKE9rMpuDwo4
 nhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=YrJ2/cfN0m/bij9Oxvv5JB8JBfFZsKAcBaBpgdSEJRY=;
 b=dah3Lk2ubPsJPn+0xyVh93ZsBjN5MfC/xkSm80WsKFB1rHRgm1CDzo0FTs6fX3i+wY
 859KhNSgdZkNw3lmAxpn57QIQLdx44xEA3GXN4DuEc68GhnQvvTl43NrWeadIiVyXSag
 8vGSxD+X4OfMTsSRNbP1RyCK7uxAvyJ9ulwZTtsjF5TEFSzqx+rKf2gSmR24BprQhpFI
 SwwW0ZDvfquorip96jNPcCDp31B3L8t9P+JFox4rPYMQAAlHIoOZQkEVuJVGKYL3EFdV
 kP9dXZhJClNLvVb6pZVlkqXwiBNEPYnx/ScWLHJWjyWeH8gOw9NuU+JE79a/DrCG3cgQ
 vNsQ==
X-Gm-Message-State: APjAAAWhtEYu7M1opKrJD+xlhVrjW22t6QVWMn3dtDPA8i0WWe02KgZI
 2xQNrNyBJsJfnK7aSrq4vj2kS/Rp3IeN0rfn+0iYkcX21zE=
X-Google-Smtp-Source: APXvYqxXFeFuAGx36wqerTMieGOgBGFMkGAEPEVTY5t9C9aLDhZCgu+9+8iVz7FN9omkXCHphsLPqv6OAxbQxxrjcTc=
X-Received: by 2002:a05:651c:292:: with SMTP id
 b18mr1015692ljo.131.1567453300800; 
 Mon, 02 Sep 2019 12:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAMx+r7VomZWjyJHRzESRWvXhS54+AkQ4G9yHd+hzWDAPxbJPCA@mail.gmail.com>
In-Reply-To: <CAMx+r7VomZWjyJHRzESRWvXhS54+AkQ4G9yHd+hzWDAPxbJPCA@mail.gmail.com>
From: David Anderson <dave@natulte.net>
Date: Mon, 2 Sep 2019 12:42:00 -0700
Message-ID: <CAMx+r7WOqTnHf0uXixM-8WO2WyyfRX=dZ1WszDnMKgy+Epfaug@mail.gmail.com>
Subject: Re: FYI: systemd's networkd (v242) incorrectly setting listen-port on
 wg interface
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Seems to be known to Debian:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=936198 . I'm not
super familiar with Debian's development process, but I _think_, from
that bug + the systemd debian repo's state, that the fix is now
submitted and pending upload to unstable, after which it should flow
backwards over time into Buster.

- Dave

On Mon, Sep 2, 2019 at 12:26 PM David Anderson <dave@natulte.net> wrote:
>
> Posting here for posterity, in case someone else encounters this problem.
>
> In systemd v242, networkd has a bug
> (https://github.com/systemd/systemd/issues/12377), in which it ignores
> the `ListenPort` directive in its config files for wireguard
> interfaces. The results is that even if you specify ListenPort=51820,
> when you restart networkd it'll assign a random listening port to the
> wg interface.
>
> This can lead to some frustrating debugging where your VPN
> mysteriously doesn't come up, and it turns out to be because your
> wireguard server is listening on entirely the wrong port. You fix it
> with `wg set wg0 listen-port 51820` after networkd has started.
>
> Because of systemd's "no patch releases" release cycle, this seems to
> have been broken since 11 Apr for any distro using an unmodified v242
> systemd. I discovered this on Debian Buster (the newest "stable").
> Looks like the fix was pulled into at least NixOS and Gentoo, not sure
> about other distros. v243 has the fix, and should be releasing Any
> Time Now.
>
> I'm going to file a Debian bug to request a backport of this patch,
> since I'm guessing they're not going to be upgrading systemd routinely
> on the stable track. Hopefully it won't bite too many people though,
> since networkd isn't the default for network configuration on Buster
> (I'm just an enthusiastic early adopter).
>
> - Dave
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
