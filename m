Return-Path: <SRS0=Lifx=KD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6947C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 May 2021 16:50:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABEBA61059
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 May 2021 16:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABEBA61059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c226c594;
	Sat, 8 May 2021 16:50:42 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id acc88758
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 May 2021 16:50:41 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 631DB678;
 Sat,  8 May 2021 16:50:40 +0000 (UTC)
Date: Sat, 8 May 2021 21:50:39 +0500
From: Roman Mamedov <rm@romanrm.net>
To: lejeczek <peljasz@yahoo.co.uk>
Cc: wireguard@lists.zx2c4.com
Subject: Re: secondary IP on wg0 fails
Message-ID: <20210508215039.31f32aae@natsu>
In-Reply-To: <204f6e7b-d594-c2c0-5242-1643055065c3@yahoo.co.uk>
References: <204f6e7b-d594-c2c0-5242-1643055065c3.ref@yahoo.co.uk>
 <204f6e7b-d594-c2c0-5242-1643055065c3@yahoo.co.uk>
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

On Sat, 8 May 2021 17:31:58 +0100
lejeczek <peljasz@yahoo.co.uk> wrote:

> I'm experiencing a pretty weird wireguard, or perhaps 
> kernel/OS stack bits behavior.
> 
> I have three nodes which all can ping each other on wg0's 
> IPs but when I add a secondary IP:
> 
> -> $ ip addr add 10.0.0.226/24 dev wg0
> 
> it gets weird, namely, say when that sec IP is on
> A -> B ping returns; C ping waits, no errors, no return
> B -> both C & A pings return
> C -> neither A nor B ping returns
> 
> I'm on CentOS with 4.18.0-301.1.el8.x86_64.
> All three nodes are virtually identical kvm VMs.
> 
> any suggestions as to what is not working here or how to 
> troubleshoot are vey appreciated.
> many thanks, L.

Did you add the new IP to AllowedIPs of that node on all the other nodes?

Also remember that sets of AllowedIPs should be unique within the network,
i.e. can't have the same AllowedIPs or ranges listed for multiple nodes at the
same time. Setting it to the same /24 on all nodes will not work.

If still not clear, better post your complete config (without keys).

-- 
With respect,
Roman
