Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D3CCCA47A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jun 2022 09:24:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id dd4335e0;
	Tue, 14 Jun 2022 09:23:28 +0000 (UTC)
Received: from melchior.bamsoftware.com (melchior.bamsoftware.com
 [2600:3c00:e000:128:de39:20ee:9704:752d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e82d2f73
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Jun 2022 22:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bamsoftware.com; s=mail; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zG47+pN35/Aw2NMEjNPHHn08mOAW67At707hYumYIj0=; b=sT71PFWUYw+w2/ZI5nFTC6UFh5
 TS+gLmV2TdwF64K8Zc+AxxBspMV1irBD+F/tArbxwh1ueI+D+pZVDX0veDl3jjIEdniXZLM5ErMsd
 6YCnPWP7peDOREJ2s3lz8VS5v4Pni2pw3W3SBjFpb4iwQV/FYBXmZ3VARgF9q7ZOfYMk=;
Date: Thu, 9 Jun 2022 16:05:22 -0600
From: David Fifield <david@bamsoftware.com>
To: wireguard@lists.zx2c4.com
Subject: WireGuard protocol blocking in China, swgp-go (userspace obfuscation
 proxy)
Message-ID: <20220609220522.kwqa4uvuc3sijlka@bamsoftware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Tue, 14 Jun 2022 09:23:24 +0000
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

I am forwarding some information about WireGuard blocking and
anti-blocking that was posted to a censorship circumvention forum.

swgp-go is a userspace obfuscation proxy that aims to hide WireGuard's
distinctive protocol fingerprint (message_type and reserved_zero fields,
fixed packet lengths). It super-encrypts part or all of WireGuard
packets using a preshared symmetric key, and optionally adds padding.
The security of the channel relies on the encryption and authentication
of the underlying WireGuard tunnel, which requires less overhead than a
general-purpose circumvention proxy would.

https://github.com/database64128/swgp-go
https://github.com/net4people/bbs/issues/117

There is a past discussion on this mailing list of something similar.
That one was in the kernel; this one is in userspace.
https://lists.zx2c4.com/pipermail/wireguard/2021-September/007142.html
https://github.com/net4people/bbs/issues/88

Separately, the swgp-go announcement post comments on the dynamics of
WireGuard blocking in China:

> The GFW will block the remote peer's UDP port for a few days after
> about a week's continuous usage.
> ...
> ... the GFW only started blocking WireGuard on IPv4 this February.

GFW = Great Firewall, the collective name for various censorship systems
used by the government of China. The pattern of "detect, then block for
a limited time, then unblock" is typical for the GFW, though the time
intervals are usually rather shorter. For example, when the GFW began to
block the use of the ESNI extension in TLS 1.3, it would block the
server endpoint for 120 or 180 seconds:
https://gfw.report/blog/gfw_esni_blocking/en/#residual-censorship

I have not confirmed the reported blocking behavior in China. It's worth
keeping in mind also that blocking in China can differ across networks
and geographic regions. I did find a Reddit post from 3 months ago, from
the Fuzhou region, saying that WireGuard is detected and blocked within
24 hours:
https://www.reddit.com/r/WireGuard/comments/t0bpy3/wireguard_detected_and_blocked_by_gfw/

A past message on this mailing list about temporary problems with the
WireGuard protocol in Russia last year:
https://lists.zx2c4.com/pipermail/wireguard/2021-September/007050.html
