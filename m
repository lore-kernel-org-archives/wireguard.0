Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4914FC3A5A9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 22:29:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9890D206A5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 22:29:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="A3ur87cP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9890D206A5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d7e27f7;
	Mon, 4 May 2020 22:16:22 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5ad12934
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 22:16:20 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3044c843;
 Mon, 4 May 2020 22:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=mail; bh=MkbAd/ZZKldI
 Q4HrXhDeCeGkLF8=; b=A3ur87cPJUiR9GRuxBwGyR6JGn9rNl3eo2a/CNWQumCp
 0d+mzNlVUB1Afdwvvc0tx4Y3DfoHgpOk7rd4GQqCr07m1pj8SWrCLSNraTM3F3qe
 /2VVE0p9uM3uzhW3hrymNVMMuVj7RL5YBf/fVfXSEZTVBBpoitMTaiVSPKotY9Or
 RWBkBwBe0nafguyfkkql5U0guND87cgytS97ZxETvBIwIjG7EDBPFsTSAtUGJj8m
 2TqOvpRMJMQLwYqf6G/FOyT3nLXa7WMTSKZmB0Vo2LG02FAP0uHRVfod+y7RjEMb
 egj18p2NO3jtZjU4LXL/LmH5m1IxW8Nf9uVJ+fdDVQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9cca45b2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 4 May 2020 22:16:20 +0000 (UTC)
Subject: Re: soft lockup - may be related to wireguard (backported)
To: Wang Jian <larkwang@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAF75rJBKTbaK6CEQcmto=YcgA5NGrG85jSvSrYZpQV-L1xFMww@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <a0985c12-6360-b192-1884-1d58db763a78@zx2c4.com>
Date: Mon, 4 May 2020 16:28:46 -0600
MIME-Version: 1.0
In-Reply-To: <CAF75rJBKTbaK6CEQcmto=YcgA5NGrG85jSvSrYZpQV-L1xFMww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 5/4/20 6:49 AM, Wang Jian wrote:
 > Jason A. Donenfeld <Jason@zx2c4.com> 于2020年5月4日周一 下午1:26写道：
 >>
 >> Are you routing wireguard over wireguard, or something interesting 
like that?
 >>
 >> Is ipsec being used?
 >
 > I don't think I have any fancy use cases. But wireguard over pppoe?
 >
 > Other details are
 > - nftable's iptables compatible mode is used, along with ipset
 > - pppoe link is default route, and wg-quick is configured to install
 > additional default route into new created routing table (2000)
 > - ipset matches are used to MARK traffic to specific destinations in
 > mangle table, PREROUTING & OUTPUT, for both v4 and v6
 > - ip rules are added to match the fwmark and lookup new routing table
 > (2000, so go out via wireguard interface) for forwarded traffic and
 > output traffic
Can you send full networking configuration in enough detail that I'll be 
able to reliably reproduce this problem? If I can't reproduce it, it's 
unlikely I'll be able to fix it.

Meanwhile, it really really looks from your stacktrace that you have one 
wireguard interface going over another wireguard interface:

[27929.506367]  wg_packet_send_staged_packets+0x320/0x5d0 [wireguard]
[27929.506426]  wg_xmit+0x324/0x490 [wireguard]
[27929.506469]  dev_hard_start_xmit+0x8d/0x1e0
[27929.506508]  __dev_queue_xmit+0x721/0x8e0
[27929.506549]  ip_finish_output2+0x19b/0x590
[27929.506604]  ? nf_confirm+0xcb/0xf0 [nf_conntrack]
[27929.506648]  ip_output+0x76/0xf0
[27929.506681]  ? __ip_finish_output+0x1c0/0x1c0
[27929.506720]  iptunnel_xmit+0x174/0x210
[27929.506761]  send4+0x120/0x390 [wireguard]
[27929.506806]  wg_socket_send_skb_to_peer+0x98/0xb0 [wireguard]
[27929.506860]  wg_packet_tx_worker+0xa9/0x210 [wireguard]

Here, a wireguard encrypted udp packet is being sent to an endpoint that 
then is being routed to a wireguard interface. What in your network 
config would make that possible?

Jason
