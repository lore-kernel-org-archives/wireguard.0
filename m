Return-Path: <SRS0=972F=RL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE407C4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:26:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F6D20868
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:26:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="boPj7zu1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F6D20868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id feac6b80;
	Fri, 8 Mar 2019 15:15:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c3623a4
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 04:14:35 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 913cb3fa
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 04:14:35 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id bj4so12427175plb.7
 for <wireguard@lists.zx2c4.com>; Fri, 01 Mar 2019 20:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0arviE4tyOOY8snJ3N4Jj5f/RuC4prYKrzpOQ6dhxxg=;
 b=boPj7zu1sIvs2MS/4vgqBT45W7KrM3b8tUNtxka9+BoWUP+MyV0cnGn91uVar1vO/c
 fReaewW/540iKkovO5uDMQpWqtqcG1RgEm1xR0G+MwOHXrg3BBx2rnN0S518CwTN6clH
 LoOdURRyKXg8uK7q5BUZ/5vfuupxMSGckDCUyNYC9zCDnWQVwMskCntvBEO9HrRbrCTY
 nwqaxxrfhHB1veRg59LFiNQic/mIE0++8lfnP+1qQ5pV2IK9A7wT0OggrlK/j2ASA5zJ
 oMjmWVbZOvoNeTpLInQPCoy/yhz8oFuXyTU6nnwPQPyq0EUn1koSDWDxDzPopJ/3iPQP
 7M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0arviE4tyOOY8snJ3N4Jj5f/RuC4prYKrzpOQ6dhxxg=;
 b=PEYwWtQVHkeiN9D4XmSfvFk1EY0gykKj+1HJyo0+DIl9YsWwSVbwECvuUalsEmPKOT
 +8bIQAyFd6rwaUhwWQUVqLm3lBbguIcYet22a178rTcXwi4gRSHx7VZvkxrX5mkJsJDS
 JhO4NdYnMH73jRD4BbN+9MwozUq1diCSUydUMOhAsp72nNs17fG/2z2PjO7ny65jHLlE
 hhyOf+b35gbZgtKVByaj5tkAXJhvfHySoCTMSlC3iahtWk1PFlIrVNDUn375M9zxcQSa
 N8CvMJGOWtBaOLZEGi4nJTd2rD03d+j7pbT3mNpK1/U8554Tqsy3+mOLAcBaPw+Zudn5
 tVSw==
X-Gm-Message-State: APjAAAXxT6udvZY2IitvaTPQA7tJPJRyf1MBY87YDzvwIjPHul9ToWJ9
 0iPoyuLo0CNkj64oG1VkjXRvQA==
X-Google-Smtp-Source: APXvYqxN+ZkbvTqtER10DarDpnYPXcEGYYWYVTa4LXAm/qorIxWcSTiMTLDT+ylIad+Cx7Fu4sMF+w==
X-Received: by 2002:a17:902:10e:: with SMTP id 14mr8912122plb.14.1551500668537; 
 Fri, 01 Mar 2019 20:24:28 -0800 (PST)
Received: from bytedancedeMacBook-Air.local ([47.74.135.127])
 by smtp.gmail.com with ESMTPSA id l5sm31105272pfi.97.2019.03.01.20.24.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Mar 2019 20:24:27 -0800 (PST)
Date: Sat, 2 Mar 2019 12:24:21 +0800
From: Xiaozhou Liu <liuxiaozhou@bytedance.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Single CPU core bottleneck caused by high site-to-site traffic
Message-ID: <20190302042419.gv3ldcooxzbf4veq@bytedancedeMacBook-Air.local>
References: <20190228190512.6209-1-kallisti5@unixzen.com>
 <CAHmME9rQ-cKSV8o-sg3fJU4Uu6r5daC=Hx4mC-4OKGA8Z8hg7w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9rQ-cKSV8o-sg3fJU4Uu6r5daC=Hx4mC-4OKGA8Z8hg7w@mail.gmail.com>
User-Agent: NeoMutt/20180323
X-Mailman-Approved-At: Fri, 08 Mar 2019 16:15:49 +0100
Cc: duanxiongchun@bytedance.com, wangdongdong.6@bytedance.com,
 zhangyongsu@bytedance.com, wireguard@lists.zx2c4.com, wangjian@bytedance.com
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

Hi Jason and the list,

Here at our corporate network we run some inner site-to-site VPNs using
WireGuard. Thanks for giving out such a beautiful software to the world.

Recently we encountered some noticeable network latency during peak traffic
time. Although the traffic is pretty huge, the WireGuard box is far from
running out of any of its resources: CPU, memory, network bandwidth, etc.

It turns out that the bottleneck is caused by the single UDP connection
between the sites, which cannot be routed to different CPU cores by RSS
on receiving. The total CPU usage is not high, but one of the cores can
reach 100%.

Maybe we can improve this by:

  embedding more endpoints in one peer so that the VPN tunnel can run
  multiple UDP flows instead of one. Hence, the single huge UDP flow is
  effectively broken down to some smaller ones which can be received by
  multiple queues of the NIC and then later processed by more CPU cores.
  It will not break current users because the single UDP connection is
  still provided as the default configuration.

It is also possible to set up multiple wg interfaces and more connections
explicitly. But it would make the network administration much more complex.

We are planning to make a working demo of this idea but we would like to
hear from you first.

Any idea or comment is appreciated.


Thanks,
Xiaozhou
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
