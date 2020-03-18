Return-Path: <SRS0=qVad=5D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0E5C4332D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Mar 2020 22:08:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1760C20752
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Mar 2020 22:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1760C20752
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc461c3a;
	Wed, 18 Mar 2020 22:02:32 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id f5201cf4
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Mar 2020 22:02:29 +0000 (UTC)
Received: (qmail 6474 invoked by uid 500); 18 Mar 2020 21:50:26 -0000
Date: Wed, 18 Mar 2020 16:50:26 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Germano Massullo <germano.massullo@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: WireGuard connecting hosts WAN->LAN
Message-ID: <20200318215026.GA5996@wolff.to>
References: <c3b5c2e5-d77b-1984-107d-6f6a56b67f84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c3b5c2e5-d77b-1984-107d-6f6a56b67f84@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

On Sat, Mar 14, 2020 at 16:33:44 +0100,
  Germano Massullo <germano.massullo@gmail.com> wrote:
>A simple question to Wireguard developers, since while asking for help
>in OpenWRT forum[1] I have been told that I am asking a thing that
>Wireguard cannot do, so I want to ask upstream if it is possible or not
>
>Scenario:
>A = internet (WAN) host (WireGuard IP 10.1.1.3)
>B = OpenWRT router (WireGuard IP 10.1.1.1)
>C = LAN host (WireGuard IP 10.1.1.2)
>
>I want to:
>1) connect A to C passing through B. I don't want to expose C to
>internet at all, (so no things like port forwarding)
>2) A must have C public key (and viceversa), so in case of B being
>compromised, the A<->C VPN will not be compromised.
>
>In a few words, I want B to just route forwards packages from A to C.

This set of requirements seems odd.
Do you not trust C to be able to properly ignore unwanted packets?

It is possible to have C ignore layer 3 traffic (DHCP traffic is special) 
that is not using the tunnel. Inbound you block all traffic not 
destined for the tunnel's port. Outbound you block all traffic not 
tagged as tunnel traffic. (Wireguard provides a way to tag tunnel traffic.) 
The default route should be through the tunnel. Tunnel traffic should be 
routed through B. The configuration gets trickier if you want to send 
traffic to A's external address as then you have a routing dependency not 
based on the destination address. You can do this by having two routing 
tables using the tag to pick which table gets used.
