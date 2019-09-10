Return-Path: <SRS0=/FJx=XG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4299AC49ED6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:41:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA520206CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:41:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDI461bw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA520206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3bedea4;
	Wed, 11 Sep 2019 16:40:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c981951
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 21:18:41 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1ab4bc9
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 21:18:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y19so22155901wrd.3
 for <wireguard@lists.zx2c4.com>; Tue, 10 Sep 2019 14:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8oulXORfm6UK20DVuc9sBl56aOkpyM2/UFP7VNA3vFs=;
 b=TDI461bwaRQ9q5s0aRWbRvNkS9FQj3gPAg1tCvX4h22XDFCBHY65+u4I1sGXEV3ls2
 CYBkEXcAOj/bu6yP7KNh7ffepFGSytCsBfmkZDsc6bYe5EzxozwN3bzSImeJFpXWhKP4
 1IfHyHAF/45FiPd59cxYFycI+WiMy65bJHbkSKilizTe5MYq3sLwGzHYPx+kxCFAqPBE
 1LHLb7FXPZyXu1x2ECgREji//I22d1dO9iYGrVwQzI19wxL77h/i6g9dwAX9lpdcl3RR
 7b2FUp7I7ah8zBCYV6dOi+zVn+vZejhjQ9RhecDFr5Feuf2kVyHiljHitr4BX3u+LGhs
 1EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8oulXORfm6UK20DVuc9sBl56aOkpyM2/UFP7VNA3vFs=;
 b=CmzcHjD5xENkgm1ogKwuqtnJiv2yryEE06l59K/8Hj0NGQOPDfjC+PKipGLI3UisqX
 kzk50vqoU3uz6Ye68ZEN1fwkclOTIvSR9I/bWSy6jsReNv/q/91EotDuIIEoB8ExMohk
 dfy2+JQX104Wzs35r+JoDXAz2fv+5COVaVMQ/kli8fMB6LWcfWpOVrrUEMEPgsj4n8of
 JvTQltMG2DlTDbHfGnzHacag89/8guScKNdt1w6kCnXwLoNvHLfQGPSg9hRiAVigx/9F
 qM1lbDTm6hzahrePs5IEEo9P50wfwyC5ShGrQVMhyW3Nr96FRR7UMvxfqM01jOrcMS8F
 /krg==
X-Gm-Message-State: APjAAAVkiQqzCO8+AuLMH/1H1wV0VCWKs4ddhz677/FsufOFRpYRNLYJ
 tM2+cLXJe0m6no6G2hIE1h6j+Hhn
X-Google-Smtp-Source: APXvYqxcJnK25bi0yXnD82IW5AzKhQTv0gKzTZbf70ziBJgFz23UHkzs7Ao1ikCyW0ZDtQ9UdjcbdQ==
X-Received: by 2002:adf:f801:: with SMTP id s1mr28994110wrp.320.1568150319701; 
 Tue, 10 Sep 2019 14:18:39 -0700 (PDT)
Received: from themisto.localnet (89.74.204.77.rev.sfr.net. [77.204.74.89])
 by smtp.gmail.com with ESMTPSA id s1sm27968791wrg.80.2019.09.10.14.18.38
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 14:18:39 -0700 (PDT)
From: =?ISO-8859-1?Q?Robert=2DAndr=E9?= Mauchin <zebob.m@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: RHEL8 compatibility
Date: Tue, 10 Sep 2019 23:18:37 +0200
Message-ID: <2063759.iXnbFVBoeU@themisto>
In-Reply-To: <3256534.Vi1k177MCT@themisto>
References: <3256534.Vi1k177MCT@themisto>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Sep 2019 18:40:39 +0200
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

On Tuesday, 10 September 2019 22:42:40 CEST you wrote:
> Hello,
> 
> The RHEL8 kernel (4.18) contains backported changes that make it act more
> like a > 4.7 kernel. As such src/compat/compat.h need to be patched to
> handle RHEL8 special case.
> 
> We are currently using this patch in RPMFusion EPEL8 branch:
> 
> --- a/WireGuard-0.0.20190702/src/compat/compat.h
> +++ b/WireGuard-0.0.20190702/src/compat/compat.h
> @@ -79,18 +79,6 @@
> 
>  #if LINUX_VERSION_CODE < KERNEL_VERSION(4, 3, 0) && !defined(ISRHEL7)
>  #define ipv6_dst_lookup(a, b, c, d) ipv6_dst_lookup(b, c, d)
> -#endif
> -
> -#if (LINUX_VERSION_CODE == KERNEL_VERSION(4, 4, 0) || \
> -    (LINUX_VERSION_CODE < KERNEL_VERSION(4, 3, 5) && LINUX_VERSION_CODE >=
> KERNEL_VERSION(4, 2, 0)) || \ -    (LINUX_VERSION_CODE < KERNEL_VERSION(4,
> 1, 17) && LINUX_VERSION_CODE > KERNEL_VERSION(3, 19, 0)) || \ -   
> (LINUX_VERSION_CODE < KERNEL_VERSION(3, 18, 27) && LINUX_VERSION_CODE >=
> KERNEL_VERSION(3, 17, 0)) || \ -    (LINUX_VERSION_CODE < KERNEL_VERSION(3,
> 16, 8) && LINUX_VERSION_CODE >= KERNEL_VERSION(3, 15, 0)) || \ -   
> (LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 40) && LINUX_VERSION_CODE >=
> KERNEL_VERSION(3, 13, 0)) || \ -    (LINUX_VERSION_CODE < KERNEL_VERSION(3,
> 12, 54))) && !defined(ISUBUNTU1404) -#include <linux/if.h>
> -#include <net/ip_tunnels.h>
> -#define IP6_ECN_set_ce(a, b) IP6_ECN_set_ce(b)
>  #endif
> 
>  #if LINUX_VERSION_CODE < KERNEL_VERSION(3, 12, 0) &&
> IS_ENABLED(CONFIG_IPV6) && !defined(ISRHEL7)
> 
> 
> Could you please define a ISRHEL8 to handle this?

Sorry this apply to RHEL 7 not 8.


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
