Return-Path: <SRS0=T23V=JZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F830C43460
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Apr 2021 00:43:12 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24FA761059
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Apr 2021 00:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24FA761059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dotdigital.digital
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1000f44d;
	Wed, 28 Apr 2021 00:43:10 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9220fc14
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Apr 2021 17:47:17 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id l22so61816058ljc.9
 for <wireguard@lists.zx2c4.com>; Tue, 27 Apr 2021 10:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dotdigital.digital; s=google;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=eZxiAKz1UDKmdXdrgblZBXQOyi49H4AdEaqyqJ7eym0=;
 b=f4PPAm3m8Iih0leKlVcFcWbDTxCTfywQq1xjzbXY/1LgMurdBXDgtxhZn4xnrWbGK+
 Q+ypwV9o+pY1bc74PvLa0MtoDpKvYzEu12HUNcRF2NH99mry3Hv5lULvnHlRDG2JGeJN
 IoHTLhgG+Qv3M2iXb8qwBqT3UdeI+HRH9o45CbvAfFtas/zSf0gHJJ9HVi2hqRuLle12
 +JVFUtqy2w4Pym75aHcjNMnsP4+57wRt/2vlpGL/E+fhI2aokg/Kq+i1MJt0GJs3lMr1
 qsxBrtITFXCQZeiPr67Al/sXLcucdbuLq5lSfbtFtY9xqqySsmjf25RfkbEWeje6DOsg
 Y/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=eZxiAKz1UDKmdXdrgblZBXQOyi49H4AdEaqyqJ7eym0=;
 b=Ai3q0dZRsvK0qYIdOhIgir0DV6Ujl/6Oa40cSKpFlmzoEqRYfmIDSj13AKcjRoQTYu
 ch5Oe3UPINoXcim4jfJbgWwUcY4tvAlW+ex7ckROWxOXGMFFjljgnOh4LHVDz3bsxRhT
 iBuKUey9lDD354i5RBKZPaA2Wcmd7FxO2iwlliFsiubVbMAhOGiQJhhOX9wXeUe0+yqm
 UVCvV+/p+sw/txVuxBsAZGJXNTsJgPiV/ZC5T53FM71EZEFE3cUFYmUQPki4LieOa4Ti
 jRDSKTp+jGAbPOLJeM/L+5atU7iM+g+sFdSY7324bpEoaqo1QcSdJCcGOT/cmZP/obts
 Pvkw==
X-Gm-Message-State: AOAM531V5WX+QD0xM7joO0nIXefGPnnfh0x0So9N6nWGlcERM376blrD
 RGWdhrh5ISvzrTN4q/x5eT/Y5qitxsL7lR2RfpwjAHDU1+b//t3v
X-Google-Smtp-Source: ABdhPJweBP9zitwgbyNaE05wZUrNw81cmnM/hXnAlWQByIGuWKeXnhLMs99kh8vLoBB0Stp/vQPG+WJ7pEi4lnBgSzU=
X-Received: by 2002:a2e:a54c:: with SMTP id e12mr18104366ljn.326.1619545636466; 
 Tue, 27 Apr 2021 10:47:16 -0700 (PDT)
MIME-Version: 1.0
From: John Clendenen <john@dotdigital.digital>
Date: Tue, 27 Apr 2021 13:47:05 -0400
Message-ID: <CAGPm-BR2O2x56ryW9cGx6NWaoZSnQo_OSyHXp7KmNjOgZZWRcQ@mail.gmail.com>
Subject: macOS Client DNS
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 28 Apr 2021 00:43:06 +0000
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

Looking for the proper place to get help with DNS in the macOS client.
If this is not it, please point me in the right direction.

I have macOS clients using wireguard to remote into the office. It
works great except the DNS server configured in the wg config (DNS =3D
X.X.X.X) is not always honored. The system will use the DNS server
configured on the physical interface instead.

This of course causes failure resolving records on the private lan and
DNS leaks.

Is this expected? Do I need to engineer some sort of workaround or is
this a bug?

I have run into this in previous cases with L2TP/ipsec in which case
the solution was to adjust the interface =E2=80=9Cservice order=E2=80=9D in=
 macOS, but
the wireguard interface does not appear in that list.
