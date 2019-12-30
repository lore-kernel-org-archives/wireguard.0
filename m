Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7163C32767
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:41:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B15221734
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:41:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3dMlk9d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B15221734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0461526c;
	Fri, 3 Jan 2020 15:40:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 768fddf6
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 21:01:25 +0000 (UTC)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f28b2ac
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 21:01:25 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t2so33763229wrr.1
 for <wireguard@lists.zx2c4.com>; Mon, 30 Dec 2019 13:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TBALu4c4SEimUXNdgAXuKGY2PzmsvxiVKDD+3riiNkQ=;
 b=b3dMlk9d3Jzh5DkEquwkL3PeoQBUQX/4hvgfmd6HpdRzHCMBkLq4jL4OmK9NziAaNL
 KLIJo5botnOi4p8Hxs9UlEXIlS2xKr0l7Sh0fYp8IhY8ePeL+1/IkIArt1HPNKH3JMt6
 aeeQxRz+nl47UaqKSFx3VcQDJ5DuG1InzUYOU/T4ACkCAiCz8bs9iVZ8edsV3Hpyz24Y
 y53FMluBFrAwpCrGRo0u99Q0JQXdQkLtClDF7o5l7y5ztRI1HyRscYJ51VS6vIXTmp7R
 Rltne0S8xS7Ks7ymMKgioufdEdntzqXItAhR77cLYs6tJ/aRIjySgfRunvwr11kFL74O
 IBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TBALu4c4SEimUXNdgAXuKGY2PzmsvxiVKDD+3riiNkQ=;
 b=YFLEpgmFQB8UXwgaX+CqbtABop11s5si8jGOMVOzrfUyg58BxG/+SE/mKmrf4ZDzGR
 pwqyP02sxmSfpBX3oV/C9DTHCFkccvQQo6XQs7VKyWY72cNWRRcH/yTUtcHxnGOpMpMP
 OBxDptIdpERA9OHWAL7c0ZF/no3PkjgBAuDyUjVJ72lE9LcVVHZWr8FC3FF2YLvBUzlO
 DCDVQ4967oxhVX22CAEd/QcjbLl4C+LQmyhclo0uF6MqBOmKmWY1ZCfCDOYOPCNgLu7i
 TjFk7xuhCjL9pzqtliJdb8bWiNO2fqDcCjNOAiUQ8L4tAfFoBX2uhC3fXEGEC/mDPIN7
 sdFw==
X-Gm-Message-State: APjAAAVgbT5Bhxk0UHdv7zC7xOMaEUIxUGjz2SKk8u/sehYzMXgFRvax
 a4xNlOl6XYyaM9Nee5xt3HkDxAX6vSimjfq4nPE=
X-Google-Smtp-Source: APXvYqzqgiTFsIaadF/1bZ7KAE61yqp6Vy9ry9ywp9u3H8y9+qA4rR55JiHFe+TlwhosbA+Ao2jB401bzKiOcG9ITTc=
X-Received: by 2002:adf:d846:: with SMTP id k6mr65587596wrl.337.1577739684404; 
 Mon, 30 Dec 2019 13:01:24 -0800 (PST)
MIME-Version: 1.0
References: <CALXT2kFp9SPFELS97vHJFndGH7cFh0=gjC1h9Tuv2LgSMHeJ-Q@mail.gmail.com>
In-Reply-To: <CALXT2kFp9SPFELS97vHJFndGH7cFh0=gjC1h9Tuv2LgSMHeJ-Q@mail.gmail.com>
From: Blaok <chiblaok+wireguarddev@gmail.com>
Date: Mon, 30 Dec 2019 13:01:12 -0800
Message-ID: <CANGvTamn0NJYumfXWvzGYVvoWaXdmox8rLMTFnMmZvOoNaz__g@mail.gmail.com>
Subject: Re: Data Connection Lost Win10 (Server) Win10 (Clients) 37
To: eric brandl <ericb0813@gmail.com>
X-Mailman-Approved-At: Fri, 03 Jan 2020 16:40:00 +0100
Cc: wireguard@lists.zx2c4.com
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

I am experiencing the same issue. For me the problem occurs much less
frequently (one or two times per day) so it wasn't too much trouble to
me. My windows client is configured with 8 peers but most of the time
it communicates with only one of them. There is nothing other than
"Failed to write packet to TUN device: file already closed" in the log
that is related to the issue (unless there is debugging log that I did
not turn on).

