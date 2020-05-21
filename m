Return-Path: <SRS0=2ld3=7D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEA9C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 01:52:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22EAC20709
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 01:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="azsG9a7o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22EAC20709
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4781669d;
	Thu, 21 May 2020 01:37:37 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8bb3f767
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 May 2020 01:37:36 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 733331e0
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 May 2020 01:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=pnNyIiELkqX8VOm2YPR0+f19qh4=; b=azsG9a
 7oX0IkVo0EafyEYkU2j2+QdQYKzxLQiFBf4zXOtZLsRQuG5sOjHywamcj7CQNRLj
 uK5DvWRNtYqC355nk9Gc9s4NvxUdb1TaZ6KDmtTdYrsD6e9dWKfMtQSqG60KYvR7
 bb/AXIXIV2vttcT2BEnIPnGd9OG8s+3fQRbXns4K81xHWnbumm3mATYEyYcXTVM4
 3DEONPd49D/Bwb1HE9Up9D6vTbFgNFwPtT6CSebz3jdsbYrY/mYJ9isVoSnmyxZ4
 KVuS5qphPfnaBfdHm94pxht9qOxsh/g2YUH2szJH2bqAJPYUi8cx4JLL5NeWBC+s
 qiytc5PGHY/5Khnw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2ef4feb7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 May 2020 01:37:35 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id c16so5646544iol.3
 for <wireguard@lists.zx2c4.com>; Wed, 20 May 2020 18:52:08 -0700 (PDT)
X-Gm-Message-State: AOAM530V8XlSMaTu0e7cgawLhrPypYR8Gh0CKfvCFqlQxKlW6jhZg7mq
 Nk4nzt1/uCqu/C1UQlfdDAC/Fz21Dzisx0LgjwU=
X-Google-Smtp-Source: ABdhPJwE3J8yapTuUbvmO8PhiZBn3FPMIrpjdvwhZmZv1k1ThUqiNEc6WY16CB5qSSIkoVArWKrOMf8plQ1TOunMZn0=
X-Received: by 2002:a6b:ba02:: with SMTP id k2mr5960198iof.25.1590025928280;
 Wed, 20 May 2020 18:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <e0484514-9c09-cc78-022c-54d0e59145cd@gmail.com>
In-Reply-To: <e0484514-9c09-cc78-022c-54d0e59145cd@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 May 2020 19:51:56 -0600
X-Gmail-Original-Message-ID: <CAHmME9ry8QjC2rCynYD-BzhYxfmkmgdVLWrRJvfYghKQgOz9yQ@mail.gmail.com>
Message-ID: <CAHmME9ry8QjC2rCynYD-BzhYxfmkmgdVLWrRJvfYghKQgOz9yQ@mail.gmail.com>
Subject: Re: Wireguard is broken by recent ubuntu 18.04 kernel update
To: unit193@ubuntu.com
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Vasili Pupkin <diggest@gmail.com>
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

Hey Unit193,

Now would be a good time to bump the ppa for all the versions, as
downstream finally released the new kernel.

Thanks,
Jason

On Wed, May 20, 2020 at 7:14 AM Vasili Pupkin <diggest@gmail.com> wrote:
>
> The system is Ubuntu 18.04.4, and wireguard is broken in recent kernel
> update "5.3.0-53.47~18.04.1"... not sure why 18.04.1 is landed on
> 18.04.4 system
>
> # ip link add dev wg0 type wireguard
> Error: Unknown device type.
>
> And nothing is shown by "lsmod | grep wireguard' and "dmesg | grep
> wireguard"
>
> I've tried "apt install --reinstall wireguard" and "update-initramfs -u
> -k all" with no luck.
>
> Everything works fine with kernel 5.3.0-51
