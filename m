Return-Path: <SRS0=OeqZ=W5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5CEC3A59E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Sep 2019 19:26:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30BBF20674
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Sep 2019 19:26:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=natulte-net.20150623.gappssmtp.com header.i=@natulte-net.20150623.gappssmtp.com header.b="KMfE3I1p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30BBF20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=natulte.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef05c37a;
	Mon, 2 Sep 2019 19:25:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb40056e
 for <wireguard@lists.zx2c4.com>; Mon, 2 Sep 2019 19:25:53 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e1247e4
 for <wireguard@lists.zx2c4.com>; Mon, 2 Sep 2019 19:25:53 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id 7so4239630ljw.7
 for <wireguard@lists.zx2c4.com>; Mon, 02 Sep 2019 12:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=natulte-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=/zeZvHs3q95q5KQYJ2UMaarwZvTUrQOqNxpyerNfOGs=;
 b=KMfE3I1pCzW3mqrzCFJR9KLCzZFKPfnAoJMUABHFZ3jXkXivS+4uVT3P3oRBSAI3Be
 Ykutpl/WLDjAv44fKpVMcbDzlAfvk6DAYT6wgZIl4slR17yQhWg92IxDnkDH0UiiQkUt
 vjsCpMkwlcEB7US2OUSJd8I2lhLVcpZgV2yU+f72F5TUmJWc9eVI0LJ0gg24ilmaqdxm
 fC78F/V1to89+CZZcvgvtLK4Li6vq7gGYUYNRaCWlErF4K9n445xeAqvoGgr+2bhDzlF
 f3yMbN5wpB/DRLy0EyPnIIear/4HCXboa4CJc8ThvzRcGv47EpBy7/0BtHgaSSUzRTBi
 YqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/zeZvHs3q95q5KQYJ2UMaarwZvTUrQOqNxpyerNfOGs=;
 b=H8KyVEv5M6C/TwIbt1hsKVBjZj5ZJaSAqW2FroxiJS/amW7xbXhmUA+Q48AAQVaReA
 QZu0OQGfPGB05KwDGYPOhEN1TXKk8UhAUauo7NP2ceWKhhkWjTnE0gids37A/ei+JLyy
 6mDiGZvKKEqIUY+plaYKaSu/qESFUla93hQlTOZrKfJTpGJYweyN+Twdy0YzggGEW9Dw
 5wJPaCZSm6zk0QNnHMSya9uqQwwMmGf7wMdQIxRWhuXh4LOw6dpknU48jqqF0T48x/c7
 PIuR+vtUlVO63qp/0YiCJ6rFdLAXK5fu5T8jTmRUKWboz0J0fn82dDy1zdbJR+WEVqhI
 cHZw==
X-Gm-Message-State: APjAAAWdrfZX+JfW/hbaeSHefXJVaoAtEHA1meiAUl1wG/fFBCs15CFG
 AFqVMdkm/znoAQ++Hm+wNLgy7R4nkqLPBRgvWt2+X0Cv06Y=
X-Google-Smtp-Source: APXvYqwG0GxKCMJGB1Lj41HjgG7Q1mk/v6luqNS7f2rgOS6QqLti6r3eoW5bmTAcIzNCgi5KncbY3sIx+knsiRKlFck=
X-Received: by 2002:a2e:8051:: with SMTP id p17mr3472680ljg.222.1567452350630; 
 Mon, 02 Sep 2019 12:25:50 -0700 (PDT)
MIME-Version: 1.0
From: David Anderson <dave@natulte.net>
Date: Mon, 2 Sep 2019 12:26:10 -0700
Message-ID: <CAMx+r7VomZWjyJHRzESRWvXhS54+AkQ4G9yHd+hzWDAPxbJPCA@mail.gmail.com>
Subject: FYI: systemd's networkd (v242) incorrectly setting listen-port on wg
 interface
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

Posting here for posterity, in case someone else encounters this problem.

In systemd v242, networkd has a bug
(https://github.com/systemd/systemd/issues/12377), in which it ignores
the `ListenPort` directive in its config files for wireguard
interfaces. The results is that even if you specify ListenPort=51820,
when you restart networkd it'll assign a random listening port to the
wg interface.

This can lead to some frustrating debugging where your VPN
mysteriously doesn't come up, and it turns out to be because your
wireguard server is listening on entirely the wrong port. You fix it
with `wg set wg0 listen-port 51820` after networkd has started.

Because of systemd's "no patch releases" release cycle, this seems to
have been broken since 11 Apr for any distro using an unmodified v242
systemd. I discovered this on Debian Buster (the newest "stable").
Looks like the fix was pulled into at least NixOS and Gentoo, not sure
about other distros. v243 has the fix, and should be releasing Any
Time Now.

I'm going to file a Debian bug to request a backport of this patch,
since I'm guessing they're not going to be upgrading systemd routinely
on the stable track. Hopefully it won't bite too many people though,
since networkd isn't the default for network configuration on Buster
(I'm just an enthusiastic early adopter).

- Dave
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
