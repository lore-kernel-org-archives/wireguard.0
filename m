Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBA0C2BA1B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:47:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68CD520659
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vOdhUPZU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68CD520659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a062dac;
	Sun, 5 Apr 2020 21:38:18 +0000 (UTC)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5db85170
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Mar 2020 22:57:40 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id z12so3781648qtq.5
 for <wireguard@lists.zx2c4.com>; Wed, 25 Mar 2020 16:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ftEGZ7JqAI5b8PHyD2TIuvVmkPWStQnnKCGwFv0exFw=;
 b=vOdhUPZUfqCjlPp2ZS8dq2Tnr16YVBu+mQuwuBhC+RemxS8YuP87V+awjAET5+oIra
 AxghgdQlAKB3DdgvpjVbsaJqaCxtviS83PvPpt0YveaURWtEMTqO0GyhSkQ/e/RJt8T0
 NwASsj5G3BlfcWyXCOpNE+Gf60bT9KP4u0uL6glkQhXPGy6SFLETyJKKmj9QW5uk2a0w
 m4H9RzF685ptkWHuddkDTNb0m2BQDd6TgnC0kxGlhONxcH65XDpmuDl7j3OuJhp3m7bj
 FuuzP3YvWCavJuUpxtAJa04H3UQiHxfxQxsCsJikNBERbKCKD/UvKS7b1J/H2o5g+5Pb
 JSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ftEGZ7JqAI5b8PHyD2TIuvVmkPWStQnnKCGwFv0exFw=;
 b=rttXld0MG3g5xHHCDR3Lc3XsrIpuu5VEyvohNMyFgTIRksCif1ObA5v5EygbaNgf9R
 UBFVbL+QQDyA2V4ZC1ZoO/RqWHCc3+bF/e82GyTzjmzWd3W+3QEEMoNwXoTx7VTZx5Y8
 T510G8a95QbWrwP8sGTD7mdgas6CKUwlkYUWFMuPQwTeDYgL+j2ffybdjTLm8eKdT8n/
 PyMPrReh8bIABJdcBqbSrDcfKNl2VIIvzBPVnPbRF7rPLdmScEbT+U0D9bY2jQQDr/m2
 bVStn92PqvGZhgzNNTZICpMv6e/wgDEH2zqlnF1MFzIfgA46BXyMVRZqlzC773CpGBjs
 I1AQ==
X-Gm-Message-State: ANhLgQ3FNlFH4Lh3m47rEqf6Bl6v+DkQRy99cSypuN8dbGP3GPo7gPX3
 RbAtVDb76PaCLyesy7J2dOofBXO4FXiS7DOu16irma5ax5Y=
X-Google-Smtp-Source: ADFU+vvB5J5zUhJWTkgFukgyoWnWi8jag+Gy3uDrBPSGBlj/nFs7gc0pqa5QMABE9kun7Mu+ytM6Bc/3KAOfdIoNoxc=
X-Received: by 2002:ac8:73c7:: with SMTP id v7mr5549889qtp.383.1585177498579; 
 Wed, 25 Mar 2020 16:04:58 -0700 (PDT)
MIME-Version: 1.0
From: Duncan X Simpson <virtualdxs@gmail.com>
Date: Wed, 25 Mar 2020 16:04:22 -0700
Message-ID: <CAB8Qo2SaN0rkBHKqb-PSH0Sh5WbC5jbkMA8mpdq+-L6art2s+w@mail.gmail.com>
Subject: Search Domain/DNS Suffix
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 05 Apr 2020 23:38:14 +0200
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

Hello all,

I'm trying to deploy a wireguard VPN for a small company and it's
working great, with one issue: On Windows/Mac I can't find a way to
set search domains on the connection. Windows, I can probably just set
a system-wide search domain via the registry (I plan to test that
tonight), but on Mac I can't figure out anything. Even the normal
command line method, networksetup -setsearchdomains [interface],
doesn't take effect - I can retrieve whatever I set with networksetup
-getsearchdomains [interface], but it's not used by the system.

Does anybody know a solution or workaround?

Duncan X Simpson, K7DXS
Removal of this tagline is a violation of Federal Law.
