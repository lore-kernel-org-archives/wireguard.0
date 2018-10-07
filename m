Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE177C6787D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 22:38:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF4D72087D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 22:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GY+xrypj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF4D72087D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c46c4519;
	Sun, 7 Oct 2018 22:37:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 366d22ef
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 22:37:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7674a772
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 22:37:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94a9d072
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 22:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=E/7bKDvVsVwbdiJp3AfCuwC3f+0=; b=GY+xry
 pj9y5WHM7W0SY/bKG8PxLvyi0H0d/QtSceeNqk5qfILG3tPydJhdr1+HvaCUM+lO
 F5sdwh5WR2RTY/T7HCOuzMuIqL/zY+M7so7aszIWRdD9XmO6DqTX1q3pXSfARw53
 mVSf1khinsk6/VGCM4mO16fmndYJ7sMfp5VMKv3aWIAqBfgAKylFLFNGNCysgRn4
 2ocC3ASzA9pZjtOdQvdEYfXe6Zn/T2GK+SUXQLzHN4BkFL5+FlRoqJbjA3R5S4te
 OUYLILZAMsxCYa7RDYJDbu/0NERMoyp4BHfG8brXBhgApEOhZbAE8l3FbdpRjgYe
 nQ9qLSoL7YSSCRsw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4043ea93
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 22:37:10 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id w67so17822247ota.7
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 15:37:52 -0700 (PDT)
X-Gm-Message-State: ABuFfog58zvN7nCMyyQT3WFrwEVnQz/n2TCFsoosZNZXe0RrVMDt1P0h
 gI+g9jzv0NzL+HBORsU6+O1v+Dj8tZPCsVw8wdo=
X-Google-Smtp-Source: ACcGV63G//YfBER/Hqtw/GyuZMgQMPGyaRkjIH4/3ba9Naj5aeiot97BYF/vqEPIaH5BLHlzPdOam+ofEv6eo7Llfiw=
X-Received: by 2002:a9d:1723:: with SMTP id i35mr12981125ota.223.1538951872148; 
 Sun, 07 Oct 2018 15:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <6b314daa5d672a51@frisell.zx2c4.com>
 <8j30b7w3yIgg5rmXSRUNlDH8yquzSydWwqfdQrnRe-T7mK5e_lYfD2v5IKjgHVAcWptoOVXZ_wENwJ1i733Yn45_TjlMg7Tf_WmW7Dkeuco=@protonmail.ch>
In-Reply-To: <8j30b7w3yIgg5rmXSRUNlDH8yquzSydWwqfdQrnRe-T7mK5e_lYfD2v5IKjgHVAcWptoOVXZ_wENwJ1i733Yn45_TjlMg7Tf_WmW7Dkeuco=@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 8 Oct 2018 00:37:40 +0200
X-Gmail-Original-Message-ID: <CAHmME9qboTvSU1+bu8Oi-zwBp8f6UWnfaGb-NEtfsnvnJUL66w@mail.gmail.com>
Message-ID: <CAHmME9qboTvSU1+bu8Oi-zwBp8f6UWnfaGb-NEtfsnvnJUL66w@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20181007` Available
To: Jordan Glover <Golden_Miller83@protonmail.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Sun, Oct 7, 2018 at 10:49 PM Jordan Glover
<Golden_Miller83@protonmail.ch> wrote:
> I got an error when doing in-tree build using WireGuard/contrib/kernel-tree/create-patch.sh
>
> net/wireguard/receive.c:338:10: fatal error: selftest/counter.c: No such file or directory
>  #include "selftest/counter.c"
>           ^~~~~~~~~~~~~~~~~~~~
> compilation terminated.

Youch. I'm rewriting those scripts so that it picks up file name
changes like this automatically, so it's not such a whack-a-mole
situation.

Let me know if this fixes it:
https://git.zx2c4.com/WireGuard/commit/?id=28366408148d0f230daebd9a61c5f7bf0c3e0390

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
