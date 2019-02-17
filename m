Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3633EC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 17:33:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA5EA2196F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 17:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="L4UkQkhK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA5EA2196F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0f3ba39;
	Sun, 17 Feb 2019 17:24:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ddd0507
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 17:24:13 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47ba4e37
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 17:24:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8d45266
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=8w9XAUS5QDUhiF0olllpejQMhcc=; b=L4UkQk
 hKhzffNvlFywXfCOMJh3QhOiSjreuNd0K8t8WLOzehP/vWRWuJ1mL7LaaC22QiA+
 /BrwgvxIwTifNXgb9VuijOH/4zpfyDjC9t/yRxVUwzeR7VyRxrPBb6ov/NHCR8mN
 874huSdcMK/SyruNPE0NMZ8GjThVFKxQ7cwZFHUCz9jRZfGSmOPVNkuxkPT9x35e
 rgDhrEeUgHr7EeOYjwQMZKUBs8wJcT6xI8zDknTwESI6NQRySslu58ER3xCQ/hLk
 KHC2qYPe+gNKQp2V1NP1eG7Autqygh3R1aRiOMNrr7MhPbEmjJS3Lp41MAHs3nhB
 /2+eHhfhDdEbv10w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e0c685a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 17:14:58 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id s5so24564121oth.7
 for <wireguard@lists.zx2c4.com>; Sun, 17 Feb 2019 09:32:31 -0800 (PST)
X-Gm-Message-State: AHQUAub47Ke9tXDMDiUvIrH4eVKNX78hk5cnWsAS4L312c8A8yZbryk1
 Hz4zsSVhMjVfYZxNmu8jeQRTMp/WBelZunMnVgc=
X-Google-Smtp-Source: AHgI3IZgUIbAlYKgZXVPPEN23DE9VUt1NgFGUI7LSArk6ci+TkP3Z4Dk3+eOvFI4xN3AsfGP/6JiiKXHUEQizqZb5+8=
X-Received: by 2002:a9d:7645:: with SMTP id o5mr3480148otl.225.1550424750786; 
 Sun, 17 Feb 2019 09:32:30 -0800 (PST)
MIME-Version: 1.0
References: <CAO_nJAYduCg0dRtBqKXvTAnntxVWuwV+6R1FWnOavKCBOaZnWg@mail.gmail.com>
In-Reply-To: <CAO_nJAYduCg0dRtBqKXvTAnntxVWuwV+6R1FWnOavKCBOaZnWg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 17 Feb 2019 18:31:21 +0100
X-Gmail-Original-Message-ID: <CAHmME9pWekbA1kj-wtb-twLo32fODV-ws7-bnFEJ8y5VuBrzog@mail.gmail.com>
Message-ID: <CAHmME9pWekbA1kj-wtb-twLo32fODV-ws7-bnFEJ8y5VuBrzog@mail.gmail.com>
Subject: Re: Current version of iOS client in App Store and github tags seems
 mismatched
To: member graysky <graysky@archlinux.us>
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
Content-Type: multipart/mixed; boundary="===============4966712010307374638=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4966712010307374638==
Content-Type: multipart/alternative; boundary="000000000000858fac05821a64eb"

--000000000000858fac05821a64eb
Content-Type: text/plain; charset="UTF-8"

App Store version 1.0.3, corresponding with the latest repo tag, is
currently awaiting App Store review, which can take a while, can be a bit
cantankerous, is totally opaque, and is generally out of our control. It is
now on Test Flight, though, if you're feeling impatient.

On Sun, Feb 17, 2019, 15:48 John <graysky@archlinux.us wrote:

> I am seeing version 1.0.2 of the WireGuard app in the App Store (date
> from 1 mo ago) but I see at least 3 newer tagged versions on github.
> I'm wondering if something is wrong pushing newer code to the App
> Store.
>

--000000000000858fac05821a64eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>App Store version 1.0.3, corresponding with the late=
st repo tag, is currently awaiting App Store review, which can take a while=
, can be a bit cantankerous, is totally opaque, and is generally out of our=
 control. It is now on Test Flight, though, if you&#39;re feeling impatient=
.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sun, Feb 17, 2019, =
15:48 John &lt;<a href=3D"mailto:graysky@archlinux.us">graysky@archlinux.us=
</a> wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I am seeing version 1.0=
.2 of the WireGuard app in the App Store (date<br>
from 1 mo ago) but I see at least 3 newer tagged versions on github.<br>
I&#39;m wondering if something is wrong pushing newer code to the App<br>
Store.<br>
</blockquote></div></div></div>

--000000000000858fac05821a64eb--

--===============4966712010307374638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4966712010307374638==--
