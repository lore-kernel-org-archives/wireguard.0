Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D801C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 17:31:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA2A82077B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 17:31:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qU+kSDBF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA2A82077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8c4032c;
	Tue, 10 Dec 2019 17:30:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5befbab9
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 17:30:47 +0000 (UTC)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32362bf2
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 17:30:47 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p9so4190662wmg.0
 for <wireguard@lists.zx2c4.com>; Tue, 10 Dec 2019 09:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=ZOJXdf/Q8nWMfVC+zQGJt4CN+U93maYvZlTU1TVEiNg=;
 b=qU+kSDBFPB59tsdVV838SVs18UuEj403J185xlMSKcVPhN4sPBWTlrL5CRo+KMHB1K
 5UbZNR4BG/MXGq7OKfYXldsYz4meUpaZlkl8afsUZ+Mv43Qg76V4HXSsH1arZNcMjtl+
 wG1I+VkmJOPVf9i2vpFnl89RlU1UcoZdkA2ub5/ZnPyciwSvuMrXKf59GnOMKpifthoP
 A7rmh+oXJggCuqsveWSfvytuoI2lg7MldeJtlkSHURJwwrBswso7IAFuTlboE3AKCrNz
 bW677NqCgo2laBZxhdJQTrAcl9fpX9gBQYAxNrdAWtH+BNhsbFMN3Kax8V32EYl8olfs
 o5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZOJXdf/Q8nWMfVC+zQGJt4CN+U93maYvZlTU1TVEiNg=;
 b=VIk7rFpYsILZk57+Ez8tHweOf4ySVbSe9NTfpaXwGg0MeLQS22MbrGYuJtCtzdibnN
 oRo5NNhzfYn8Vk5hZTwBZOE+FXtK5BmH9u392Ba6OMx7StNIglTsoE84qBiF4arMDK1M
 TY44lqbpNOeAuEKGs/BFq6htPMlSPmrR2O6DICeTVHjrlj42OmsclD3JS0Llh+qt9x2T
 al/8xNT0avNs/l4vrDS8BEARUstvpTtKnIJnFPTzFfszELeOqtHqV1eV3YOzsh5zSmEY
 nPlMMDL0KFoH7RnT5kSsQP5ooZBeMHKDU6zuz06go7IoK1WAiG0xqOpBj1O5lEW9PEYc
 ftSA==
X-Gm-Message-State: APjAAAXNR4SqFFAkfLONw0oZsZtZBdc/9OyNr0Ik8Wl5IYP6+waKdPmH
 W8GdI4u7FFKIPuSOD8NtGyI=
X-Google-Smtp-Source: APXvYqwQM4u5OV2wBh60Y7ZaU+Beg8GgQjkfE5efDUdlFIOGTS59LWA2GYC5ygIpbtiyQChsfLogxw==
X-Received: by 2002:a1c:40c1:: with SMTP id n184mr6794564wma.116.1575999046690; 
 Tue, 10 Dec 2019 09:30:46 -0800 (PST)
Received: from [0.0.0.0] ([185.220.101.69])
 by smtp.gmail.com with ESMTPSA id 16sm3873536wmi.0.2019.12.10.09.30.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Dec 2019 09:30:46 -0800 (PST)
Subject: Re: [PATCH] wg-quick: linux: add support for nft and prefer it
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 jwollrath@web.de, dkg@fifthhorseman.net
References: <20191210154850.577745-1-Jason@zx2c4.com>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <c51624f6-b243-07dc-9edc-0cc7bf9a75ab@gmail.com>
Date: Tue, 10 Dec 2019 20:31:07 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191210154850.577745-1-Jason@zx2c4.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 10.12.2019 18:48, Jason A. Donenfeld wrote:

> restore '%s-I PREROUTING ! -i %s -d %s -m addrtype ! --src-type LOCAL -j DROP
> nftcmd '%sadd rule %s %s preraw iifname != %s %s daddr %s fib saddr type != local drop


I am trying to understand the rulesets. When you check the type of the 
source address of the incoming packet its type just can't be local to 
our machine, it is the address of the sender. The source address of the 
packet can only be local if the packet was sent from the same machine. 
Isn't this part of the rule redundant?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
