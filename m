Return-Path: <SRS0=e3Y3=QZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81867C4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 23:03:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1459720578
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 23:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEmwG0Tj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1459720578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e1a2028;
	Mon, 18 Feb 2019 22:54:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33c76376
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 04:00:32 +0000 (UTC)
Received: from mail-it1-x12b.google.com (mail-it1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64956ca5
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 04:00:32 +0000 (UTC)
Received: by mail-it1-x12b.google.com with SMTP id f10so10173471ita.4
 for <wireguard@lists.zx2c4.com>; Sat, 16 Feb 2019 20:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=8g6emL5WycQ9FEqZuyKjkDYGnS/sLmesFyIKbUCh16o=;
 b=nEmwG0TjowUGSDN4qyYVPjLBp/nMDnezH/9l05Oodq81dkeKOFqNmNrpOfO2wVNdHA
 YhIxFDJ3z3nfeVJPrdlShm4sQ1FnWA9bnDeS3jdPRpVqg/eOj9NMnWvqcSBVQGMR8I+1
 L8OnlPF6wx5YTwb/UVvqVg+pxNgq2+86gh3j/OOBoBKcVEkdD36C0DLz8GpxEpVSFd2O
 HXliQOxCa7vk01lb0i7Z/AqTe1poWXL3lYS30FH1YmYCeWGLUu0/kMXxi8gmw9Whg/oG
 dBIUGxtry3FgO82KMwEzpUxhgwGi3SBDwJUpMEXhbNGf6E58RAat1jVCmR6hD9Hdedde
 e3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=8g6emL5WycQ9FEqZuyKjkDYGnS/sLmesFyIKbUCh16o=;
 b=YzJ5eBEzol26bSpeobSrKqLG+3QTHyS3TioZnXatROSIy6IfUV/YPjHPDzYBxLxmkm
 Gn9a8zZP6ov/sc1UU4AHiQajqLEs0gtjVmQaF4DqOjuTnz2QbtHctSeouHw3onpv+t8a
 rv/pU1T5YGaMTdoNqTz2J/RutLmLuAF1fAUT/UGSRdAd1u+s6elbCAQlVQgrKoOC8Zbe
 OL9hvH98qmihHFxh+vY9+LVdoVCzhynDNKxaP4B4o2npX+iFmceUspcRE8afnTmMmycv
 iBgT8WP4UUQ5AwPMGGWrmhzGINoFoNJE3oJgr0VfJ38P8a1ID1xCnyHvlZr/+Ng19d24
 Vz7w==
X-Gm-Message-State: AHQUAuZPQcKDLGtwzPN0dYR45sniUCfT+AiR4QXZh74i90L4qI4myvrU
 zDHM4vEeGNoO5MBDRk9ch23BgLeO5pCoZ3BcAwKYa7s3
X-Google-Smtp-Source: AHgI3IZOo9i27REYkB9gfLSiYbmMVDCL+n2UeiQq+CbFLBBmDUm8IEsl2CN4XiYs/yXsl09C2xcgg+c+zeZYjgv6tPs=
X-Received: by 2002:a24:3a12:: with SMTP id m18mr1493323itm.5.1550376526003;
 Sat, 16 Feb 2019 20:08:46 -0800 (PST)
MIME-Version: 1.0
References: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
 <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
In-Reply-To: <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Sat, 16 Feb 2019 23:08:25 -0500
Message-ID: <CAH8yC8=2pjH3VbxaeJ-sTSnV64-KxKK3AHA7K_EEANX5_g02Mw@mail.gmail.com>
Subject: Re: DNS name resolution should not be done during configuration
 parsing.
To: David Kerr <david@kerr.net>
X-Mailman-Approved-At: Mon, 18 Feb 2019 23:54:27 +0100
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: noloader@gmail.com
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

On Sat, Feb 16, 2019 at 10:35 PM David Kerr <david@kerr.net> wrote:
>
> Erik, see here for a proposed fix.  No response from the WireGuard team yet.
>
> https://lists.zx2c4.com/pipermail/wireguard/2019-January/003842.html
>
> Recently I had a power outage and both my gateway and cable modem went offline. On power recovery both devices start up, but the gateway completes startup before the cable modem completes its protocol negotiations, so initially the external network (eth0) is not functional.  That comes online say one minute later and all is well.
>
> Except that all is not well.  Wireguard failed to start up because I have Endpoint=<a URL> instead of a IP address.  And because external interface is not live yet, DNS lookup fails and Wireguard does not gracefully handle it.  This is really important because Wireguard may be my only way into my local network.
>
> As work-around I replaced the URL with the IP address... but that is not a long term solution if the endpoint is not a static IP address.
>
> Wireguard needs to handle the situation where external network may not have stabilized at the time it starts up.  The above link proposed a fix.

Forgive my ignorance... Should init just retry the service start?
Something like this (from Systemd):

    [Unit]
    StartLimitInterval=360
    StartLimitBurst=5

The statements above say to retry 5 times within 360 seconds.

Jeff
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
