Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71BCC04A95
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 10:21:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 28f3afb2;
	Wed, 28 Sep 2022 10:21:00 +0000 (UTC)
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a43b9a4a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Sep 2022 11:34:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1662809688; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DJrnGUJ5PbRVVo4bqjgpF1BgZnd4qZEdaxF+LZfclPIBf8XvJ4RgmD3Xwx77GFAWnHDbAp+a2/UqTAm0gJzsq7Q0noKwU1xUlkSpgHqUpuYgwpBY9IymMF07ow5PWhI7goRoD3l/JWkJfJrPjrVAwrQl0XjJVKfZ97Ee5F8O65Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1662809688;
 h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=3XQ70c8MDS0KCvV9xn1FIpgEebwm3bZUXhj85xTpy1c=; 
 b=LDMBpsEyAat7fMncYcXVRrLaKp6LvhhmPSr9x5lI4flQfgxeV9HD8E3I8liYXUaeQXrs3IqStnvb0nMafvfcHNWWk0VUIs0pL1s+ApZCLexwO4SJbt4huoKPNmEJFEnWRSuUEat0wAA5204uQK33TfwOFZn3C7YKZUOVOnD2O/k=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=weichen302@zoho.com;
 dmarc=pass header.from=<weichen302@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
 h=date:from:to:message-id:in-reply-to:subject:mime-version:content-type:user-agent;
 b=lIxhBgyVVF0s9afpRgzDlxWCTxW6imHLvsbCfXPwqnCfU5GyD3Jw37fgQ9doeQqk47YsoC3KnPEb
 AHEPDT0/tpbtsNagd/iPAucUoboF1KFO7UfQ3XssLKJVrrnmnnY3  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1662809688; 
 s=zm2022; d=zoho.com; i=weichen302@zoho.com;
 h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=3XQ70c8MDS0KCvV9xn1FIpgEebwm3bZUXhj85xTpy1c=;
 b=FPrDRtIFQSnHE5ixYoDMY+b49zgnr82oLqQz+w6o2Zq2zzqRXk8gLADWlDGINklS
 JaHqbU3UIYagfcK4CPM2uok+64UTahG96dSOtSPlpCSmLJ40JBXqjHltV+FKTUjrcK+
 X6QHC9nX4eXiMnAXEbQkY0KBpt2v55zyteT4UJLE=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1662809682454311.518183937774;
 Sat, 10 Sep 2022 04:34:42 -0700 (PDT)
Date: Sat, 10 Sep 2022 06:34:42 -0500
From: Wei Chen <weichen302@zoho.com>
To: "wireguard" <wireguard@lists.zx2c4.com>
Message-ID: <183272e3203.12ada1173180167.8469340361616836666@zoho.com>
In-Reply-To: 
Subject: Iptables WireGuard obfuscation extension
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Wed, 28 Sep 2022 10:20:52 +0000
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

Jason once suggested use a netfilter module for obfuscation[1]. Here is one.

https://github.com/infinet/xt_wgobfs

It uses SipHash 1-2 to generate pseudo-random numbers in a reproducible way.
Sender and receiver share a siphash secret key. Sender creates and receiver
re-creates identical siphash output, if input is same. These siphash outputs
are used for obfuscation.

- The first 16 bytes of WG message is obfuscated.
- The mac2 field is also obfuscated if it is all zeros.
- Padding WG message with random bytes, which also has random length. They are
  from kernel get_random_bytes_wait() though.
- Drop 80% of keepalive message at random. Again randomness is from kernel.
- Change the Diffserv field to zero.

Tested working on Alpine linux kernel 5.15 and CentOS 7 kernel 3.10.

Performance test in two Alpine VMs running on same host. Each VM has 1 CPU and
256 MB RAM. Iperf3 results 1.1Gbits/s without,vs 860Mbits/s with obfuscation.


Wei

1. https://lists.zx2c4.com/pipermail/wireguard/2021-September/007155.html
