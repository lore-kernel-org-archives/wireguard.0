Return-Path: <SRS0=8Q1O=NR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD982C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 20:06:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 033B2204FD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 20:06:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=urlichs.de header.i=@urlichs.de header.b="nui9O3yp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 033B2204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c47ae54c;
	Tue, 6 Nov 2018 20:02:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45dcdbb1
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 20:02:06 +0000 (UTC)
Received: from netz.smurf.noris.de (2001:780:107:8:83::
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bfa4ce7
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 20:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UzAo5X2OFD7p5h92uSM8NV4DoIRY8hCfPJCTK91eEDg=; b=nui9O3ypp/g5UoRzS7uIdsiAln
 ZHT5WrkxoFF0aj8x+ZLCgfzM1JSYEErxQkRXqiVNqGQgLD65VugT3MZIHhmXyaw36EbZpPQ5dJ/cY
 VskQX1if9i9CBok4/C8emMYZu2BjqRlhnxocCOtGI3anbSEJhW04vJhCd6Vh8Fw2DgYwCO2Of6kX4
 h0j2WkpE+yQvoN3dXgym42AF5qJyMd2ipIh9QcfrhyIIMYASSG0VrWq/KtroAYyoVspkWwoiWTJVx
 gEgdsqdwT/BRdKgaqi1pZBMigigEzz28uSIWQ65TtNamaN2cl58kFvPvxSLf/CxxsuzC+OY7hQW7N
 6I9PzXwIqHFEbnbW12n0/NZq+kzftmIgqplNnT4mr49n/3lW6Cw0EE7yTHlCg/XU2+OJZG+yUX98K
 xdvdeHkpG1p5cFrzuNZpdzWBeZY9rDfkkFDarHg35xvzAVvl6N30dbU/4/d9q/qw3mNehOKrHHlGE
 vhCCKyf02mMhfk25soVAzU8SK7ypE6dzaeLt+H9nH7VEjDx/ZiebmxgeUBtq9pOnCpH5W0PQIeMHV
 44ot8F3qc5cFHjlOhYfSoWqhVLdWhUWP/sAH13l5VkPqzmnIlkm5rVC/TmjercCOw6H1lYQzyV/A3
 Wo/bb7bWdaxGtqVx2sLZAh9K57KTVc+ng9ZP+x+CQ=;
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1gK7ar-000BTQ-QM
 for wireguard@lists.zx2c4.com; Tue, 06 Nov 2018 21:04:58 +0100
Subject: Re: Question about AllowedIPs and proper "mesh" setup
To: wireguard@lists.zx2c4.com
References: <CAD-Ua_hRW4RyOMrP3jX3hAAVLJCLHXYPvYY_PaK0y-=r_HhTQQ@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Openpgp: id=AFD79782F3BAEC020B28A19F72CF8E5E25B4C293
Autocrypt: addr=matthias@urlichs.de; prefer-encrypt=mutual; keydata=
 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
 uhUV4tfLAz+qvFOQqyJgpoO3VUG1QA==
Message-ID: <c645fd95-ffc6-f46c-0911-49cf021f8162@urlichs.de>
Date: Tue, 6 Nov 2018 21:04:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAD-Ua_hRW4RyOMrP3jX3hAAVLJCLHXYPvYY_PaK0y-=r_HhTQQ@mail.gmail.com>
Content-Language: de-DE
X-Smurf-Spam-Score: 0.0 (/)
X-Smurf-Whitelist: +relay_from_hosts
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

On 06.11.18 09:01, Lars Francke wrote:
> I haven't managed to set it up in a way that I can connect to any of them.

You can't, at least not out-of-the-box. How would these other hosts know
how to reach your client?

You need some sort of route propagation protocol (a couple of them
exist) and some way to monitor the wireguard interface state (no code
that I know of exists that does this) and feed that into the routing
protocol (ditto).

-- 
-- Matthias Urlichs

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
