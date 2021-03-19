Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78830C433C1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 16:48:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9063461949
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 16:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9063461949
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bfc2aea1;
	Fri, 19 Mar 2021 16:48:52 +0000 (UTC)
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [2a00:1450:4864:20::541])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8cb37490
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 15:30:37 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z1so11272162edb.8
 for <wireguard@lists.zx2c4.com>; Fri, 19 Mar 2021 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ETJx7j0XoZyi79dj9W+zynKpNnhM8pDNYROphL+sZo=;
 b=mlYXaURMQUpcNcS1ME+v6d23ZqZ1S+aOazozl0lJbMuUvO+Fl1SxNOIHnhXH947DD4
 6zw3wHqZXUxqtuB25Ai1zsIDJaFbPnxTWk0p9iBpziXtKA71aWBrL3NmeRarTNsNbD6g
 cVgUug1CjXpp04qk8U+zRwEyHpBI6C8jP5AYoynMKkSoPZgAUVrFRW0HjVoMtIc9/r2I
 3EA+t3MbuTU0OiYAUJip8lQlcsTpEAH44l9yyg78Vzgl0ikdmzLGGBCouZ/SeRTT16rQ
 pyRUYHmdeTbu+Q9lfe+9+weVId2asPBm4BtmZXA9AkqlN1WSNOVwXC1JtbBbt6bSXOAz
 Xkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ETJx7j0XoZyi79dj9W+zynKpNnhM8pDNYROphL+sZo=;
 b=lpZNmlKT5Kt0Jqw5fTzwzy0GdyXGtILxMaPNkr23r67du5mFgSX7O5+Ls2I2OB/h0N
 X9WhVrKqgd1POXVlkcGDn8mFlxf6XU3X3cccKbXXloV5rYmOsG8jUMhlajUiKVJtM/fr
 B8vK0KybjpRpGumYZXfXnRzoJkkPO49R+FpOIPR3rn7BSOFn1GrrSpEFoEkFQdphWcfH
 pKeOvCTf5f2wqcCv8CWf/lWH5OlIeQhHid43ib0PI9+Qk9XaS6G6xok2gYKwH8PtwzsR
 cLJ77Da+ZzZ0bNmKLUGAlwpLC55fXFRl2Fn1pRxlOKG7lxIvxt7QdGDmwYs1aDR0BO3g
 oKhw==
X-Gm-Message-State: AOAM531r6hzXjk2x/z5U/Xk0SlkgPrYZaJFpsX+7Xc70iGaDok8UYEWe
 kM2X+I0w/jrhjmuw3v90+CZL6egHeacnkDI1pI1Zi9/WWDI=
X-Google-Smtp-Source: ABdhPJxHY4JP6dRnXDJmOPYWdixzkI4yKnrFJXdZ9gF9Ed+R/qJtjZp0n3SESln/PDfILyJDq3KOxr9j7tpSUaLx6fk=
X-Received: by 2002:aa7:db15:: with SMTP id t21mr10240884eds.145.1616167836920; 
 Fri, 19 Mar 2021 08:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <2c955be3-7360-cf8c-ad2f-ec1c382242ad@lostca.se>
In-Reply-To: <2c955be3-7360-cf8c-ad2f-ec1c382242ad@lostca.se>
From: Matthew Poletiek <matthew.poletiek@gmail.com>
Date: Fri, 19 Mar 2021 10:30:28 -0500
Message-ID: <CAJhSV8tdX2kEJFZNgzmvgBzz8OOXZvJ0C65QuQs0or3ktpe1yg@mail.gmail.com>
Subject: Re: Unable to serve TCP connections over wireguard interface on
 FreeBSD 13.0-RC2
To: Ashish <ashish.is@lostca.se>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 19 Mar 2021 16:48:51 +0000
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

Random thought,

Have you tried adjusting MTU?

Depending on the client/application, I have better luck with something
around 1300.
-------------------------------------------
Matthew Poletiek
303.810.9082
matthew.poletiek@gmail.com
www.matthewpoletiek.com



