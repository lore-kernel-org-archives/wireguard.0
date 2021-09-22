Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E43C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 13:30:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D09B611B0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 13:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D09B611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=physik.uni-bonn.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66e24674;
	Wed, 22 Sep 2021 13:27:21 +0000 (UTC)
Received: from mail.uni-bonn.de (mail.uni-bonn.de [131.220.15.113])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eb46590b
 (TLSv1.2:ECDHE-ECDSA-AES256-SHA:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 10:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=physik.uni-bonn.de; s=mail; 
 bh=ehsVW9+ldDAVGHRPAAfEBu4jRxH6YVXwu70H788TIr0=;
 h=Content-Transfer-Encoding:Content-Language:Content-Type:MIME-Version:Date:
 Message-ID:Subject:From:To; b=dKvikD+0IO0DpIf9PO3ryhLWAP3LichFemqbkh7JebP/fta
 eOueQvFFepSuSCYzc9RdYyAXDSl3LQWS2urtnsRh8PWb3/opJgxT2+seaXkxGOgSyBoUkQcHoeVHY
 jmY4GsIYkYlpLIjt8IEpkKx901m0uDQP5gunm/veIBqO7HE=
Received: from [131.220.15.217] (HELO uni-bonn.de)
 by uni-bonn.de (CommuniGate Pro SMTP 6.3.7k)
 with ESMTP id 213492790 for wireguard@lists.zx2c4.com;
 Wed, 22 Sep 2021 12:09:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=physik.uni-bonn.de; s=mail; 
 bh=ehsVW9+ldDAVGHRPAAfEBu4jRxH6YVXwu70H788TIr0=;
 h=Content-Transfer-Encoding:Content-Language:Content-Type:MIME-Version:Date:
 Message-ID:Subject:From:To; b=dKvikD+0IO0DpIf9PO3ryhLWAP3LichFemqbkh7JebP/fta
 eOueQvFFepSuSCYzc9RdYyAXDSl3LQWS2urtnsRh8PWb3/opJgxT2+seaXkxGOgSyBoUkQcHoeVHY
 jmY4GsIYkYlpLIjt8IEpkKx901m0uDQP5gunm/veIBqO7HE=
Received: from [131.220.161.21] (account freyermuth@physik.uni-bonn.de
 [131.220.161.21] verified)
 by uni-bonn.de (CommuniGate Pro SMTP 6.3.7k)
 with ESMTPSA id 16114115; Wed, 22 Sep 2021 12:09:06 +0200
To: wireguard@lists.zx2c4.com, team@wireguard.com
From: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>
Subject: Windows stuck in boot after WireGuard update (switch to WireGuardNT?)
Message-ID: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
Date: Wed, 22 Sep 2021 12:09:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Sep 2021 13:27:16 +0000
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

Dear Jason,

we have observed two cases (laptops, one running Windows 10 Enterprise, the other Windows 10 Pro 2009)
in which Windows got stuck during boot (during the "rotating dots", which keep rotating forever).

This has been observed end of last week for one laptop, and just today for the other affected laptop.
Both systems have installed WireGuard updates "as they were released", i.e. both were running 0.4.9 when the error occured.
Both laptops use BitLocker disk encryption (but I suppose this is not part of the issue).
While both machines are shut down and started up daily, both may not have seen a full reboot until the error occured (thanks to Windows fast startup).

I could revive the systems and pinpoint the issue down to WireGuard as follows:
- Start in "safe mode".
   Note that "safe mode with network drivers" will also get stuck.
- Login with an admin account, and in Device manager, disable or uninstall the following two network adapters:
     WireGuard Tunnel
     Microsoft Kernel Debug Network Adapter (is this also pulled in via WireGuard?)

After that, the laptops reboot fine again, and strangely enough, WireGuard is usable right away (using the WireGuard NT driver).
I tried to provoke the issue when the laptops were in my hand, by enabling / disabling WireGuard, rebooting, shutting down and starting up,
installing all Windows updates which were available, but to no avail.

However, once I returned the first laptop back to the user, it has shown the same issue again ~24 hours later (still running WireGuard 0.4.9).
Of course, since these are laptops, they see many connection state changes, in case this may be a trigger of the issue.

To further pinpoint the issue, I have used:
  reg add HKLM\Software\WireGuard /v UseUserspaceImplementation /t REG_DWORD /d 1 /f
on one of the two laptops, to check if this prevents reappearance of the issue (I ran that only now, so no feedback by the user yet).

Since both are in heavy use by the respective users, I can sadly not keep them for long to do more detailed debugging,
and I have not yet managed to reproduce such an issue with any of our test machines (which are however not laptops).
I've also net yet managed to trigger this on my own Windows 10 laptop, so this may be some kind of very evasive / rare issue.


Does this kind of issue ring any bells?


Cheers,
	Oliver

PS: I am not (yet) subscribed to the list, so pleace CC me in replies. Thanks!


-- 
Oliver Freyermuth
Universität Bonn
Physikalisches Institut, Raum 1.047
Nußallee 12
53115 Bonn
--
Tel.: +49 228 73 2367
Fax:  +49 228 73 7869
--
