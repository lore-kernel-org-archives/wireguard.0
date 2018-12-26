Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FB0C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:21:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAD832089F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:21:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lesaker-org.20150623.gappssmtp.com header.i=@lesaker-org.20150623.gappssmtp.com header.b="ZOkNK0Zt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAD832089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lesaker.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3fa06197;
	Tue, 8 Jan 2019 02:18:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 709acbda
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Dec 2018 20:06:02 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a83fc60
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Dec 2018 20:06:02 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id y126so8210909pfb.4
 for <wireguard@lists.zx2c4.com>; Wed, 26 Dec 2018 12:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lesaker-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=/PbnZq+PWHAW3rmJfudmwsk5XV2K7YHgR22qxCUCfEg=;
 b=ZOkNK0Zt1LVNBojmqIitJ+/dRPgMBbmKSghfrDCkA1YSnYIzbcpPPSElis0tYFoU4f
 IDngv2LQ03dNAd/MudtxMtkaCZ6gUy9hm2pLiZzxCpfYJorHNZC7MbZSM7HLraddyx1M
 3jeyCA9Od2DXo7RWwxFTIEn0+yWKipeOxPMODz+WCVj+uAO6bTH5PmCvAEjDCoQiMhE1
 2H7l8FEpgLsNBAWEHbfl/pMHrRAxQfMQkEyDhat1PzNtpRlaosLMoJPuTLKiT35Vn+B6
 wmmBZ9eJ8o+PzZcoPR7KGalOQPTziJbnbZV/7z1Vl1v61kU8pjId/V8WQLmRj8CyLm4X
 TfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/PbnZq+PWHAW3rmJfudmwsk5XV2K7YHgR22qxCUCfEg=;
 b=OBiTf2knLEKWwZbQHoAA7aVbbQ7rXI1UC4s9xl5p9kdpSiQZ1+9vFdY9ukjUCrttn3
 digPhG2+H9Z5/y4dZ2ZD/g57lh8Wl0kzSCwMGhsInz6F5Aqj5LU4LWsmunZIqeiViiSH
 ik2m8jrmCxYJuvus7TZewKLfe1Gpj0jlPprtZA2PoKDLcti370OeqBUfORD/rGzT7lJD
 1osvP6VlSUr22GbUFen07m2DiATSrWI93FmR/wZqkukYAnQfJiiuucEqjCvvqikUOtb+
 XRljWF9f+3At1cC/vNHJ6uhTmgSjQF1FFepWyjVeGu4Kq29AIeDRCXUGuqKQuSkZGquw
 tEDg==
X-Gm-Message-State: AJcUukfIwHfNy5LH3tR41YzRt5bdr4Wrk8OWxVSFsRUVusjYyBfelBc+
 S19eL4SVSgLEXlGmMR/q0xokU88c5SP0yNN7pDREOLWRHVc=
X-Google-Smtp-Source: ALg8bN5PU4XW8JOnbZUMDgHQjpIP4hapH2AfAvO2q2b5leqBRdEGGhO4/q0ZOOVt4BAeataOsInwCf53OpGfdHOUcjk=
X-Received: by 2002:a63:5b48:: with SMTP id l8mr20322795pgm.80.1545854851450; 
 Wed, 26 Dec 2018 12:07:31 -0800 (PST)
MIME-Version: 1.0
From: Les Aker <me@lesaker.org>
Date: Wed, 26 Dec 2018 15:07:19 -0500
Message-ID: <CAGK8k+aFW=HPiY8FZpWFH_CbkX1D1ph7M8_QcAViL91JUow-sg@mail.gmail.com>
Subject: Setting OnDemand for iOS via config import.
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 08 Jan 2019 03:18:08 +0100
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

Is it possible to set the OnDemand VPN mode for the iOS app when
importing a tunnel via QR code / config file.

It doesn't seem like that's possible given the available config
syntax, but I'm not sure if I'm missing something.

- Les Aker
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
