Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A36EE4993
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Aug 2023 16:19:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0eca4422;
	Wed, 23 Aug 2023 16:07:17 +0000 (UTC)
Received: from mail-200166.simplelogin.co (mail-200166.simplelogin.co
 [176.119.200.166])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 428d7590
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Aug 2023 20:15:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1692303313;
 cv=none;
 b=0rS2CERjL+wM09WY/+fbv7se7i16DkshhJXVgF5V/CKUE9FXhzWYxZa8oV+9HkJTg1wYUxF+6m6Uya7zbywZeGnhZfCu8yZyRmwRZenR1LzKEhM6p4xOaJE/ClN7HnAnURPwaMgxnx4hptHG6fYFaAKm+okHK3/OtSNdBH9GsI73t4OuMG8jbDY45tdhctCTVCkKFfGtegmHWXbJjA9Vx0sTzZldlObUV40wzbb1Dw+7TGnmsgTdq2GrJxnjdRasamR72aPBJx/3QP2lQTntTaXA6H3BmX0XgJY1z/yycGZl3ASsy8N8GZtKqjYQGFErfgGSi8kIx8/SUiobuOXEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
 t=1692303313; c=relaxed/simple;
 bh=ZmrjpcF94IqYv5MJfqd3+Q2lVNCsOsSHL5J9w64Y0N4=;
 h=DKIM-Signature:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From:To:Message-ID:X-SimpleLogin-Type:
 X-SimpleLogin-EmailLog-ID:X-SimpleLogin-Want-Signing;
 b=3L3tyX2CtJm73nWSWYghOk/qA6Ueu8ys1uLUJnnvvBqlASyOxUd+2yYvrsqH3VkL2vZrtlZ9TjfEjlGGmYRVrWr16KZJUavjarjF3h2UE5SYzCAPQcfMnKiAUvvmDnGAOkCpQqex6llccgrAuwkm9Y3qgWxbnjcc11FNa9dafbM0pd2suQkocb+cVYBlcT8vXToml6B8JwsLW8ZiLkMoRItnifCw2mKECUkdMhxnJoglvFSEKii/xXDBzrt1X4Xs8US06B23ZayTv7XsWdC76ST7mLavOY9vTAaqeu47qeBctBbH0Ru21/IJa+A4YvUJv2/QM7XPnRki/2kW3/RwBA==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simplelogin.com;
 s=dkim; t=1692303312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZmrjpcF94IqYv5MJfqd3+Q2lVNCsOsSHL5J9w64Y0N4=;
 b=f93P2FpkjLSCaiDIZsNu93poWccel9xYU63vytgqNBnxgeZFJ51siSXOsFDPLAjFpcWUZ7
 dyivCkWq1LIHD8FFIAdB9NVxUROlniaFdArLjR8zH7Y0Q+9gUwlf+jRKdmmagQAKdR9iOP
 1BFFALIe1xmoP1YvTeu+PluWybd0+wY=
Date: Thu, 17 Aug 2023 20:14:52 +0000
Subject: Re: [WireGuard] Header / MTU sizes for Wireguard
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: blurt_overkill882@simplelogin.com
To: wireguard@lists.zx2c4.com
Message-ID: <169230331253.7.2936868369217934671.167170975@simplelogin.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 167170975
X-SimpleLogin-Want-Signing: yes
X-Mailman-Approved-At: Wed, 23 Aug 2023 16:07:07 +0000
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

Hello, I hope this is the right place.

I see here[1] that if you're using IPv4 exclusively, you can get away with =
an MTU of 1440. If my client only has IPv4 internet, however the server iss=
ues an IPv6 address for use by the client, can the client still use 1440 wi=
thout fragmentation, or must the client use 1420, because even though their=
 connection is IPv4, they are issued an IPv6 address within the tunnel?

[1] https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201.html

Thanks in advance!

