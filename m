Return-Path: <SRS0=F87Q=YJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC64ECE599
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:35:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E07C921835
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:35:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZJpIqWUS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E07C921835
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0df42d74;
	Wed, 16 Oct 2019 20:35:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a530cf95
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 20:35:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b761a7bf
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 20:35:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6c80264
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 19:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=tN37ao8K5xIBYFim0LiPu2DEBh8=; b=ZJpIqW
 USWBR641O9RgTmOxPyj8lo1Ji00M6mAWVyz2QVnt1rDWelsts5VVzwXRISECLwy0
 vSKB2Gnme/0hJsQ+9K/ZW30gL7VgqypM07y1ML3RZsj7z0alDpZz4c9OoCdDAvYD
 FGnLf2gJc6TCxsBttLtb1J74Pt+355gV6hpmz5t17TWtk3Knp1XXtZ57I2lO1tS6
 vbAcpBXtea6NmuHAHdrfwga2AfUgtmG0lzbF2qpDDH9Fi/YLbTmSIPXlFul8HhKg
 aenawwRrJhjI3LG5rO5lbe82g+6KfMIu1cz6s+NxvVgWLBJc7W+xVq9jVpsgZLUR
 6n4tVl8sxXNgkT0w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 98f3fcea
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 19:46:33 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id 41so21358717oti.12
 for <wireguard@lists.zx2c4.com>; Wed, 16 Oct 2019 13:35:02 -0700 (PDT)
X-Gm-Message-State: APjAAAVJi4LQP5j6+wkUNyn00HrF+5DeG+G2nd7lzXvDqGXm1Lfocl8t
 LQp027/lB/Xe7ZIRrie73ZRZ5UGp7n+KKaSWKvo=
X-Google-Smtp-Source: APXvYqz/cyhiwpztBo7YXGIjNsuaMF+FQLmetO9S84spVRXP5bTVwXXnj/+dXIYTVmf5OTDZwyQwCpABWzb2jgXTfRQ=
X-Received: by 2002:a05:6830:1bd9:: with SMTP id
 v25mr147402ota.52.1571258101922; 
 Wed, 16 Oct 2019 13:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <761368C4-83F7-41E0-85BD-EDFC51D3F3A0@gmail.com>
In-Reply-To: <761368C4-83F7-41E0-85BD-EDFC51D3F3A0@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Oct 2019 22:34:50 +0200
X-Gmail-Original-Message-ID: <CAHmME9p4PF=FA0yxQh_vmTgf7SZfiUuTqx0RPip1gBXPmrH2Xw@mail.gmail.com>
Message-ID: <CAHmME9p4PF=FA0yxQh_vmTgf7SZfiUuTqx0RPip1gBXPmrH2Xw@mail.gmail.com>
Subject: Re: Wireguard on MacOS Catalina randomly deletes config
To: Chris Gaffney <gaffneyc@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

This appears to be a bug in macOS 10.15. I've informed Apple, and
they're looking into it.

The log file you gave has the line in it:

> 2019-10-10 07:25:16.071772: [APP] Tunnel 'Office' connection status changed to 'invalid'

If you look at your system logs for that timestamp, that will
correspond with a line emitted from com.apple.networkextension like:

> Removing configuration Office because the corresponding VPN application has been removed.

Reverse engineering
/System/Library/Frameworks/NetworkExtension.framework/Versions/A/NetworkExtension
indicates that this comes from the call chain:

-[NEConfigurationManager
handleApplicationsRemoved:completionQueue:withCompletionHandler:]
-->
__90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke
-->
__90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke_2

So I assume that some kind of inclusion check is failing when it
shouldn't, or some kind of app store notification is being triggered
when it shouldn't.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
