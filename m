Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A249AC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:26:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A0ED2082D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:26:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="BwGf3lGc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A0ED2082D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e093494e;
	Sun, 4 Nov 2018 17:21:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f580b2f0
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:21:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e58d3e03
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:21:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b1ad714
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=aLJVhC50mvVrsoYAwYSkbiidpsI=; b=BwGf3l
 GcKYhKVooym6cMuqpCWfOW0EApiyHZzackrrctttGk6UtvblBpmMOPcIGIZSE0LA
 Rmx+MjrlxcrZdpxzUjLLNOMzvDDjCTGQjQpmx/S0j3vxuw7HRTh4AojsTj6J7jC1
 DlNOPlJbr2RdKIMTqn51wIgaiLpa0A+Dvxx3BLZAmVzWq25OCf74fnIGboak2JQb
 aVG9V2mUUe3SNZaihKxbprv3P3fClJM22BOiFcPQFcFVMflB/6kLNb2Ll9oIdhdr
 fJv/t+ZwvmekwTCNTWzcwoZU2UITT+ur+0bqUFvbQJn5yQYoZt/tf7/YK1Mt/iJT
 0tS2zRepEnQf5QAQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f8a7faac
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:21:55 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 40so5701551oth.4
 for <wireguard@lists.zx2c4.com>; Sun, 04 Nov 2018 09:26:02 -0800 (PST)
X-Gm-Message-State: AGRZ1gK+Wo96hjGUXNwuO+fRMF7XenYJfZ2l9wZth3doKRcml8MokZpP
 cezEtC9LbqvezJZ7IDDZdhN5qV3xLzbr1j1s6FQ=
X-Google-Smtp-Source: AJdET5ersAFqyrQQs6nJyqfBKf4lLalMwNi/mgs1+he0i6WO5Dfo6hsYvv3G1g3lCXOrbvA4uH/6TOd8xSJyIuMu1m0=
X-Received: by 2002:a9d:fef:: with SMTP id m44mr12547335otd.225.1541352362007; 
 Sun, 04 Nov 2018 09:26:02 -0800 (PST)
MIME-Version: 1.0
References: <523fbb0f-934e-4ba0-0948-718c9e1844a1@hfnet.de>
In-Reply-To: <523fbb0f-934e-4ba0-0948-718c9e1844a1@hfnet.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 4 Nov 2018 18:25:50 +0100
X-Gmail-Original-Message-ID: <CAHmME9rm838UB=stvUPZkOVe1SuDQFNOvAyPHU7dhQscnCOahA@mail.gmail.com>
Message-ID: <CAHmME9rm838UB=stvUPZkOVe1SuDQFNOvAyPHU7dhQscnCOahA@mail.gmail.com>
Subject: Re: WireGuard Android: Cached resolved host
To: hf@hfnet.de
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

t's mostly this way to prevent DNS lookup failures during the network
connectivity changes, such as turning on and off and on a tunnel
really fast. I agree the current implementation's behavior is
suboptimal though. Probably instead we should invalidate based on the
TTL.

The code in question lives at
app/src/main/java/com/wireguard/config/InetEndpoint.java if you want
to take a stab at fixing it.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
