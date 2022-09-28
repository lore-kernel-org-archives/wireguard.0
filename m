Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5376EC32771
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 11:34:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9df2c152;
	Wed, 28 Sep 2022 11:34:00 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1b93bd9e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Sep 2022 11:33:58 +0000 (UTC)
Received: from nvm (nvm2.home.romanrm.net [IPv6:fd39::4a:3cff:fe57:d6b5])
 by rin.romanrm.net (Postfix) with SMTP id 7759A57A;
 Wed, 28 Sep 2022 11:33:57 +0000 (UTC)
Date: Wed, 28 Sep 2022 16:33:56 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Wei Chen <weichen302@zoho.com>
Cc: "wireguard" <wireguard@lists.zx2c4.com>
Subject: Re: Iptables WireGuard obfuscation extension
Message-ID: <20220928163356.183baef9@nvm>
In-Reply-To: <183272e3203.12ada1173180167.8469340361616836666@zoho.com>
References: <183272e3203.12ada1173180167.8469340361616836666@zoho.com>
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

On Sat, 10 Sep 2022 06:34:42 -0500
Wei Chen <weichen302@zoho.com> wrote:

> Hi,
> 
> Jason once suggested use a netfilter module for obfuscation[1]. Here is one.
> 
> https://github.com/infinet/xt_wgobfs
> 
> It uses SipHash 1-2 to generate pseudo-random numbers in a reproducible way.
> Sender and receiver share a siphash secret key. Sender creates and receiver
> re-creates identical siphash output, if input is same. These siphash outputs
> are used for obfuscation.
> 
> - The first 16 bytes of WG message is obfuscated.
> - The mac2 field is also obfuscated if it is all zeros.
> - Padding WG message with random bytes, which also has random length. They are
>   from kernel get_random_bytes_wait() though.
> - Drop 80% of keepalive message at random. Again randomness is from kernel.
> - Change the Diffserv field to zero.
> 
> Tested working on Alpine linux kernel 5.15 and CentOS 7 kernel 3.10.
> 
> Performance test in two Alpine VMs running on same host. Each VM has 1 CPU and
> 256 MB RAM. Iperf3 results 1.1Gbits/s without,vs 860Mbits/s with obfuscation.

Hello,

Are you the author, so we can ask questions about it?

The "Usage" section speaks of "server" and "client". However in the WG world
there's not really a server or client per se, but all WG network members are
peers. As such, is it possible to propose an universal set of iptables rules
that would be fine to use on any network node?

As I understand, all INPUT packets to our local --dport need to be --unobfs,
and all OUTPUT packets from us to any other node need to be --obfs. Right?

-- 
With respect,
Roman
