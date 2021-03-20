Return-Path: <SRS0=v6vS=IS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MISSING_HEADERS,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C663C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Mar 2021 17:14:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFF7A61940
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Mar 2021 17:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFF7A61940
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=harz.behrens.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9df308b7;
	Sat, 20 Mar 2021 17:14:51 +0000 (UTC)
Received: from post.behrens.de (post.behrens.de [2a01:170:1023::1:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d22dcfca
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Mar 2021 17:05:34 +0000 (UTC)
Received: from [IPv6:2a01:170:1023:0:e4fd:185a:e44b:e82c]
 ([IPv6:2a01:170:1023:0:e4fd:185a:e44b:e82c]) (authenticated bits=0)
 by post.behrens.de (8.16.1/8.16.1) with ESMTPSA(MSP) id 12KH5W0C062178
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO cn=)
 for <wireguard@lists.zx2c4.com>; Sat, 20 Mar 2021 18:05:32 +0100 (CET)
 (envelope-from frank@harz.behrens.de)
From: Frank Behrens <frank@harz.behrens.de>
Subject: Re: [PATCH] freebsd: Implement selection of FIB (routing table) for
 tunneled packets
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <6aa0fd33-4c0d-557f-f7f5-5f5406b3a273@harz.behrens.de>
 <CAHmME9q6dO1X+Gt3hY4kQxsQ4DqeaJGxoT8qkaAe-0s_WCrVrA@mail.gmail.com>
Message-ID: <ee43587f-8e17-add1-6b28-174639d126f8@harz.behrens.de>
Date: Sat, 20 Mar 2021 18:05:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9q6dO1X+Gt3hY4kQxsQ4DqeaJGxoT8qkaAe-0s_WCrVrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
X-Mailman-Approved-At: Sat, 20 Mar 2021 17:14:49 +0000
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

Hi Jason,

thanks for your response.

Am 19.03.2021 schrieb Jason A. Donenfeld:
> In other words, you have push access to all branches beginning with fb/ .
That works, thanks. Meanwhile I pushed my branch to fb/fib.

> Right now we have the `wg set wg0 fwmark ...` mapped to
> SO_USER_COOKIE, as I'm sure you saw there. But maybe FIB would be a
> better thing to use for that? We could adjust wireguard-go to do the
> same with the tuntap ioctl.
I believe we have different, orthogonal things:

1. The selection of routing table (fib) for received, decrypted packets.
-> Already implemented in wg_deliver_in() #2098 and controlled
by "ifconfig wg0 fib 1"

2. The selection of routing table for outgoing, encrypted packets.
-> That is addressed by my patch and controlled by
"ifconfig wg0 tunnelfib 1". Maybe wg(8) should receive also
an option for that purpose, if other OS use equivalent functions.

3. The setting of special marks, useable in packet filter/firewall
processing. I guess, that is the meaning for "wg.. fwmark". I'm not
sure, how best to implement that for FreeBSD. For ipfw(4) there is some
functionality using socket cookies, as already implemented. For pf(4)
packet filter the documentation mentions mbuf_tags(9). Apparently
we need some input from a FreeBSD packet filter developer.

Kind regards,
     Frank

-- 
Frank Behrens
Osterwieck, Germany

