Return-Path: <SRS0=ZLx+=WB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF287C0650F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:45:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25634214C6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:45:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gts.com.na header.i=@gts.com.na header.b="enrH1PvM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="SCFE7+9K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25634214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gts.com.na
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73cf2a25;
	Mon, 5 Aug 2019 18:45:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 660dc9e3
 for <wireguard@lists.zx2c4.com>; Fri, 2 Aug 2019 14:54:32 +0000 (UTC)
Received: from a2-38.smtp-out.eu-west-1.amazonses.com
 (a2-38.smtp-out.eu-west-1.amazonses.com [54.240.2.38])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 032b61ab
 for <wireguard@lists.zx2c4.com>; Fri, 2 Aug 2019 14:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=nl7u56poeqdzea6x6xhesdmsua7tzvl6; d=gts.com.na; t=1564757671;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
 bh=Z4UQFJuzgftZYvdqm4mgtRJnssXZcGncuiy+htFRIdw=;
 b=enrH1PvM2yGsBNOWM9Ri44bimUstPmrsaZGSvAL72ehSvfpUzJnfeLZiCJsi9Wgs
 FPmhfKFSuLlzIjTlbvQK/vCWCPGTds4XRJIo3+F73Ru6neq/fftGdbwfXlKUDOub/Oa
 PmHUauxR2qQXo8PsXgNbHxEmF+eiw5D5ywUVwLIA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1564757671;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
 bh=Z4UQFJuzgftZYvdqm4mgtRJnssXZcGncuiy+htFRIdw=;
 b=SCFE7+9KDnfyb3GIsZdV7eVNYCIBXJeWDJdnms3FCkVvtftXDzOXvSuIXG2iIBXu
 DyaAdraiMvd6VDbKlPUQjwApFDB1Xxj2lSHX2aEdBuFcvhqKkPDnTqMp4QYQWDQ/+z4
 XPNRFnt7hjf2KYrzhjUXhfSk5Hh6xCQSd3yw+wDA=
Subject: Windows 10 Traffic Dump on Wireguard Interface
From: =?UTF-8?Q?Siegfried_Herholdt_=28GTS=29?= <siggi@gts.com.na>
To: =?UTF-8?Q?wireguard=40lists=2Ezx2c4=2Ecom?= <wireguard@lists.zx2c4.com>
Date: Fri, 2 Aug 2019 14:54:31 +0000
Mime-Version: 1.0
References: <D75CD021-DF88-4F3F-86DF-7A79BE7EDBD8@contoso.com>
X-Priority: 3 (Normal)
X-Mailer: Amazon WorkMail
Thread-Index: AQHVSUIw2rjlJsZBSi2WiXhrkYsJwQ==
Message-ID: <0102016c52d33db1-5ed34601-9f16-4305-abfa-96ce1f22f183-000000@eu-west-1.amazonses.com>
X-SES-Outgoing: 2019.08.02-54.240.2.38
Feedback-ID: 1.eu-west-1.b24dn6frgCi6dh20skzbuMRr7UL8M6Soir/3ogtEjHQ=:AmazonSES
X-Mailman-Approved-At: Mon, 05 Aug 2019 20:45:15 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

I am an early adopter of Wireguard and trying out various network configurations.

I have issues passing certain types of traffic from a MacOS Wireguard client to a Windows 10 Wireguard server (master).  To troubleshoot this I normally do a network traffic dump on each side, among other things.  However, I am not able to get any combination of tools to capture raw traffic on my my Wireguard interface.

With Wireshark the Wireguard interface does not show up, even if the Wireguard tunnel is up and working for some traffic, for e.g. Remote Desktop.  The same when I use Microsoft Message Analyzer. It seem as if Wireguard's network interface is not available.  However, if I list my IPV4 interfaces via Powershell using netsh, the Wireguard interface is in the list.

Does anybody have a pointer for me how to capture the raw network traffic on the Wireguard interface?

Thanks,
Siggi


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
