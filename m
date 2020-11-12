Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E785BC5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 23:35:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8495A216FD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 23:35:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=werehub.org header.i=@werehub.org header.b="k5QU49jH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8495A216FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=werehub.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d35921fe;
	Thu, 12 Nov 2020 23:31:45 +0000 (UTC)
Received: from mail.werehub.org (mail.werehub.org [2a02:8304:29:420::205])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 74ef955d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 15:15:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D6B3240384
 for <wireguard@lists.zx2c4.com>; Thu, 12 Nov 2020 16:18:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=werehub.org; s=mailcow;
 t=1605194333; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=SOvYNlyvoA4UceeiaTm2Q90hkiOfe7LyA4cIHuTSJyA=;
 b=k5QU49jHrnf9xbLdDvBrbKdt/E2o/fY8jUTU+0FnoqShrhIIm2nXKVCvUcfzzdc+tYaHp0
 3+GPrvdW9uvMrmv/lEs1iCJooqp9xTEJNkqIcUzX3djuqN7yoYGF14AIuZTfr2da4uWVZ/
 hU3bWl5re7Fwl1x2WaiMOjfg3g/CUJnd8PqHGkDuZegce/34Zcx6mTHjfe5z5uajPhv2o4
 4hwtlqHolk+hBJG4fCwoANAwRAOQPyTlJMX0Ss8sLhngJa1bvkEds5ip69MQUHHfWnVKnf
 Bd0hKiozR5+GYlPViS9wffnEtcVJMncIWwYnXQsTFO7fnUK4vmIf1FGW3hebaw==
To: wireguard@lists.zx2c4.com
From: vh217@werehub.org
Subject: Using WireGuard on Windows as non-admin - proper solution?
Message-ID: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
Date: Thu, 12 Nov 2020 16:18:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Fri, 13 Nov 2020 00:31:41 +0100
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

Hello,

I've been wondering about using WireGuard on Windows as a non-admin user.

I have seen Jason's reply in this regard [1] and I understand the 
rationale. This however effectively means that WireGuard can't be 
directly used on company-issued machines where users who need to connect 
to company servers are usually not given administrator rights.

So I would like to open up two discussion points:
1) Is this use case something WireGuard was even meant for? I.e. should 
we even try to bend wg to be able to do this kind of stuff?
2) If the answer is yes, what would be the least hacky/workaround-ey way 
to do it?

I found a couple solutions on the Internet to this problem [2], [3] but 
both of them seem to be kind of complicated for setting up with dozens 
of clients.

In my mind there are two ways about the solution:
1) Somehow allow the user to be able to perform this one administrative 
task.
2) Since wg is essentially quiet when not being used, leave the wg 
tunnel on at all times. (aka "fire [up] and forget")

The 1) is more or less covered in the solutions in [2] and [3] so that 
doesn't seem like a way if we want something easy.
That leaves us with 2) which seems to work fine, although we've run into 
an issue with overlapping routes, i.e. if the remote company LAN is 
something like 192.168.1.0/24 and wg server 172.17.1.1 and the wg adds a 
route "192.168.1.0/24 via 172.17.1.1" then when the client is physically 
present in the company their LAN stops working. This could probably be 
easily fixed by setting up route metric as a PostUp, though my 
Windows-route-fu is weak in this one.

Any input on this would be greatly appreciated, since the info on the 
Internet seems to be rather scattered around.

Also, if anyone has an idea on how to modify the route metric in the 
PostUp, I think that might be an elegant solution to this.

Thanks!

Viktor

[1] https://www.mail-archive.com/wireguard@lists.zx2c4.com/msg04292.html
[2] 
https://www.reddit.com/r/WireGuard/comments/frizel/solution_managing_wireguard_on_windows_as_a/
[3] https://www.henrychang.ca/how-to-setup-wireguard-vpn-server-on-windows/


