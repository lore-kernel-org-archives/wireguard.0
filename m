Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B75C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 10:41:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B20A23BDE
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 10:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B20A23BDE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 634ceb43;
	Sat, 19 Dec 2020 10:31:32 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4bf8a5a5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 10:31:30 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96c3e8bd
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 10:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to
 :content-type; s=mail; bh=NWMzJQnXmQQJYoj8iRlPTNB5g3Y=; b=CaTBDg
 unObxBK23+ahA3+KHDRuCx8/EmNdI3vteAARTrw0boPrL6GQcXDwXIP8Kl1v7SM9
 mjpZ7mvdZA7SqoyFoYq/CjoLPvlKpHqxrsUmj3OI/9pJjwIDmqBSUB7rhafmdV4O
 +xpVs7iPu9CsMPwGQXQNGhbLDXbTA66W6ePw0l4MntOoEiDevEpIucPIXXetRW9B
 KfXZQeHOYFa1AuyoiEK5eChUUOUIACqZeqYfSXJrGQOuH4Q9Gz4a2Tzq6nQPOl5C
 U1Y8AIPT/dDBsVjfglL3jtZWTwY1DGKxDrMfW5ZeBvZGdhDawfbVYo1BlPmqFl2M
 AnYqse+iYeLQdx8w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2dea88c6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 10:32:16 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id v67so4381406ybi.1
 for <wireguard@lists.zx2c4.com>; Sat, 19 Dec 2020 02:40:15 -0800 (PST)
X-Gm-Message-State: AOAM5321sRKVorUIbwbTJzJvcVJnFi+kQ2ngVBHQAjuaNyklKA6TeAt5
 3d7Qmdq3V2mtqvi84U4tEyRD+McgIGoVDHWoXx4=
X-Google-Smtp-Source: ABdhPJxfLd2HvWM+6yVjOfYa32chreY7jN2yGlMVNcPx1TV+Y1lCQ9WzkbcddwPClwgWLxVQ87wEPdmz7gEux7MRllY=
X-Received: by 2002:a25:4d7:: with SMTP id 206mr11905619ybe.306.1608374415481; 
 Sat, 19 Dec 2020 02:40:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:6c2:b029:30:3e8e:4ce2 with HTTP; Sat, 19 Dec 2020
 02:40:14 -0800 (PST)
In-Reply-To: <CAHmME9pZq6pMV9W2EiYRP_mOLkQXVDpdB83kEFsiuhEH807bzA@mail.gmail.com>
References: <A9F23E70-C8AA-4C54-99E4-63E2E40FE0FA@glenn.id.au>
 <CAHmME9pzNQeEdDnvu8mXFnYHgNibuqSLi5viAtYjDrF0wbEMoQ@mail.gmail.com>
 <CAHmME9qCRWXMVjuz6g6M0wMvhj9v90sTkHNOFCr+Jht-rUNFoQ@mail.gmail.com>
 <CAHmME9pZq6pMV9W2EiYRP_mOLkQXVDpdB83kEFsiuhEH807bzA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 19 Dec 2020 11:40:14 +0100
X-Gmail-Original-Message-ID: <CAHmME9owPe-HX=Lw28HzM7_cm0XqVZJOzVcHcfCgwXp-7GU+DQ@mail.gmail.com>
Message-ID: <CAHmME9owPe-HX=Lw28HzM7_cm0XqVZJOzVcHcfCgwXp-7GU+DQ@mail.gmail.com>
Subject: Re: WireGuard on macOS stopped working after 1.0.10 update
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey folks,

On 12/19/20, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> They rejected the submission with the donation link removed, citing
> the existence of the donation link in the old build and providing a
> screenshot of the old build, rather than the new build. I sent them a
> response pointing out that they reviewed the wrong build, looking at
> the old build rather than the new build, and I sent them a photo of
> the new build as installed from Test Fight.

Looks like we got lucky this time, and things are all set! 1.0.11
should now be available in the App Store. Hopefully this concludes the
saga with the recent updates, and things will be smooth sailing from
here on out. But as usual, please don't hesitate to send new bugs,
with redacted configs and logs.

Jason
