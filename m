Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3E5CA5FFF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 07:13:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 48286554;
	Mon, 5 Oct 2026 06:56:13 +0000 (UTC)
Received: from smtp-outbound2.duck.com (smtp-outbound2.duck.com [20.67.223.10])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 24d61360
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Jun 2026 18:06:03 +0000 (UTC)
References: <20260608133610.108416-1-rfrohl@suse.com>
 <aiw8L3XwjibHS2_-@zx2c4.com>
 <79C0C0A9-DE56-4165-B397-834E4C37F5A6.1@smtp-inbound1.duck.com>
Subject: Re: [PATCH] Revert "dns-hatchet: apply resolv.conf's selinux
 context to new resolv.conf"
MIME-Version: 1.0
Content-Type: text/plain;
	charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: -
X-Rspamd-Report: DMARC_POLICY_ALLOW(-0.5) R_DKIM_ALLOW(-0.2) MIME_GOOD(-0.1)
 R_SPF_ALLOW(-0.2)
X-Rspamd-Score: -1
X-Rspamd-Action: no action
To: wireguard@lists.zx2c4.com
Received: by smtp-inbound1.duck.com; Fri, 12 Jun 2026 14:06:03 -0400
Message-ID: <A2AAF85D-ADDF-43CE-90AB-13E9AFA0B9DC.1@smtp-inbound1.duck.com>
Date: Fri, 12 Jun 2026 14:06:03 -0400
From: marqueandreprisal@duck.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duck.com; h=From:
 Date: Message-ID: To: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Subject: References; q=dns/txt; s=postal-KpyQVw;
 t=1781287563; bh=aeRYK8qtHdGwTjCcPyHqa4W2VOSBHt9jDmozyaOe0/Y=;
 b=bp5pRvK25ygwpHqu1gPIn3mAxxcKP9qlT8HkXyJ08/g8cQXRbQ5bsjbDcI6QjH7XUBV1mrSYQ
 OpnnRNVvOLm9LmsYwHmnX6Jxgd3ooqswJMqt/Z5gfhhgV/Tnu7xsYbNAGhpQqXefds9R1SVSkHl
 KhbvUPrUwSOUnreTLZY5UwA=
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

In some cases you may have to rebuild the kernel. Distros may or may not 
include dns-hatchet. Tools like this are meant to be used by hand 
therefore it is quite possible the developers will exclude it from 
shipping in release.