I did some research myself earlier. I'm pretty sure "file already
closed" was reported by and only by
https://git.zx2c4.com/wireguard-go/tree/tun/tun_windows.go#n224 and
https://git.zx2c4.com/wireguard-go/tree/tun/tun_windows.go#n229 in the
Write function. However, I was unable to make anything to fix the
problem other than invoking a cmd script to reset the whole interface.
I think https://git.zx2c4.com/wireguard-go/commit/?id=2b242f93932e1c4ab8b45dd0f628dd4fe063699b
partially solves the problem. Without this commit, the problem can be
reproduced simply by making a large volume of traffic in a short
period (e.g. 100Mbps for a few minutes). Now with this commit I am
unable to manually reproduce it anymore, but that "Failed to write
packet to TUN device: file already closed" still happens every several
days.

Blaok

On Mon, Dec 30, 2019 at 1:52 AM eric brandl <ericb0813@gmail.com> wrote:
>
> Issue I am having is sporadically around every 5 to 30 min all peer connections no longer send traffic over them, and the only way to get them working again is to restart the WireGuard server (Win 10) .
>
>
> The log shows this:
>
> 2019-12-28 01:39:46.625: [TUN] [GameNet] Failed to write packet to TUN device: file already closed
>
> 2019-12-28 01:39:46.629: [TUN] [GameNet] Binding v4 socket to interface 16 (blackhole=false)
>
> 2019-12-28 01:39:46.631: [TUN] [GameNet] Failed to write packet to TUN device: file already closed
>
> 2019-12-28 01:39:46.649: [TUN] [GameNet] Failed to write packet to TUN device: file already closed
>
> 2019-12-28 01:39:46.668: [TUN] [GameNet] Failed to write packet to TUN device: file already closed
>
> 2019-12-28 01:39:46.692: [TUN] [GameNet] Failed to write packet to TUN device: file already closed
>
> 2019-12-28 01:39:46.714: [TUN] [GameNet] Failed to write packet to TUN device: file already closed
>
> 2019-12-28 01:39:46.730: [TUN] [GameNet] Failed to write packet to TUN device: file already closed
>
>
> Server Config:
>
> [Interface]
> PrivateKey = SNIP
> ListenPort = 5687
> Address = 10.152.152.1/24
> MTU = 1360
>
> [Peer]
> PublicKey = BMIr6jiTNpu1wiSAqTLBUBFnM3DBW+RMdvapkmnFAiY=
> AllowedIPs = 10.152.152.2/32
>
> [Peer]
> PublicKey = gY0SvOX8lKfLkMXHIwA6pNnB8ooc36vCOPlQ0WmR5Es=
> AllowedIPs = 10.152.152.3/32
>
> [Peer]
> PublicKey = NcbtXceq1dh3khRv+YXXXw9RmJJH+r0acVIGbJ3qWSY=
> AllowedIPs = 10.152.152.4/32
>
> [Peer]
> PublicKey = LkMrfhjHOz6VgL9gTsBkcahkw++RMYokMbJnViQ9xVM=
> AllowedIPs = 10.152.152.5/32
>
> [Peer]
> PublicKey = YAKEhGM4Wr1SYSb197ugyV7IKqUOh+Jzpg7NVNLa3AM=
> AllowedIPs = 10.152.152.6/32
>
> [Peer]
> PublicKey = MZ1ycd1MdUvFUDpRxgY0hc7/jwTP9TuuYB6uwmyYdmQ=
> AllowedIPs = 10.152.152.7/32
>
> [Peer]
> PublicKey = Re5hkZG10PuN993GVRkkYCjjnyKyk96SCN4vFP5l/mM=
> AllowedIPs = 10.152.152.8/32
>
> [Peer]
> PublicKey = Yrx9W1PC60Uw9tpsRIByV0U+aW3eE210X1LCxTnk21w=
> AllowedIPs = 10.152.152.10/32
>
> Example Client Config:
>
> [Interface]
> PrivateKey = generated_private_key
> ListenPort = 5687
> Address = 10.152.152.3/24
> MTU = 1360
>
> [Peer]
> PublicKey = wQE513lYAgeLMcA72rGUnAcqknTYRlC2+oyWKI4Q1j4=
> AllowedIPs = 10.152.152.0/24
> Endpoint = SNIP:5687
> PersistentKeepalive = 40
>
> Things I have tried:
>
> Rolling back to 35
>
> Changing MTU
>
> Switching NIC in Proxmox from Intel to Realtek and back
>
>
> Other Notes:
>
> With only two peers connected it seems to be less of an issue, with 8 or so connected we get this issue quicker.
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
