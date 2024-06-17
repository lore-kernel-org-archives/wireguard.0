Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B0CC27C79
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jun 2024 12:43:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33d92096;
	Mon, 17 Jun 2024 12:42:14 +0000 (UTC)
Received: from shin.romanrm.net (shin.romanrm.net [146.185.199.61])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 926e6c8c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jun 2024 12:42:06 +0000 (UTC)
Received: from nvm (nvm.home.romanrm.net [IPv6:fd39::101])
 by shin.romanrm.net (Postfix) with SMTP id 009E23F7EB;
 Mon, 17 Jun 2024 12:41:59 +0000 (UTC)
Date: Mon, 17 Jun 2024 17:41:59 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Germano Massullo <germano.massullo@gmail.com>
Cc: Antonio Quartulli <a@unstable.cc>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: Mini PCIE HW accelerator for ChaCha20
Message-ID: <20240617174159.46b69d3b@nvm>
In-Reply-To: <4940a8fd-6e87-49a4-83e0-8daa69e7a68f@gmail.com>
References: <CAGa=++TLvS2y=-D8mk0zx_J7CvYWYQqKBWDv_3+qaQ2NSdiJ1w@mail.gmail.com>
 <78a56a8e-59d2-4948-a761-f1f1b3a6b26a@online.de>
 <93a15ab0-1cfc-4b39-97fe-64712eafb278@gmail.com>
 <f0279e84-9425-4bfe-be3c-009217bf24f8@online.de>
 <cd332c8e-96c7-49e7-9632-066327a009af@gmail.com>
 <ce8cd757-3df9-4a71-818e-ae2eda6c9690@unstable.cc>
 <ef44089b-1060-458f-906b-45fe682c6a10@gmail.com>
 <8f366adc-89a5-4b81-9a4f-8bcb1d08aad3@unstable.cc>
 <4940a8fd-6e87-49a4-83e0-8daa69e7a68f@gmail.com>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
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

On Mon, 17 Jun 2024 14:32:19 +0200
Germano Massullo <germano.massullo@gmail.com> wrote:

> Got it. That configuration will not improve the throughput cause the 
> reason why I started this benchmark is finding out the bottleneck in my 
> configuration, which is very similar to the one you described

Point is that iperf itself is using a huge amount of CPU. You can run your
test and launch "top" in another SSH window. In my experience for slow CPUs
during such tests the CPU use may be like 60% iperf.

If your typical scenario is router just forwarding packets between networks
and into WG tunnel, and not providing any network services itself (such as
Samba), testing with iperf launched on the router will not be representative
of real-world usage bottleneck or lack thereof.

-- 
With respect,
Roman
