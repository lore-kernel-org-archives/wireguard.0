Return-Path: <SRS0=i/Df=GF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9006EC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Jan 2021 15:34:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 924B1206F4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Jan 2021 15:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 924B1206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dsander.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35c83b1f;
	Sat, 2 Jan 2021 15:23:44 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 14e08270
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Dec 2020 17:31:45 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id h16so16062370edt.7
 for <wireguard@lists.zx2c4.com>; Wed, 30 Dec 2020 09:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dsander-de.20150623.gappssmtp.com; s=20150623;
 h=sender:from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=E2zKuqPkPyTLYlCU82jHzjVPJkm/5K7TYTbOrOmJtQA=;
 b=0s3f9Zc2TRrtVqeGMWCZfc1W7k88Sx3Q7/rVNMXwdMStzTpfmkVykItbQDXADuotOE
 1aZt4Hh9dO+LHSLhN7Ce5RYlo8E5JOHzyAJuZKMci7xtUgMk4AW7K9TETR9un7L0rjjS
 hfxHJiROVKTg2CZO6l9msZAwwpJqwzcxHR8f0S79HBNoBdat7C+Ovgjn9NKqLXoFwBeU
 TgQ4jhdTfwfs0DkfnM4k2Yk+g/nHL3ld/2bd5wVYUZ0Q9UbQ7JKDC2LTFXDiFQsJMa+H
 dQVyq9GOp+MQVJ1jvZtmRITmTqlumL0t2SkFK+bJYN3ETqJH1OgVwS24EXhqzCLf6YJe
 EhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:subject:to:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=E2zKuqPkPyTLYlCU82jHzjVPJkm/5K7TYTbOrOmJtQA=;
 b=fOF2/IgaLSCjC44OleHy8dSD/RlEzpXwwnveXkZpElOANSqZdXwFzm2McRTGgUIdFN
 E4Uz1eituVn1h3IMoibLNlI/bwSBkBppcCNs8MxXQzC11LUhnLoxK6aQUkujH90hZdGo
 BgTvNLgxT1TbLFQbgfaRKx6xsaObFDxUfjPpmggA9rUWbrpCQ7ZUJwifqzlyBMj1lqIL
 rIj7CY2spZBEpt3W9VPwGslVJqe9sxfayMu3yY+lvAXeSVTXZ0llcpUzKdlAWNm8MuI0
 IEIkxO/wuaRg0Lfr5fJc2gtLCXtz4VOTChJDbpq6d4Bz4cwKw2H/dWVr7LNb/f/YWL4Y
 VNyQ==
X-Gm-Message-State: AOAM533l3boXHDpsAu/f4Ky24jqeXHx4kmNlgsCV8sTLeK2UdnOlqQhP
 cVIg2oEvqIlN8RfxGXJ5SYub5ubMMA4HYOnq
X-Google-Smtp-Source: ABdhPJxK+xqxhZNL9o5PJy8VtIV+J7iPDMZco7T15i3jqpXEuUB3Myi2cOMoMN/g9W92enY8ecc/FA==
X-Received: by 2002:a05:6402:1352:: with SMTP id
 y18mr51786546edw.178.1609350116993; 
 Wed, 30 Dec 2020 09:41:56 -0800 (PST)
Received: from [192.168.1.235] ([185.251.102.202])
 by smtp.gmail.com with ESMTPSA id u19sm19406980ejg.16.2020.12.30.09.41.55
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 09:41:55 -0800 (PST)
From: Dominik Sander <mail@dsander.de>
X-Google-Original-From: Dominik Sander <wireguard@dsander.de>
Subject: Responses send by wireguard always use the default route
To: wireguard@lists.zx2c4.com
Message-ID: <201bd244-743e-ab52-55bb-798a1d75309e@dsander.de>
Date: Wed, 30 Dec 2020 18:41:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 02 Jan 2021 16:23:43 +0100
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

I would like to confirm if the behavior I am seeing is intended or if my
use case should be supported without additional configuration.

When wireguard is configured on a server that has multiple network
interfaces the response is always send through the route with the lowest
metric, even when the connection was initiated via a different interface.

The Wireguard server is exposed via my router, port 13377 is forwarded
to 192.168.1.246, the peer is connecting via an external IP:

# ip route
default via 10.0.0.1 dev eth1 proto dhcp src 10.0.0.171 metric 50
default via 192.168.1.1 dev eth0 proto dhcp src 192.168.1.246 metric 100
10.0.0.0/24 dev eth1 proto kernel scope link src 10.0.0.171 metric 50
10.0.0.1 dev eth1 proto dhcp scope link src 10.0.0.171 metric 50
192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.246 metric 100
192.168.1.1 dev eth0 proto dhcp scope link src 192.168.1.246 metric 100

# tcpdump -i any -vn "(host 80.xxx.xxx.xxx or src port 13377 or dst port 13377)"
tcpdump: listening on any, link-type LINUX_SLL (Linux cooked v1), capture size 262144 bytes
14:13:08.767409 IP (tos 0x0, ttl 50, id 12125, offset 0, flags [none], proto UDP (17), length 176)
    80.xxx.xxx.xxx.17819 > 192.168.1.246.13377: UDP, length 148
14:13:08.768076 IP (tos 0x88, ttl 64, id 180, offset 0, flags [none], proto UDP (17), length 120)
    10.0.0.171.13377 > .xxx.xxx.xxx.17819: UDP, length 92

Because the response is send from the "wrong" IP address the router does not know
how to forward it and the client never is properly connected.

I was wondering if the IP/interface of the request could also be used for the response,
to remove the need for policy based routing or iptable rules.

The actual use case is wireguard on a OpenWRT router which has multiple WAN interfaces.
The WAN with the lowest metric is not the interface that should be used for wireguard
because it has better download speed, the wireguard WAN has better upload speed.

Fore reference a thread discussing the problem on GitHub [1] and on the OpenWRT Forum [2].

Thanks for creating/working on wireguard!

Kind regards,

Dominik

[1] https://github.com/openwrt/packages/issues/9538
[2] https://forum.openwrt.org/t/wireguard-server-can-only-successfully-be-used-via-one-wan-interface/83374
