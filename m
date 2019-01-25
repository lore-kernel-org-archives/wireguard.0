Return-Path: <SRS0=HYXs=QB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58D2C282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Jan 2019 01:56:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8212A218D2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Jan 2019 01:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8212A218D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0188c111;
	Fri, 25 Jan 2019 01:51:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63cc7e91
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jan 2019 01:51:03 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20bd7cb6
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jan 2019 01:51:03 +0000 (UTC)
Received: from [192.168.127.6] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77])
 (AUTH: LOGIN pallas, SSL: TLS1.2,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
 by telperion.info with ESMTPSA; Thu, 24 Jan 2019 17:57:49 -0800
 id 0000000000049044.000000005C4A6D1D.00006E27
Subject: Re: Long outage when changing private key
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <8ae75832-91dd-428e-9b04-a48cec019bf6@pallas.us>
 <ca5e0871-c55a-c8cd-eac1-4cf4603f7c48@pallas.us>
 <20190124235913.GA21643@zx2c4.com>
 <CAHmME9oSPTCvsnEy9nMfMtzWGVC9wWKwgpQbUCxKjA_2AvdtfQ@mail.gmail.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <85e1199d-e81f-a2ad-d571-38b765f9c973@pallas.us>
Date: Thu, 24 Jan 2019 17:55:49 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9oSPTCvsnEy9nMfMtzWGVC9wWKwgpQbUCxKjA_2AvdtfQ@mail.gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thanks for taking a look, I should have spent 30 more minutes 
investigating myself. Please see the patch set I just submitted. 
Resetting the handshake timer is also necessary or else it takes until 
the expiration of that timer to actually happen in my setup. It seemed 
worth putting into a utility function in peers.c, rather than all in 
netdev.c, so I did that. I checked the preshared key case and that seems 
to work fine still. ~Derrick

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
