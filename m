Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA71C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 12:27:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8541F206E3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 12:27:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZRt6y+Un"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8541F206E3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a354315f;
	Tue, 10 Nov 2020 12:23:52 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a08feb35
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 12:23:50 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb59461f
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 12:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=nzWbdV
 4mMut9fhEN0kuBfyqUlJk=; b=ZRt6y+UnYUm6vYMYZkbnRDUj7CxOmL4czQJ733
 W+4HO2lcVo0ZmShkZ3yliHQJdg08bxgdk4vIxcj5bPBJAGUtBNR2ZYjrEG8u5kgn
 RCalymzAF8Aiu1imyOpCWXZ9AIMTYiBbTRsby24l8bQwlZTpkm5TQx+Qe1QUx9g8
 /NOUtR6IdjEDV7OeUZIDqmngTyvpBYffrdxhMvDb91QmirA97oMggNfm2VKJPACL
 Zs7b6V4t9v5jzoHOZGtlE8XBnWrFTUiJI/W93eeaSRtEvT8HqXilyO91jOChT9tR
 c5GHlIDRyyou817nARxqleUevGKtaS8aC1evrXqQhVRJAMTw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 73a455d0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 12:24:36 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id 10so7941466ybx.9
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 04:27:32 -0800 (PST)
X-Gm-Message-State: AOAM532omjHVj7DzgsiBjLNEqb6c78eU9sW2otzwclTAz4E9/76y00Il
 sAJW3jjcz2r/mfEGGOhPEQ0W31jyirhYVLW48LQ=
X-Google-Smtp-Source: ABdhPJxd3D+ypvp9lFgjGNMp1rG9aL1LwGOqHAo+WllyZSyb+koExE7bnyoT562a2s6vYEg57XJIaOZnrWCl3GqzPM0=
X-Received: by 2002:a05:6902:513:: with SMTP id
 x19mr26789462ybs.239.1605011251400; 
 Tue, 10 Nov 2020 04:27:31 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Nov 2020 13:27:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
Message-ID: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
Subject: Should we sunset Windows 7 support?
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

Hi,

Windows 7 has been EOL'd by Microsoft since January of this year. It
is no longer receiving security updates or fixes. This email is to get
the conversation started about doing the same with WireGuard for
Windows.

Supporting Windows 7 is an ongoing maintenance burden. For example, we
use SHA2 signatures instead of SHA1 signatures for our drivers, which
is not something we want to compromise on, and as a result Windows 7
users must have KB2921916 installed. But Microsoft never supplied
KB2921916 via Windows Update and it removed all Windows 7 hotfixes
from its webpage last year. So in order to keep supporting this, we're
forced to add clunky disgusting code like this:
https://git.zx2c4.com/wireguard-windows/commit/?id=b63957dc830e39c94844d2f0d32ba29575991e44
Keen readers will wince at all the layering violations there. Do we
really want to keep maintaining gross stuff like this? It makes me
uncomfortable to have kludges like that sitting around in the code.
Shouldn't I write an auto-downloader that then checks hashes?
Shouldn't I build this into the installer? Shouldn't I.... waste tons
of time supporting Windows 7 better?

Probably not.

But I know so many users are still using Windows 7. I'd like to hear
from you to understand why, in order to assess when is the right
moment to sunset our Windows 7 support.

So, if you care for Windows 7, please pipe up! We're not going to
remove support for it overnight, and we're not prepared yet to
announce any sort of formal deprecation plan, but the world is moving
on at some point.

Jason
