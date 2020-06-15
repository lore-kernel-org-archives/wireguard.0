Return-Path: <SRS0=Z38T=74=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811D1C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Jun 2020 11:02:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB6082068E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Jun 2020 11:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB6082068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lists.m7n.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a50b686;
	Mon, 15 Jun 2020 10:44:11 +0000 (UTC)
Received: from bond.m7n.se (bond.m7n.se [2a00:1a28:1251:46:246:28:121:1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4c1e21b7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Jun 2020 10:44:10 +0000 (UTC)
Received: from [IPv6:2001:470:de6f:1310:2449:6024:90c1:5276] (unknown
 [IPv6:2001:470:de6f:1310:2449:6024:90c1:5276])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by bond.m7n.se (Postfix) with ESMTPSA id 2885E600A13C;
 Mon, 15 Jun 2020 11:01:57 +0000 (UTC)
Subject: Re: Openwrt wg0 behaves not alike that on Fedora: why?
To: Sergey Ivanov <seriv@cs.umd.edu>, wireguard@lists.zx2c4.com
References: <CAM+N7v=DWfk-b8V0C5kjrTRPv-nTb5OuuVoSYMMNNATdK6yR=g@mail.gmail.com>
From: mikma.wg@lists.m7n.se
Message-ID: <433a642e-4bde-cd7b-021c-2dd8663d3d47@lists.m7n.se>
Date: Mon, 15 Jun 2020 13:01:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAM+N7v=DWfk-b8V0C5kjrTRPv-nTb5OuuVoSYMMNNATdK6yR=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

On 2020-06-14 20:19, Sergey Ivanov wrote:
> Hi,
> I have a question about wg0 on OpenWRT not forwarding packets from one
> client to another. I have a laptop at home in my home LAN, and a
> computer at work in a very restricted LAN. They can not see one
> another. I spent a lot of time trying to get them connected by adding
> their wg0's IP addresses to the AllowedIPs on my home router running
> OpenWRT. I saw pings from each of them successfully decrypted (I've
> used ping with patterns) on the OpenWRT wg0, but they never got routed
> further.
> 
> When I decided to try to move the same AllowedIPs from OpenWRT's wg0
> to my desktop Fedora, it immediately worked. It looks like some sort
> of setting like isolation of the clients, or hairpin mode which is
> different on OpenWRT than on Fedora.
> 
> Can someone help and suggest what I should look at? I'd like to have
> it working on the router which is all time on.

You should look at the firewall in OpenWrt. It's probably dropping or 
rejecting the packets. In particular look at the forward option of the 
firewall zone assigned to wg0. From the OpenWrt Firewall - Zone Settings 
GUI:

     the forward option describes the policy for forwarded traffic 
between different networks within the zone.

Since WireGuard is a routed (and not bridged) VPN the above setting can 
also control forwarding between hosts on the same network.
