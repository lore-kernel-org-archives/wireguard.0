Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B010C54EE9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 13 Sep 2022 12:42:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 40155d0e;
	Tue, 13 Sep 2022 12:42:39 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 722daa82
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Sep 2022 12:42:37 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i26so19865427lfp.11
 for <wireguard@lists.zx2c4.com>; Tue, 13 Sep 2022 05:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=zYY9tRWZnNkQnCK5AKak3uLrJEYKtrG/fMmicFwN5r0=;
 b=dOuMWCPErXZnV9uQmaEnORKTAr5+HQI7b//I90bYQ4Cm3FOCtXVxUlWrG8VHWbSVaP
 z9wyiW/o0RJc0scWGwWuQYfLB5w5lcQtbBJazIXqYUlt1CacHH8JOkoJmvni9UifcSsn
 UUegrOHVdYAqGMHjzmlRapbACkcjwSFp3XqcVwJOBB/RYx8pKdIkryPyvcUi6x96G5rA
 QnM5bK38hb2yy0E35sdY0Z1O3lSUJYnbkiAdCZLYOuBSS3wRT1EkCG6Uc7Uq1Yb793GJ
 nsaYJc8TSseIxX4X6/9rB1+2Xdo2NoOiWdiVS8qnuC1YrE8U9HNiaqeKIdnpxeS9BBXt
 i4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=zYY9tRWZnNkQnCK5AKak3uLrJEYKtrG/fMmicFwN5r0=;
 b=vqloBe/XraQ9flWrh1+qzWlHuxfBG+xf1ciohOdozE2oP+97+/iNSMLVH4mX3cY3X6
 vsx4KYWr9iJGagM3HHyfk8d4bBm9RKnBUu1vTsL2SY7BJ+JHjTvXWTPemp8Jk9I12KVK
 /YATpkiPYd2/CLWyJDY1+GaxZpELiw7YkHhKHUl9mD8X8cGu8aHte2Et3vIR7QqEg6YP
 q7vZ1JvxNUef4IeAjBIJ3pzldpwquO9NY82cwPGmXRzkpl/C47rKjvjmZbALY8M/Onw8
 +FJDmXS4QId80JtFDvIOzLZITqjwtCaVLD3Fun0dwqiRc4hKwN9qSipQnuhKooeKpK6y
 /9SA==
X-Gm-Message-State: ACgBeo1ex19a//WnQZDjSPk1tpCLf8QdWqNicWxAHFd7Bahp7WwPVukW
 zj+ZJOwfnPYeOOBQKtwc7lrDZnHuCTi4wR9IaItAx/ACn5mDLg==
X-Google-Smtp-Source: AA6agR7bHlBU8eZY94XPFOGAmZP3TGGWoAm5bsWZGaVVRcwdZ1cvObP/H20dorj1x8fsZIavW7UUDC82nKO0yoe17SU=
X-Received: by 2002:a19:4f45:0:b0:49a:63c9:190d with SMTP id
 a5-20020a194f45000000b0049a63c9190dmr3532140lfk.61.1663072956141; Tue, 13 Sep
 2022 05:42:36 -0700 (PDT)
MIME-Version: 1.0
From: Houman <houmie@gmail.com>
Date: Tue, 13 Sep 2022 13:41:59 +0100
Message-ID: <CABBZOsks3ZnpcURYHSQcaWCe8ETY21zitPY5TvtTaAm38DT5EA@mail.gmail.com>
Subject: Wireguard iOS crashes after upgrading to XCode 14
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

My existing Wireguard iOS implementation stopped working after
upgrading to Xcode 14 today.
When trying to connect to servers that support only IPv4, then it's
fine. But if the server supports both IPv6 and IPv4 then the tunnel
crashes:

This IPv6 extension in
wireguard-apple/Sources/WireGuardKit/IPAddress+AddrInfo.swift crashes
with a Fatal Error at addrInfo.ai_addr.withMemoryRebound()

The whole extension below:

extension IPv6Address {
    init?(addrInfo: addrinfo) {
        guard addrInfo.ai_family == AF_INET6 else { return nil }

        let addressData = addrInfo.ai_addr.withMemoryRebound(to:
sockaddr_in6.self, capacity: MemoryLayout<sockaddr_in6>.size) { ptr ->
Data in
            return Data(bytes: &ptr.pointee.sin6_addr, count:
MemoryLayout<in6_addr>.size)
        }
        self.init(addressData)
    }
}

Has anyone else experienced this problem?

Thanks,
