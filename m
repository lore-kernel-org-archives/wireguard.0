Return-Path: <SRS0=OeqZ=W5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72811C3A59E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Sep 2019 23:25:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BE4622CF7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Sep 2019 23:25:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=natulte-net.20150623.gappssmtp.com header.i=@natulte-net.20150623.gappssmtp.com header.b="q+MV7z96"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BE4622CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=natulte.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a7a74ad;
	Mon, 2 Sep 2019 23:25:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c75b83f3
 for <wireguard@lists.zx2c4.com>; Mon, 2 Sep 2019 23:25:17 +0000 (UTC)
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffd81e2b
 for <wireguard@lists.zx2c4.com>; Mon, 2 Sep 2019 23:25:17 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z21so11403882lfe.1
 for <wireguard@lists.zx2c4.com>; Mon, 02 Sep 2019 16:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=natulte-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=OZvZMZHoVVy0T1cI1E0GH9CTNdNizTWGE1tDBjB98z4=;
 b=q+MV7z96qb4EYf20bhXEWT40pCMcdJOoWl+4giMXUA1ZqBykuV8C91Gx7B1d3jvWY6
 xkDgTqz7HSZCcNIXOP3nTnMgepGZC6Fti1tyhNN2D9jVj385qzvoJWl0BNWQ4iwNN0jH
 vUbDojzDqwsplT45mAkoheLPqztthz0rEgfukGi/dQbWlRNUMLpORmyhHUNe9bX1oTaf
 8QmALxgqtgD1GoWsM5LVoBV9qT1csWMgzF3sKCrMw0fLA7xMO0JQCE6kqcmVVD67EkNw
 +PY+Ip5OmI/CqK7wmvcGQpLEE4sw0WGaGKkeDzAquc4PzoZLpJ2M1uhkwo6o5AgxjiL6
 L1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=OZvZMZHoVVy0T1cI1E0GH9CTNdNizTWGE1tDBjB98z4=;
 b=FZocJUj7oyHAqU/+PnOBOZ6C6ySMzcxRjAaHI7iDsEaxWDqU2yDY0yu/99gFIc4Tv/
 I5S5M8WqEa5dVKDnGMLCE7juA6yelnWZqZdCMSzNlHaberhEiMdupokxVd2LAF7oezeU
 Kcisl9Br9p2/P8Jn4XRMyV7kkjlSh6wOjZkraZE9PqyzzfUfhij/5eHbseCN31eVoreW
 ct4sMLU8CdOUiDxChXKUs6gwm7pl7/8Zb/nnGtdJtge1Yb/O64kyv3wHtUkn87CNjgT+
 mFiOG5qkYoXXb8d1cWQw8Jplgo0PtRhgQx0iWQb3ZjDebsc4x/H+g9Qi4W5Gwkw5Yth7
 MZYg==
X-Gm-Message-State: APjAAAUYLFdmwnnF2ObFJL7ozVFLqL6gXWuiDjvueAHHs4VWhhBS7hgs
 Qd6CWoHkPrE79lv+r7ukvALOap14W6gQRCll7oOj4wZr
X-Google-Smtp-Source: APXvYqz+gxrOc7XBemMXj8HmpNvua5zsuZoPgvxnvnRg/ipYR6LsbvdFwH1MBqOoPAw57x91/8BoDOl6z4aeKNYaWhc=
X-Received: by 2002:a19:2d54:: with SMTP id t20mr12277478lft.84.1567466715972; 
 Mon, 02 Sep 2019 16:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAMx+r7VomZWjyJHRzESRWvXhS54+AkQ4G9yHd+hzWDAPxbJPCA@mail.gmail.com>
 <CAMx+r7WOqTnHf0uXixM-8WO2WyyfRX=dZ1WszDnMKgy+Epfaug@mail.gmail.com>
In-Reply-To: <CAMx+r7WOqTnHf0uXixM-8WO2WyyfRX=dZ1WszDnMKgy+Epfaug@mail.gmail.com>
From: David Anderson <dave@natulte.net>
Date: Mon, 2 Sep 2019 16:25:36 -0700
Message-ID: <CAMx+r7WotKwERtUbkonxg2VOWLj0Rr_FV42ai5CYaN=iO0tJfw@mail.gmail.com>
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

One more correction: this only affects Debian testing and unstable.
Buster was released with systemd v241, which does not have the
regression. I got confused because I got one of my machines into a
borked state that's halfway between stable and testing, and it
included systemd v242.

- Dave

On Mon, Sep 2, 2019 at 12:42 PM David Anderson <dave@natulte.net> wrote:
>
> Seems to be known to Debian:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=936198 . I'm not
> super familiar with Debian's development process, but I _think_, from
> that bug + the systemd debian repo's state, that the fix is now
> submitted and pending upload to unstable, after which it should flow
> backwards over time into Buster.
>
> - Dave
>
> On Mon, Sep 2, 2019 at 12:26 PM David Anderson <dave@natulte.net> wrote:
> >
> > Posting here for posterity, in case someone else encounters this problem.
> >
> > In systemd v242, networkd has a bug
> > (https://github.com/systemd/systemd/issues/12377), in which it ignores
> > the `ListenPort` directive in its config files for wireguard
> > interfaces. The results is that even if you specify ListenPort=51820,
> > when you restart networkd it'll assign a random listening port to the
> > wg interface.
> >
> > This can lead to some frustrating debugging where your VPN
> > mysteriously doesn't come up, and it turns out to be because your
> > wireguard server is listening on entirely the wrong port. You fix it
> > with `wg set wg0 listen-port 51820` after networkd has started.
> >
> > Because of systemd's "no patch releases" release cycle, this seems to
> > have been broken since 11 Apr for any distro using an unmodified v242
> > systemd. I discovered this on Debian Buster (the newest "stable").
> > Looks like the fix was pulled into at least NixOS and Gentoo, not sure
> > about other distros. v243 has the fix, and should be releasing Any
> > Time Now.
> >
> > I'm going to file a Debian bug to request a backport of this patch,
> > since I'm guessing they're not going to be upgrading systemd routinely
> > on the stable track. Hopefully it won't bite too many people though,
> > since networkd isn't the default for network configuration on Buster
> > (I'm just an enthusiastic early adopter).
> >
> > - Dave
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