On Fri, Mar 19, 2021 at 9:09 AM Ashish <ashish.is@lostca.se> wrote:
>
>
> [apologies, in case you receive duplicate messages]
>
> Hi,
>
> I'm running if_wg kernel module (git revision: 5ef4d3efa691e71) on
> FreeBSD 13.0-RC2.
>
> With 172.18.10.1 being my local host's wireguard interface's IP address,
> I can receive SYN packets, but it does not seem to send any
> corresponding SYN/ACK.
>
> =========================
> 01:26:26.327484 IP 172.18[.10.3.34160 > 172.18.10.1.22: Flags [S], seq
> 1278197331, win 64860, options [mss 1380,sackOK,TS val 223949166 ecr
> 0,nop,wscale 7], length 0
> 01:26:42.708175 IP 172.18.10.3.34160 > 172.18.10.1.22: Flags [S], seq
> 1278197331, win 64860, options [mss 1380,sackOK,TS val 223965550 ecr
> 0,nop,wscale 7], length 0
> 01:27:14.964162 IP 172.18.10.3.34160 > 172.18.10.1.22: Flags [S], seq
> 1278197331, win 64860, options [mss 1380,sackOK,TS val 223997806 ecr
> 0,nop,wscale 7], length 0
>
>
> 01:28:34.035384 IP 172.18.10.2.41905 > 172.18.10.1.22: Flags [S], seq
> 2569759726, win 65535, options [mss 1380,nop,wscale 11,sackOK,TS val
> 3991744006 ecr 0], length 0
> 01:28:34.035392 IP 172.18.10.2.41905 > 172.18.10.1.22: Flags [S], seq
> 2569759726, win 65535, options [mss 1380,nop,wscale 11,sackOK,TS val
> 3991745042 ecr 0], length 0
> 01:28:34.036002 IP 172.18.10.2.41905 > 172.18.10.1.22: Flags [S], seq
> 2569759726, win 65535, options [mss 1380,nop,wscale 11,sackOK,TS val
> 3991747129 ecr 0], length 0
> =========================
>
> ICMP works fine:
>
> =========================
> 01:53:15.638529 IP 172.18.10.2 > 172.18.10.1: ICMP echo request, id
> 47881, seq 0, length 64
> 01:53:15.638535 IP 172.18.10.1 > 172.18.10.2: ICMP echo reply, id 47881,
> seq 0, length 64
> 01:53:16.624443 IP 172.18.10.2 > 172.18.10.1: ICMP echo request, id
> 47881, seq 1, length 64
> 01:53:16.624448 IP 172.18.10.1 > 172.18.10.2: ICMP echo reply, id 47881,
> seq 1, length 64
> 01:53:17.672109 IP 172.18.10.2 > 172.18.10.1: ICMP echo request, id
> 47881, seq 2, length 64
> 01:53:17.672115 IP 172.18.10.1 > 172.18.10.2: ICMP echo reply, id 47881,
> seq 2, length 64
> 01:53:18.676223 IP 172.18.10.2 > 172.18.10.1: ICMP echo request, id
> 47881, seq 3, length 64
> 01:53:18.676230 IP 172.18.10.1 > 172.18.10.2: ICMP echo reply, id 47881,
> seq 3, length 64
> 01:53:19.682131 IP 172.18.10.2 > 172.18.10.1: ICMP echo request, id
> 47881, seq 4, length 64
> 01:53:19.682136 IP 172.18.10.1 > 172.18.10.2: ICMP echo reply, id 47881,
> seq 4, length 64
> =========================
>
> And I can make outbound TCP connections:
>
> =========================
> 01:50:43.267331 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [S], seq
> 2119392003, win 65535, options [mss 1380,nop,wscale 11,sackOK,TS val
> 1918472905 ecr 0], length 0
> 01:50:43.415524 IP 172.18.10.2.22 > 172.18.10.1.55541: Flags [S.], seq
> 2602046635, ack 2119392004, win 65535, options [mss 1380,nop,wscale
> 11,sackOK,TS val 1347987709 ecr 1918472905], length 0
> 01:50:43.415532 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [.], ack 1,
> win 33, options [nop,nop,TS val 1918473053 ecr 1347987709], length 0
> 01:50:43.415613 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [P.], seq
> 1:31, ack 1, win 33, options [nop,nop,TS val 1918473053 ecr 1347987709],
> length 30
> 01:50:43.614035 IP 172.18.10.2.22 > 172.18.10.1.55541: Flags [P.], seq
> 1:39, ack 31, win 33, options [nop,nop,TS val 1347987870 ecr
> 1918473053], length 38
> 01:50:43.653218 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [.], ack
> 39, win 33, options [nop,nop,TS val 1918473291 ecr 1347987870], length 0
> 01:50:43.693420 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [P.], seq
> 31:1055, ack 39, win 33, options [nop,nop,TS val 1918473331 ecr
> 1347987870], length 1024
> 01:50:43.693435 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [P.], seq
> 1055:1543, ack 39, win 33, options [nop,nop,TS val 1918473331 ecr
> 1347987870], length 488
> 01:50:43.818391 IP 172.18.10.2.22 > 172.18.10.1.55541: Flags [P.], seq
> 39:1119, ack 31, win 33, options [nop,nop,TS val 1347988093 ecr
> 1918473291], length 1080
> 01:50:43.819870 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [P.], seq
> 1543:1591, ack 1119, win 33, options [nop,nop,TS val 1918473457 ecr
> 1347988093], length 48
> 01:50:43.880995 IP 172.18.10.2.22 > 172.18.10.1.55541: Flags [.], ack
> 1543, win 33, options [nop,nop,TS val 1347988163 ecr 1918473331], length 0
> 01:50:43.991756 IP 172.18.10.2.22 > 172.18.10.1.55541: Flags [P.], seq
> 1119:1571, ack 1591, win 33, options [nop,nop,TS val 1347988277 ecr
> 1918473457], length 452
> =========================
>
> The tunnel is configured using `wg-quick'. The firewalls are unloaded
> for this testing. I have made sure to delete the if_wg.ko shipped with
> FreeBSD, and rebooted the host before trying this.
>
> And ofcourse, if I switch to userspace Go implementation, everything
> works as expected, keeping rest of the configuration same, and with
> firewalls enabled.
>
> Thanks!
> --
> Ashish
>
