Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA56ECDE44
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 18:27:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FD0C20854
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 18:27:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="FL2EuWCm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FD0C20854
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18c7c144;
	Sun, 4 Nov 2018 18:23:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d30e74f
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 18:23:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4cdfdc4
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 18:23:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 177d002d
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 18:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=+5E0+8fKXW64Fr1J7hQgwaMseEo=; b=FL2EuW
 CmU7CmLiMPcBW5Xd071xrVUQurruaQbYIi/O91dy+l64x1LLLBge1h38/zsFOWoN
 pTiL38gzF4D0/e096NOLIqp9yBKZhP6oPGwyMspy3aNAOCXtsJWCa+6r6wkcwIAM
 c6+smwZGeRf/L8MiMuzdEYtCsD2pKU943TBf5Bhb+U83VvkDW+VrQI+yk1/Vp1Wq
 HKTL8DahWAaoJjtNIUbmQnXBP8OCYkY5I8cts0u5UGSIEUMrqBa/ZTURYJERl8TB
 hm9prAY+MhUfs0DFlb4inbCoSLaqTEsHYO0PZ+8A+/On09pFuIqKar+477oHj1eE
 M+A+Udy+ZEnPyhrQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 283f9a3a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 18:23:35 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id r127-v6so5624019oie.3
 for <wireguard@lists.zx2c4.com>; Sun, 04 Nov 2018 10:27:43 -0800 (PST)
X-Gm-Message-State: AGRZ1gKoO/PEnL4hB5bjp+yXuXDqGu8455Xoxx2mk34JO1RSrLrNrVnf
 3s42sfnmhpJDVpsFaxxZWadsPhHxm80UpC/+E/Y=
X-Google-Smtp-Source: AJdET5ckuMjNI8LfVZlQETkmU6fuMPH0O/TEiTfyE2xduT2HT1FGAuZIKiaINCsRde9Y/xLjH+WCC+GUxMOLjst3e2Y=
X-Received: by 2002:aca:3582:: with SMTP id
 c124-v6mr10411463oia.119.1541356062590; 
 Sun, 04 Nov 2018 10:27:42 -0800 (PST)
MIME-Version: 1.0
References: <CAPRZce0d+mEUKy=XdDbVSsC+n5jTUGTsTXOmTYvTWXw5=Twweg@mail.gmail.com>
In-Reply-To: <CAPRZce0d+mEUKy=XdDbVSsC+n5jTUGTsTXOmTYvTWXw5=Twweg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 4 Nov 2018 19:27:30 +0100
X-Gmail-Original-Message-ID: <CAHmME9qgdK5a7pKeNhMDuy7+t7aDkFXzq0dRKTmzbDtMUCOV1Q@mail.gmail.com>
Message-ID: <CAHmME9qgdK5a7pKeNhMDuy7+t7aDkFXzq0dRKTmzbDtMUCOV1Q@mail.gmail.com>
Subject: Re: Wireguard for Android vs Google Play Store
To: edward.vielmetti@gmail.com
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

Custom kernel? Or using userspace tools?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
