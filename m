Return-Path: <SRS0=As8F=XU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23BAC432C1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 09:26:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F3942054F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 09:26:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="EodQTS6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F3942054F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46920db0;
	Wed, 25 Sep 2019 09:25:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71929c64
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 09:25:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e544a20a
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 09:25:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1cdf960;
 Wed, 25 Sep 2019 08:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :cc:subject:message-id:references:mime-version:content-type
 :in-reply-to; s=mail; bh=VPAFMsNHRLh3+5hM/D0wvHoSK3w=; b=EodQTS6
 k6oEtTfRLTkI4eJZWCHHL1t4OEXa+FQ0xN8H7GmtNmW3biGPfwxeHYYoQwnklPJ7
 7FSvgGV7ybWayJQSdzOGySHtvOPA16wLwncktfcM6VYj9/vgfreE9LXypAAWP9xc
 krMLuoIhMzljnV8XzZU6McFHn8JLCjxjdCkZaeJv2xBgOgNpgTKwhEwxxYh4DnGI
 AO+Ma5ZIXQ1CyYGvDRC9yoBm9Xa3vdZvzjtWsdz+zbZJa9VqdBrL13J0AIWSLi1H
 3GjiVLZJ+tpZl9BWEGcQFVzesPW5IUoSfUUA6RWt9DPW7zcejf/ZQkd1x+D8imRj
 /29I0UoXlD8+CjQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6ffc8fb2
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 25 Sep 2019 08:40:00 +0000 (UTC)
Date: Wed, 25 Sep 2019 11:25:41 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Brassy Panache <brassy.panache@gmail.com>
Subject: Re: Error with wg-quick down when IPv6 not present
Message-ID: <20190925092541.GA8039@zx2c4.com>
References: <CAJLOqRznfra3wQz5Gd7-KQw98AN8CuLozC1ZSZk8mupoJ+77RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJLOqRznfra3wQz5Gd7-KQw98AN8CuLozC1ZSZk8mupoJ+77RQ@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
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

On Wed, Sep 25, 2019 at 11:06:18AM +1000, Brassy Panache wrote:
> I have a kernel without IPv6 support.  I've noticed when running:
> 
> $ wg-quick down vpn
> 
> 
> I receive the following errors:
> 
> [#] ip -4 rule delete table 51820
> [#] ip -4 rule delete table main suppress_prefixlength 0
> RTNETLINK answers: Address family not supported by protocol
> Dump terminated
> RTNETLINK answers: Address family not supported by protocol
> Dump terminated
> [#] ip link delete dev vpn
> [#] resolvconf -d vpn -f
> 
> 
> This is caused by the assumption that the command:
> 
> $ ip -6 rule show
> 
> 
> will run on the system.  I have made a change to my local wg-quick script
> which first tests if the command runs successfully before it clears the
> rules.  The same should probably also be done prior to running the IPv4
> version of the command.

Would this work?

diff --git a/src/tools/wg-quick/linux.bash b/src/tools/wg-quick/linux.bash
index e690944d..612ecd77 100755
--- a/src/tools/wg-quick/linux.bash
+++ b/src/tools/wg-quick/linux.bash
@@ -102,10 +102,10 @@ del_if() {
 		while [[ $(ip -4 rule show) == *"from all lookup main suppress_prefixlength 0"* ]]; do
 			cmd ip -4 rule delete table main suppress_prefixlength 0
 		done
-		while [[ $(ip -6 rule show) == *"lookup $table"* ]]; do
+		while [[ $(ip -6 rule show 2>/dev/null) == *"lookup $table"* ]]; do
 			cmd ip -6 rule delete table $table
 		done
-		while [[ $(ip -6 rule show) == *"from all lookup main suppress_prefixlength 0"* ]]; do
+		while [[ $(ip -6 rule show 2>/dev/null) == *"from all lookup main suppress_prefixlength 0"* ]]; do
 			cmd ip -6 rule delete table main suppress_prefixlength 0
 		done
 	fi

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
