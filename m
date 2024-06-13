Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B85C27C75
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Jun 2024 14:51:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba6e11c0;
	Thu, 13 Jun 2024 14:44:07 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com
 [212.3.242.68])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e24d6d7e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2024 14:44:04 +0000 (UTC)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
 by wilbur.contactoffice.com (Postfix) with ESMTP id 84EA23D70;
 Thu, 13 Jun 2024 16:44:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718289844; 
 s=20220809-q8oc; d=unstable.cc; i=a@unstable.cc;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=Np73TOhsUMVUxyaI7nwhgUcr+XopGsUEopZcBPRVdxs=;
 b=GOSVPcwBaP+RXLQh97/UwS5kvnLe6tFJiPmOaC1GbxcS3HzNzX5tnVsMGraC7TcB
 zCzREortdUieDgnhmCBaiPct33wWq2qcW/b2ZaRmdf0apqQ1gtVpHuWxgZK+VFjK93b
 Zfk066J8VAxiBPzeO5aX4TlwmDYw6JMu7pIKZGkHdYhNssN1+bUZd0Op7lqjUCQJRkv
 UclAghwKYyB15lIB5Y5pcF3Z31juARuNZX9k0xPDUsjUtGQGfrHzStrxn5rfVt06MY4
 IfSi/W5XgxgAprlmmr/USyn1kHVnWBHuKuJb2PuQpZ46PRj20qIv+ULyT9hwcNLh0MF
 Fll2+9zF9w==
Received: by smtp.mailfence.com with ESMTPSA ;
 Thu, 13 Jun 2024 16:44:01 +0200 (CEST)
Message-ID: <d592d6a9-8d4f-4d0e-935d-73735c37bc7d@unstable.cc>
Date: Thu, 13 Jun 2024 16:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wireguard, iPhone, and cruise ships
To: Perry The Cynic <perry@cynic.org>, wireguard@lists.zx2c4.com
References: <60B826FA-3FCA-40B5-9771-8FFEDA6278AB@cynic.org>
Content-Language: en-US
From: Antonio Quartulli <a@unstable.cc>
In-Reply-To: <60B826FA-3FCA-40B5-9771-8FFEDA6278AB@cynic.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ContactOffice-Account: com:375058688
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

On 13/06/2024 16:34, Perry The Cynic wrote:
> So what are the practically available options here? I can set up whatever is needed on the server endpoint (it’s Debian), but what can I do on my phone to make wg work through an HTTP(s)-shaped pinhole? I’d hate to have to ditch wg for some other vpn just for that rare case… but what’s the answer?

How about simply getting a small travel router that you can install 
between your devices and the uplink connection (being this wifi or 
ethernet)?

The travel router could be running OpenWRT and thus allow you to play 
any wanted trick.

Cheers,

-- 
Antonio Quartulli
