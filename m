Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3133C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 18:12:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A2F322201
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 18:12:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vB0R0dPt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A2F322201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7821327d;
	Thu, 12 Nov 2020 18:08:31 +0000 (UTC)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [2607:f8b0:4864:20::b2f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id acaa8a46
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 18:08:28 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id s8so6193114yba.13
 for <wireguard@lists.zx2c4.com>; Thu, 12 Nov 2020 10:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ev6DO5EGRJpDsd0QC+yjQ6Himadeqrhjr77BI4p7dDo=;
 b=vB0R0dPtifiQHkmhLWJ4zWFVteAUQxTIoPnzC6FiehYsau01Q0KZLkACnrcIAudWMz
 A8CtQGXBHmE34cPovUw9xtUPuQzxSaePYVLXyaRPbuqEPtHyHiikJ+KJEKphBpsguJ75
 gI39LOBFZagE4kfdIwEktrm1fcaT2skFhD6Y0/T+g1RyMAwMoV/yR7VEWncmCUoZ1EyD
 X8uAmRV9rySt/8/zg4S9RCDufqzfByO8cQP0DGPPU+02epvdhy+9f+8n0OZ2P/ojh70u
 fC3MoVcx2NeD/7CB+901Qqt7yJAaLd9PzkAzSUQGr+8VnmYob8wKbBCb9X7kDfz/xuD0
 SQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ev6DO5EGRJpDsd0QC+yjQ6Himadeqrhjr77BI4p7dDo=;
 b=YD2Sye99SF/OWD9bk9ksurL6izzxjgqaQzVd3eTYs871U47HbFTbL0WsZ1bY+Oy22W
 XV7saEzFakU8nqc6CmuB3EOOihfIKOrkOmsxoo0D7cWIG/MSQP6htIzmvr+muuVSvHVB
 4DWXurtUbxycyr/oMsNm0TSBizwGz9yhQ4N7hkCZVXqUjX/0GzbBk8zzXk7euZih/kIU
 pA7KxMgULAUbZ8vNk1GU23Enp8zlgvmkv2EVme2RKtLDfkSiKEag+BORQjCzIxMEuulp
 PKe+a4PtTABjsynRW4DRkb+OA7i8a1GINfOVLSl82QYzsxwY6NyxxcyoYn+6ZJS8JNSy
 VzXg==
X-Gm-Message-State: AOAM53288Mo3au8a4rtS9c4aZLJjz8512belDU8nUI7x/pttcifZp6WE
 YgUQ6pMLfqg3z1bgOiVict5w9WuuhjC0IcKlNK4=
X-Google-Smtp-Source: ABdhPJy6YERrWjhjm1YHgDdHzwcMDOQOiYSphEMDPVTNxa1Krq3YPyArUr5fHXm/or8RNFKmkFESlbG9Gc6NxG036u8=
X-Received: by 2002:a25:7542:: with SMTP id q63mr1146605ybc.176.1605204747212; 
 Thu, 12 Nov 2020 10:12:27 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <CAH8yC8=tJD0ZKKTsRjynTqusRWr3m8YL0xoLNJe8AcR2BAHu4A@mail.gmail.com>
In-Reply-To: <CAH8yC8=tJD0ZKKTsRjynTqusRWr3m8YL0xoLNJe8AcR2BAHu4A@mail.gmail.com>
From: Neal Gompa <ngompa13@gmail.com>
Date: Thu, 12 Nov 2020 13:11:51 -0500
Message-ID: <CAEg-Je_8xX=NjT97soBkg_KfezKfCrxA6V=NVj1=F7whVgFSUQ@mail.gmail.com>
Subject: Re: Should we sunset Windows 7 support?
To: noloader@gmail.com
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Nov 12, 2020 at 12:39 PM Jeffrey Walton <noloader@gmail.com> wrote:
>
> On Tue, Nov 10, 2020 at 7:29 AM Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
> >
> > Windows 7 has been EOL'd by Microsoft since January of this year. It
> > is no longer receiving security updates or fixes. This email is to get
> > the conversation started about doing the same with WireGuard for
> > Windows.
>
> Microsoft does not determine when an operating system is obsolete. The
> market does.
>
> Windows 7 still has a 24.79% market share.
> https://www.netmarketshare.com/operating-system-market-share.aspx.

Microsoft is absolutely the one determining obsolescence for
*Microsoft Windows*. They are the sole proprietor of the operating
system. If you want it to be different, don't use Windows.




--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
