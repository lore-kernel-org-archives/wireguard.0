Return-Path: <SRS0=HYXs=QB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF81C282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Jan 2019 00:00:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F2A0218A6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Jan 2019 00:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="0FLf5xTf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F2A0218A6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6269a2f;
	Thu, 24 Jan 2019 23:55:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1f8592b
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 23:55:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d089b7d1
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 23:55:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e0d70de
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 23:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=eBMF75ddgi+109sbi7fDHvn71RU=; b=0FLf5x
 Tf0wANkLT1U/Z+h22zc3hdZv7aeXimNtStcREg8qkSR2rlKxy3Hk8VRmmPG+lNCy
 pVPgZbpoSz765ZrRkiG5TlDRe+Dv2ZHSVEMIgoYhsHO2M0CElQ4VAEswIccQRR+Q
 NnLRyfecg0OzusGklHBtdYz0J0r95zWncN45sbgC9EbvhHuHP9cgRWX0TOu8PFGE
 FWLmUW8bnIu+a86JiMDK6/EOgcf0YAXvn6bGWX+pifu7Kl/0C/64e+ojWxFJH46J
 P5vevsYZKqxanOqNXReSdcwiojgcP4wLFWgFyAoLKGKvGpeNvIDhYSq0ep+DVhaC
 kbgqc5cOa+yjcpNw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bbf5c76f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 23:46:26 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id 32so6903364ota.12
 for <wireguard@lists.zx2c4.com>; Thu, 24 Jan 2019 16:00:56 -0800 (PST)
X-Gm-Message-State: AJcUukcjLkf2XyXcsH/9G9eILdzwDexoRosTlH56gf90S8gV7zcRd0jY
 1IeiabuJjadvVy9WXkFmmrz+yeYOZ1QJsfHHtac=
X-Google-Smtp-Source: ALg8bN5zSbPVJLMPExZn6ddkODy9SgvSDyRVKGOBObUCJ857vdtTJ/YnBrSMchuJOkf9vJ+W0Aj2roQyIGmr9f5Mm0w=
X-Received: by 2002:a9d:7e87:: with SMTP id m7mr6443702otp.225.1548374455629; 
 Thu, 24 Jan 2019 16:00:55 -0800 (PST)
MIME-Version: 1.0
References: <8ae75832-91dd-428e-9b04-a48cec019bf6@pallas.us>
 <ca5e0871-c55a-c8cd-eac1-4cf4603f7c48@pallas.us>
 <20190124235913.GA21643@zx2c4.com>
In-Reply-To: <20190124235913.GA21643@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 25 Jan 2019 01:00:44 +0100
X-Gmail-Original-Message-ID: <CAHmME9oSPTCvsnEy9nMfMtzWGVC9wWKwgpQbUCxKjA_2AvdtfQ@mail.gmail.com>
Message-ID: <CAHmME9oSPTCvsnEy9nMfMtzWGVC9wWKwgpQbUCxKjA_2AvdtfQ@mail.gmail.com>
Subject: Re: Long outage when changing private key
To: Derrick Lyndon Pallas <derrick@pallas.us>
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

On Fri, Jan 25, 2019 at 12:59 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> @@ -539,6 +539,7 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
>                                          peer_list) {
>                         if (!wg_noise_precompute_static_static(peer))
>                                 wg_peer_remove(peer);
else
> +                       wg_noise_keypairs_clear(&peer->keypairs);
>                 }
>                 wg_cookie_checker_precompute_device_keys(&wg->cookie_checker);
>                 up_write(&wg->static_identity.lock);
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
