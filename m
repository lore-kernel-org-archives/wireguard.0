Return-Path: <SRS0=D9u6=QF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1D2C169C4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 29 Jan 2019 22:00:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C032082F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 29 Jan 2019 22:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajHrDzHJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10C032082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dde0f225;
	Tue, 29 Jan 2019 21:54:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 092c654a
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Jan 2019 21:54:18 +0000 (UTC)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 784c4841
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Jan 2019 21:54:18 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id n8so19344548otl.6
 for <wireguard@lists.zx2c4.com>; Tue, 29 Jan 2019 14:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=e74w+ElSxbSAJGssGjwdt70rp75nEB7klbyw13HrF2Q=;
 b=ajHrDzHJ6i1/Aw8rd42NWT8nKlPp6Q5mwk3d1w6QrVtIraNKcDMnFekGZvS09MBisz
 ZBTBT/PWYB6esbt/Q7vpGpkl2Y7C0en0XhEzVKg65R7q8WaKFdSbP1gwSx8kKkKUZN6I
 aNDQpcgsuh7vM9KglDnUEHLOO9NEhYjvdWzcfRrTeGqFXULGbFhU0qJ1NSrf2aFqWlWV
 YckIA55YpjSCIuKMCfDchfM1mgpkxG87VjFTLmrHyKXQ5gEieg83NvcK57ZbYUTz5Y6D
 pMs/8/sGUSoxmIN/HMDDCPIriLwoVxNcKOYLgXQhGzi2ELDde1CGQGytd+DHzzfFAMqa
 lynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=e74w+ElSxbSAJGssGjwdt70rp75nEB7klbyw13HrF2Q=;
 b=bsf9yTozqL+ZU7nGuwcQY4ooLuMAfvDI6+jsaEu3KAIhEkT//bzqzen6lqlRWGkfU7
 mffD+l4YD6S+OxzXOUbQL+pEepT0QWVGSAWedYwSzC+OT3hglEZLLE9aBNApOzLHvVjh
 UIFdQc53iVTYJ0uImpAmoa9nIuAWl6HWD8S/4NXx7uEszRrSkQufNna4pNgjXCW3/fPi
 VyTG3oJQHIYRPXp/Bzb2N4vQTZin805hBdeaBGi8vjLAKCIOZMN/PK4sS1/axQLXggMe
 itMO2PVCR96YYPkKFtUxCjSHl204yUifatiJV3vsatOe5t13jYVvifpdDMMForRtz47x
 4Nzg==
X-Gm-Message-State: AJcUukd4XmQaQd8dy4VYwco+dZRFEvM+u9iBMW9KA8MJbYMrST95TO42
 5sWLMqcV8blLcabW7YoW0xdXgLGVKinYyz2HGVUZUCDAm1o=
X-Google-Smtp-Source: ALg8bN5AXMhdH2KuybiXxiDQVPZAd6IJWt29j++8x0GqjscL0MW6mFgOdppzychgZx/vxFlVw5ihmpDR0aCb2819jrc=
X-Received: by 2002:a9d:6108:: with SMTP id i8mr21478823otj.278.1548799210260; 
 Tue, 29 Jan 2019 14:00:10 -0800 (PST)
MIME-Version: 1.0
From: Jaseem Abid <jaseemabid@gmail.com>
Date: Wed, 30 Jan 2019 03:29:33 +0530
Message-ID: <CAH-tXsDAjhKXcwSKSEGvQtrzoznwaL4dufOj+UiLj3bQuF1tMQ@mail.gmail.com>
Subject: Request for review: Add a short name attribute to peers for human
 friendly output
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============3745782599373975691=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3745782599373975691==
Content-Type: multipart/alternative; boundary="000000000000c1906005809fea5f"

--000000000000c1906005809fea5f
Content-Type: text/plain; charset="UTF-8"

Hello lovely WireGuard people,

I wrote a tiny patch to add a name attribute to peers because identifying
clients on my VPN just got very hard. Also hacking on wg source was a lot of
fun. I asked @zx2c4 about this a while ago and he was open to the idea.

It's not _really_ ready for a submission yet because of a few rough edges
but
I'd love to get some eyes on this if anyone is kind! I've never written any
kernel code before and my C is a bit rusty, so please feel free to be picky
about the review. I've added '*NOTE:*'s for the reviewer where I'm not sure
of
the approach.

A few other questions,

1. There are barely any inline code comments, is that intentional or
something
that the community would love to improve? I don't mean the really obvious
ones
but things that are tricky.

2. Is there any interest in a getting started guide for developers wanting
to
work on wireguard itself? Something like the usual CONTRIBUTING.md? I had
to dig
through a lot of netlink tutorials and old kernel newbie guides to make any
progress. It would be helpful to have it in one small doc.

The patch stays in the `name` branch here[1] and this commit does most of
the
work[2].

[1]: https://github.com/jaseemabid/WireGuard/tree/name
[2]: https://github.com/jaseemabid/WireGuard/commit/544e59b4

-- 
Regards,

Jaseem Abid
https://twitter.com/jaseemabid

--000000000000c1906005809fea5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello lovely WireGuard p=
eople,<br><br>I wrote a tiny patch to add a name attribute to peers because=
 identifying<br>clients on my VPN just got very hard. Also hacking on wg so=
urce was a lot of<br>fun. I asked @zx2c4 about this a while ago and he was =
open to the idea.<br><br>It&#39;s not _really_ ready for a submission yet b=
ecause of a few rough edges but<br>I&#39;d love to get some eyes on this if=
 anyone is kind! I&#39;ve never written any<br>kernel code before and my C =
is a bit rusty, so please feel free to be picky<br>about the review. I&#39;=
ve added &#39;*NOTE:*&#39;s for the reviewer where I&#39;m not sure of<br>t=
he approach.<br><br>A few other questions,<br><br>1. There are barely any i=
nline code comments, is that intentional or something<br>that the community=
 would love to improve? I don&#39;t mean the really obvious ones<br>but thi=
ngs that are tricky.<br><br>2. Is there any interest in a getting started g=
uide for developers wanting to<br>work on wireguard itself? Something like =
the usual CONTRIBUTING.md? I had to dig<br>through a lot of netlink tutoria=
ls and old kernel newbie guides to make any<br>progress. It would be helpfu=
l to have it in one small doc.<br><br>The patch stays in the `name` branch =
here[1] and this commit does most of the<br>work[2].<br><br>[1]: <a href=3D=
"https://github.com/jaseemabid/WireGuard/tree/name">https://github.com/jase=
emabid/WireGuard/tree/name</a><br>[2]: <a href=3D"https://github.com/jaseem=
abid/WireGuard/commit/544e59b4">https://github.com/jaseemabid/WireGuard/com=
mit/544e59b4</a><br><br><div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re">Regards, <br><br>Jaseem Abid<br><a href=3D"https://twitter.com/jaseemab=
id" target=3D"_blank">https://twitter.com/jaseemabid</a><br></div></div></d=
iv></div></div>

--000000000000c1906005809fea5f--

--===============3745782599373975691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3745782599373975691==--
