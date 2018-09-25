Return-Path: <SRS0=0td0=MH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIM_INVALID,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6D1C43382
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Sep 2018 03:20:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2852145D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Sep 2018 03:20:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VLxntztG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C2852145D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efe6c207;
	Tue, 25 Sep 2018 03:18:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e4f88f3
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Sep 2018 03:18:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58817a53
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Sep 2018 03:18:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7888d71;
 Tue, 25 Sep 2018 03:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=mail; bh=EKDBxj4cnrsD
 eFlZ4h6urcv6OMM=; b=VLxntztGX5DdXMbn42Hl442N/fqZV3Hxqe0OZ05KGvvY
 htv3SdxxY9OxLZvYodtzU/Sx7iJc3gOphuIvPZGdg/jB2H3JcT2JYanwuKBpN8qS
 U5LnVrpajFAN2wB6f7IH9oiZk+sSxMuzB4MiGdC0yuVxejVByaL86We/rDdwNkAL
 MVVbMz8aO2/Dx9XAqkf9Jt4eKPSR0Zo6fRgn4qQrnzrVhfHtHodhOQz1NjTnpdbL
 WvOsSe807IVQZ8SSxlk3Nwx2CIesLD2ZM/Ao3A24O2GctBB85ywRAvlDWGl5ooJP
 cFGwHZmVJExJ5Y1XZ3ppmoutIV0Xpf3HaHptv3NAZw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1de5d4f4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
 Tue, 25 Sep 2018 03:02:23 +0000 (UTC)
Subject: Re: [PATCH] Fix transport message length check
To: Chris Branch <cbranch@cloudflare.com>, wireguard@lists.zx2c4.com
References: <20180920122853.33762-1-cbranch@cloudflare.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <af2e1b70-1fd9-01c5-67f0-f039549e6476@zx2c4.com>
Date: Tue, 25 Sep 2018 05:20:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180920122853.33762-1-cbranch@cloudflare.com>
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

Hey Chris,

On 9/20/18 2:28 PM, Chris Branch wrote:
> wireguard-go has a bad length check in its transport message handling.
> Although it cannot be exploited because of another length check earlier in the
> function, this should be fixed regardless.
> 
> ---
>   receive.go | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/receive.go b/receive.go
> index 6b6543c..cbc3fd1 100644
> --- a/receive.go
> +++ b/receive.go
> @@ -146,7 +146,7 @@ func (device *Device) RoutineReceiveIncoming(IP int, bind Bind) {
>   
>   			// check size
>   
> -			if len(packet) < MessageTransportType {
> +			if len(packet) < MessageTransportSize {
>   				continue
>   			}
>   
> 


Nice catch! Fixed in master. I'll probably have a new snapshot out not 
before too long.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
