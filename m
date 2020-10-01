Return-Path: <SRS0=Zpbp=DI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C776C47420
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 16:52:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A5A1221F0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 16:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A5A1221F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b632ba8;
	Thu, 1 Oct 2020 16:20:05 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0fdd8156
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 16:20:03 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id CE73991D;
 Thu,  1 Oct 2020 16:51:52 +0000 (UTC)
Date: Thu, 1 Oct 2020 21:51:52 +0500
From: Roman Mamedov <rm@romanrm.net>
To: PGNet Dev <pgnet.dev@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: more specific routes for IPs added to "AllowedIPs =" ?
Message-ID: <20201001215152.62d4b5c0@natsu>
In-Reply-To: <8e81c9fc-b43c-235f-5c6a-335c736d9f5e@gmail.com>
References: <8e81c9fc-b43c-235f-5c6a-335c736d9f5e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 30 Sep 2020 15:42:19 -0700
PGNet Dev <pgnet.dev@gmail.com> wrote:

> I've two linux machines connected with wg.
> 
>  Machine #1 is a remote VM, & connects to the public 'net.
> 
>  Machine #2 is local, on my LAN.
> 
> To date, they've only routed internal traffic. Nice -n- easy.
> 
> I'm adding forwarding of specific EXTERNAL traffic from the 'net, received at Machine #1, to port-specific services, on the LAN.
> 
> E.g. a 'listener' on a local lan machine, @ ip 10.0.0.1 port 11111
> 
> On the local end of the VPN, for any external IP that needs to traverse the VPN link, adding the specific IP to
> 
> 	AllowedIPs = ... X.X.X.X
> 
> works.  Traffic flows.
> 
> BUT, that adds a local route
>
> 	X.X.X.X dev wg0 scope link
> 

"That" is called wg-quick. For any sort of non-basic usage, I suggest going
with "wg" directly. "wg" does not add any routes or IPs, it only sets up the
encrypted tunnel. The rest is completely up to you. Make your own wrapper
around it, that only does exactly what you need and nothing more.


> so ALL local traffic from local lan to that IP, e.g. an ssh session, gets routed BACK via that new route over the VPN.
> 
> I'd like to limit that -- so that ONLY traffic from the 'net to that local listener on ip 10.0.0.1 port 11111 is routed back via the VPN; all _other_ traffic to the originating IP (e.g., that ssh connection), gets routed over my normal default route.
> 
> What's the cleanest way -- in wireguard config -- to
> 
> 	(a) allow any/all IPs over the VPN
> 	(b) limit the route to the specific ip target/port
> 
> So far, I seem to _need_ that originating IP in the "allowedips ="; which creates the 'overreaching' route ...
> 
> I'm guessing some judicious use of PostUp/Down routes set?
> 
> 


-- 
With respect,
Roman
