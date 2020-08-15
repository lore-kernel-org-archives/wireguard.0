Return-Path: <SRS0=gWl9=B5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1416CC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Aug 2020 16:20:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79AF92078D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Aug 2020 16:20:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=bluematt.me header.i=@bluematt.me header.b="PyrRI+mE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79AF92078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bluematt.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9f9688f;
	Wed, 19 Aug 2020 15:53:49 +0000 (UTC)
Received: from mail.as397444.net (mail.as397444.net
 [2620:6e:a000:dead:beef:15:bad:f00d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eead2937
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Aug 2020 19:34:22 +0000 (UTC)
Received: by mail.as397444.net (Postfix) with ESMTPSA id 7F19F2E0DBB
 for <wireguard@lists.zx2c4.com>; Sat, 15 Aug 2020 20:00:10 +0000 (UTC)
X-DKIM-Note: Keys used to sign are likely public at https://as397444.net/dkim/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bluematt.me;
 s=1597520462; t=1597521610;
 bh=u8Z7dgR81ygHDwbEgfVMfMaaOox9VlsWHy/u77+LA74=;
 h=From:Subject:To:References:Date:In-Reply-To:From;
 b=PyrRI+mEyDZGtM80xnNybRSb5G2wTTJrIVXzIwfiuKFj83DcBpvqR/VW8NZReXpGH
 E4IrEupi1CHt96KJ7osj87oRY2y9SdPxD5u9YGUyLLZkaN95YcgFY9abw1/BoN0Xxn
 zVZGL1Qr8hkobi6CfNujKtoOQMYdeW2Bc2MvTPVd+TQz2X+wD6NSQoUAUM1mDuZkuc
 gmApftCih9S5zwHfbgkfooOIY88AYgO4UPo4avP7kXDIfiY7u/oJKnNcwiDTJPqfaI
 JqX+jbHlF7Sxl3tlA1RoNbsmjit2d6tflFgjGRHRjEjjs0Pmp0eRwXnOetTyvXE4RQ
 I0Ib2+fJeu1XQ==
From: Matt Corallo <wg-lists@bluematt.me>
Subject: Re: Incorrect Source Addr Selection On Initiate and Asymmetric Routing
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <6fc9765d-f4ef-84d2-c65a-97bab58e3e4b@bluematt.me>
Message-ID: <f979b2ac-9946-1520-978a-da6b82d8ca8c@bluematt.me>
Date: Sat, 15 Aug 2020 16:00:09 -0400
MIME-Version: 1.0
In-Reply-To: <6fc9765d-f4ef-84d2-c65a-97bab58e3e4b@bluematt.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 19 Aug 2020 17:53:47 +0200
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

Oops, should have mentioned, this may have always been the case, with only recent addition of asymmetric routing leading
me to identify it, but its at least been the case on 5.6.X and currently is the case on 5.7.6.

Matt

On 6/28/20 3:03 PM, Matt Corallo wrote:
> I run wireguard on some endpoints with anycast IP addresses (which mostly workes seamlessly, which is awesome!), however
> of late it seems the source address selection in Wireguard incorrectly selects the default source address when it most
> recently received packet(s) to a different address.
> 
> Most of the routes on such boxes have an explicit default source that is different from the anycast addresses, as
> otherwise regular connections from such boxes would fail, eg:
> 1.0.0.0/24 via XXX dev XXX src (non-anycast-address) metric 32
> 
> Ive observed wireguard selecting the default source in two cases:
> 
> a) when the server is the one sending the handshake initiation due to the handshake timer, it appears the server selects
> a new source address based on the default. I haen't had practical issues with this, but its worth noting, and probably
> fixing.
> 
> b) when the path outbound to the client is different from the path inbound. In my case, inbound v4 traffic from my phone
> on T-Mobile US (which passes through CG-NAT) comes into my server on one interface, but the path back out to TMO is via
> a different interface. In this case, wireguard selects the default source address and sends a packet which T-Mobile's
> CG-NAT drops as there is no NAT entry for it.
> 
> Matt
> 
