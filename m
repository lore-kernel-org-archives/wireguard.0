Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B98C10F06
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:55:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0422C2173C
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=varunpriolkar-com.20150623.gappssmtp.com header.i=@varunpriolkar-com.20150623.gappssmtp.com header.b="AnkXRLJN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0422C2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=varunpriolkar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4df64304;
	Sat, 6 Apr 2019 11:52:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ee53f56
 for <wireguard@lists.zx2c4.com>; Thu, 4 Apr 2019 05:39:31 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 150c5beb
 for <wireguard@lists.zx2c4.com>; Thu, 4 Apr 2019 05:39:31 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id a28so807997lfo.7
 for <wireguard@lists.zx2c4.com>; Wed, 03 Apr 2019 22:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=varunpriolkar-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=xN7u+uDM5g2dRy/g6VeudSE6ZrVziz8tjXSfyc6Fzv0=;
 b=AnkXRLJN36+Zpcfz0uXfYeXxDgDs2mTYiHwKci0mCwdD4j/SSul3qzj7s8pZe6BEU1
 Uw5gfSEa+f2lgN+NeQ3w37qc+vASVTHChzQBNXMzqTO6XS/bP4RqIpUlM2faw6tpUNcj
 0Jg5ujF4/OKrxWmI49FZf9eVCsRQywhs/28aq8MeK1LziI5hLOtZ44xlEnZW4vCefCPg
 wKMdbgjoEyTrlvBEz1nsEPDRFeLBi7UY1V0YnBP62QEYtfF7XhVjZVSTFqzeQdHA3txA
 U3km71cMlczoQ93wWrgNMhltahnQZM1QvQcDtcb1PXXZxHI88feFZIBwbB3O14dYpbkr
 I3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xN7u+uDM5g2dRy/g6VeudSE6ZrVziz8tjXSfyc6Fzv0=;
 b=nGamBhgO+ieYP4biHjvL+DMjnCEaPQU+cpZO3iG378cePEcUXrqWYBLyyzLDLBss7n
 KvF1fF11NjwMJUiSUD27e7YiI1UyDpMCXE7Yc6UwPpnwNj8l3nG7PsxMskb1Y7zXw/n1
 M1A1X0+gAnpva5chDCy0eA6tFwUubjq0KnYK5tTShpEwIgBxt0gxP1z0IeCsV8LfbExD
 vzkYfvX5SDJkX8ANLtWo++tlGeZ3Dv6kApAxZ4ffAjULOAWA8Zg7VbQz30dR8LIH1KZt
 3sm5AqEe1YSKibmA8DSfyogM371eDw2sBFbzuUSDFpT0QOdNB+PvHcaAoaiOT9hj97GN
 +GvA==
X-Gm-Message-State: APjAAAVUVAKznD3y5khtESgNtz+YPmcSXgIy8c5/iSiKsX2e4AG2e09x
 8CiRdGrHdpd1dOqzPOSN44d8VydGKvHtdQvA//FnIH47/7Q=
X-Google-Smtp-Source: APXvYqxe+2mhZlsqech+FrVwqS9RVnT8De6IDSEUyF0efjA60Tk2dXjN+24xYXpgSgLg/FYSefNtASIYFwnweqpjf3o=
X-Received: by 2002:ac2:5205:: with SMTP id a5mr1991951lfl.102.1554356499527; 
 Wed, 03 Apr 2019 22:41:39 -0700 (PDT)
MIME-Version: 1.0
From: Varun Priolkar <me@varunpriolkar.com>
Date: Thu, 4 Apr 2019 11:11:28 +0530
Message-ID: <CALwBDFuMTbXCEXW3Qbpbuk6LL1pj+bCedZ9p6P6R6tJV0zBqTQ@mail.gmail.com>
Subject: Multiple connection support for GUI clients
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 06 Apr 2019 13:52:49 +0200
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

Hi,

I tried out the preview Mac OS, iOS and Android clients, which worked
great. However a glaring miss was the lack of support to connect to
multiple Wireguard tunnels at once, which is extremely helpful when
you are only routing specific internal subnets through them. Any plans
for including this functionality in the future? This is possible with
the CLI client.

I'm not sure if this was asked earlier. Apologies if so.

-- 
Regards,

Varun Priolkar
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
