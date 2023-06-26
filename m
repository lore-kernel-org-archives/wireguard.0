Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAE7EB64D7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Jun 2023 14:56:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 814f0df2;
	Mon, 26 Jun 2023 14:53:14 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.86.59])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 177b6253
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2023 14:53:12 +0000 (UTC)
Received: from nvm (nvm.home.romanrm.net [IPv6:fd39::101])
 by len.romanrm.net (Postfix) with SMTP id D5A444027B;
 Mon, 26 Jun 2023 14:53:11 +0000 (UTC)
Date: Mon, 26 Jun 2023 19:53:11 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Rumen Telbizov <rumen.telbizov@menlosecurity.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: WireGuard IRQ distribution
Message-ID: <20230626195311.03e86a19@nvm>
In-Reply-To: <CA+FoirDk8ZC09YXC7T6ureaBWG6ZREpfE3cq5MoAkKf-rC=U1g@mail.gmail.com>
References: <CA+FoirDk8ZC09YXC7T6ureaBWG6ZREpfE3cq5MoAkKf-rC=U1g@mail.gmail.com>
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

On Tue, 9 May 2023 15:17:00 -0700
Rumen Telbizov <rumen.telbizov@menlosecurity.com> wrote:

> Baseline iperf3 performance over plain VLAN:
> * Stable 24Gbit/s and 2Mpps
> 
> bmon:
>   Gb                      (RX Bits/second)
> 24.54 .........|.||..|.||.||.||||||..||.||.......................
> 20.45 .........|||||||||||||||||||||||||||||.....................
> 16.36 ........||||||||||||||||||||||||||||||.....................
> 12.27 ........||||||||||||||||||||||||||||||.....................
> 8.18 ........|||||||||||||||||||||||||||||||.....................
> 4.09 ::::::::|||||||||||||||||||||||||||||||:::::::::::::::::::::
>      1   5   10   15   20   25   30   35   40   45   50   55   60
>    M                     (RX Packets/second)
> 2.03 .........|.||..|.||.||.||||||..||.||........................
> 1.69 .........|||||||||||||||||||||||||||||......................
> 1.35 ........||||||||||||||||||||||||||||||......................
> 1.01 ........||||||||||||||||||||||||||||||......................
> 0.68 ........|||||||||||||||||||||||||||||||.....................
> 0.34 ::::::::|||||||||||||||||||||||||||||||:::::::::::::::::::::
>      1   5   10   15   20   25   30   35   40   45   50   55   60
> 
> top:
> %Cpu0  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
> %Cpu1  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
> %Cpu2  :  1.0 us,  1.0 sy,  0.0 ni, 98.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
> %Cpu3  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
> %Cpu4  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
> %Cpu5  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
> %Cpu6  :  1.0 us,  0.0 sy,  0.0 ni, 99.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
> %Cpu7  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
> %Cpu8  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
> %Cpu9  :  1.0 us,  1.0 sy,  0.0 ni, 98.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
> %Cpu10 :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
> %Cpu11 :  0.0 us,  0.9 sy,  0.0 ni, 16.8 id,  0.0 wa,  0.0 hi, 82.2 si,  0.0 st
> %Cpu12 :  0.0 us, 32.3 sy,  0.0 ni, 65.6 id,  0.0 wa,  0.0 hi,  2.1 si,  0.0 st
> %Cpu13 :  1.0 us, 36.3 sy,  0.0 ni, 59.8 id,  0.0 wa,  0.0 hi,  2.9 si,  0.0 st
> %Cpu14 :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
> %Cpu15 :  0.0 us,  1.0 sy,  0.0 ni, 99.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
> 
> The IRQs do pile up behind CPU 11 because iperf3 is single-threaded.

I'm not sure if they pile up because of that, or because of the same reason
you point in WG's case, the 5-tuple being the same for the single TCP
connection of iperf3.

Out of interest, maybe you could try iperf3's UDP mode, and apply the same
port randomization trick as you used for WG, and see if it also makes it see
the better IRQ distribution, and the speed drop?

-- 
With respect,
Roman
