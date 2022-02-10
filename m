Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87F0C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Feb 2022 00:21:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0a8adcc7;
	Thu, 10 Feb 2022 00:21:11 +0000 (UTC)
Received: from trinitron.activezone.de (trinitron.activezone.de
 [212.224.121.152])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 626ecbd1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Feb 2022 00:21:09 +0000 (UTC)
Received: from [10.159.71.132] (ip132-71.vl8.activezone.de [10.159.71.132])
 (authenticated bits=0)
 by trinitron.activezone.de (8.17.1/8.17.1) with ESMTPSA id 21A0L9sh051362
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO)
 for <wireguard@lists.zx2c4.com>; Thu, 10 Feb 2022 01:21:09 +0100 (CET)
 (envelope-from markus@activezone.de)
X-Authentication-Warning: trinitron.activezone.de: Host
 ip132-71.vl8.activezone.de [10.159.71.132] claimed to be [10.159.71.132]
Message-ID: <23d0b3c7-ff03-981e-3d24-c81273037757@mitteilung.com>
Date: Thu, 10 Feb 2022 01:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Feature Request :: Configuration-Option "ospf = yes|no" on
 Multi-Peer-Interfaces
To: wireguard@lists.zx2c4.com
References: <20211208173205.zajfvg6zvi4g5kln@linutronix.de>
 <CAHmME9rzEjKg41eq5jBtsLXF+vZSEnvdomZJ-rTzx8Q=ac1ayg@mail.gmail.com>
 <Yd2k7yCGCQXfibk3@linutronix.de>
From: markus@activezone.de
In-Reply-To: <Yd2k7yCGCQXfibk3@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4
 (trinitron.activezone.de [212.224.121.152]);
 Thu, 10 Feb 2022 01:21:09 +0100 (CET)
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

Hi!

Basically, I understood that WireGuard uses a kind of packet forwarding 
(routing) via "allowed-ips". Since the beginning I have always used a 
dedicated interface with "..., 224.0.0.5/32" for each peer and it works. 
However, I believe that an option is missing in order to allow a 
224.0.0.5 per peer in a multi-peer interface, that it is multicast 
traffic, it shouldn't be a problem, right?! Or just an option "ospf = 
yes|no" with which it is decided whether OSPF is transmitted in a peer 
or not. This would allow even greater flexibility between peer nodes 
with regard to dynamic routing. opinions on this?

Best regards,
Markus

