Return-Path: <SRS0=XnT5=73=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14151C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Jun 2020 18:19:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A5ED2071A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Jun 2020 18:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cs.umd.edu header.i=@cs.umd.edu header.b="Fx0ppp5b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A5ED2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cs.umd.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ecca5f1b;
	Sun, 14 Jun 2020 18:01:40 +0000 (UTC)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3e544345
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Jun 2020 18:01:36 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id a80so7825788ybg.1
 for <wireguard@lists.zx2c4.com>; Sun, 14 Jun 2020 11:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.umd.edu; s=google2;
 h=mime-version:from:date:message-id:subject:to;
 bh=0wWJsml0nNEvQ5PrK8knWas1fu4lqIN0Pftj/9j34lc=;
 b=Fx0ppp5btpl10tZFkyxOYRvCDHPYw9EGxuXaVmqj5/fJXpHl0OVspqE0yw1zcvyd2A
 kvFTQZE+MzZ4Ba/6ySs0MFPHfNk33IPMUm48raoYa9P85Thc1Tc2Zw1ExEurasEDws0C
 UO3YZKDis3tfFsIBP07fwuSuwL10K0TlM4OrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0wWJsml0nNEvQ5PrK8knWas1fu4lqIN0Pftj/9j34lc=;
 b=KxH+5FTVtHPyKh8llEZApd8G5AUOA5RWBqpR05ZawnY/7N8T6Xyq2bX1ozaLipCkOW
 wbAgDOGN4iE+3Ek4T6BUGW/t2bQKQvLMLA7oFDtFrRnXtV1clhjpz2om3vXau0j5IWDv
 eaYUtVZ3twBEei0GQ/SQfGxV70jsfpjvHqrgZyo+Mi5aqFJsBgpvmtXYI2zjc6NJQQHG
 5GMqqVZu4LbKQsJi/blw9H8uZ0VQjDocZoUStCmwnghx6wsU3vTpRtr45mk/uzpwemZz
 D1b+HIIea1asGZ+FtJm915ZEqt128/oU9V5gK7jOKOJ3lw6J+NPh+axOTuS+OJmQdYBH
 I7Fg==
X-Gm-Message-State: AOAM531LVoEBRmwZHu8uextgk0/5HjVUzYirH3hqgLMlnR7rJKCTj/TG
 PnRNSvVJVD6BjMYDtWsb4ekoygSvtwqUU3N3TuIwYybi
X-Google-Smtp-Source: ABdhPJwiuDKsHsDo+x/PF6agob/j32ZMHI5ecrISSIh8cclczuUrLfg7A87tvumzIlQZG/RKoGo4tAj4lq5YitDpUdI=
X-Received: by 2002:a25:1045:: with SMTP id 66mr39276043ybq.314.1592158760270; 
 Sun, 14 Jun 2020 11:19:20 -0700 (PDT)
MIME-Version: 1.0
From: Sergey Ivanov <seriv@cs.umd.edu>
Date: Sun, 14 Jun 2020 14:19:07 -0400
Message-ID: <CAM+N7v=DWfk-b8V0C5kjrTRPv-nTb5OuuVoSYMMNNATdK6yR=g@mail.gmail.com>
Subject: Openwrt wg0 behaves not alike that on Fedora: why?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

Hi,
I have a question about wg0 on OpenWRT not forwarding packets from one
client to another. I have a laptop at home in my home LAN, and a
computer at work in a very restricted LAN. They can not see one
another. I spent a lot of time trying to get them connected by adding
their wg0's IP addresses to the AllowedIPs on my home router running
OpenWRT. I saw pings from each of them successfully decrypted (I've
used ping with patterns) on the OpenWRT wg0, but they never got routed
further.

When I decided to try to move the same AllowedIPs from OpenWRT's wg0
to my desktop Fedora, it immediately worked. It looks like some sort
of setting like isolation of the clients, or hairpin mode which is
different on OpenWRT than on Fedora.

Can someone help and suggest what I should look at? I'd like to have
it working on the router which is all time on.

-- 
  Regards,
  Sergey Ivanov
