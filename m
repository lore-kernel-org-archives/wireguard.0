Return-Path: <SRS0=tdjr=OT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B68C07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 01:01:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B78F2081F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 01:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="tReq3hp1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B78F2081F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8277a557;
	Mon, 10 Dec 2018 00:53:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f468ddf
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 00:53:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5db8ca2e
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 00:53:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c88eb53
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 00:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=a1S2KuJdwjyDUGwFDZBbrbtA6zo=; b=tReq3h
 p1eDhuJYFPrEDzQ7MeICRbaQ5ETilrIlbxFjkiJK+Ja2AvU8ubI7cJ4qByQ8HF/j
 YXO49A23xxeTewtNSJ3n3i2ixezi07QqLgx1yNEbS60E7DrmlyHWzt7vj2reGh16
 YbpuA8EE3tFqRo0vxkC49F+aZU54fsN2ifzIxCWMHYH07XUOTjXkhIBEE2qQl7Xv
 zNF32ax5GR4hM3uoYVHN4DEvEG69nKyrVLRpcn1Y4xVotB1X+ro4Ssd8/MKGpWHz
 x82TcMp8JqrC7w0iwpleypqQqPFVv88ZCNmXxPH6fgIyKgyxw2o63yMkPn2dhwU0
 5LsxkTUY7AW2o3TA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7a9de226
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 00:53:08 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id s5so8860489oth.7
 for <wireguard@lists.zx2c4.com>; Sun, 09 Dec 2018 17:01:44 -0800 (PST)
X-Gm-Message-State: AA+aEWYBNVzAmrc+kGwuNla9avJYASZ92AP8sLXOSiKgRVdCtUgp1cR6
 pgaDf4NJyd3Z70RQPThA7tiDYd1l75HoFkI4aQo=
X-Google-Smtp-Source: AFSGD/UNldeXjbkUM6L1+wEDetdPu0DZfdHXbznpGDTd8TON1AZyzKPyOMIHqB1SvmJmbUg1u+q2+wdLdX/Qg2ATNMI=
X-Received: by 2002:a9d:17ca:: with SMTP id j68mr6875511otj.268.1544403703193; 
 Sun, 09 Dec 2018 17:01:43 -0800 (PST)
MIME-Version: 1.0
References: <CALv=V9Gv6apdWJ9P-80zf9bgByd=c3QqPhRHuw6o0_OaH0=W6g@mail.gmail.com>
 <CAHmME9rQPtrSuqHmtRVTGj4N38P806Sph0=q8vXRF8tu8uruiQ@mail.gmail.com>
In-Reply-To: <CAHmME9rQPtrSuqHmtRVTGj4N38P806Sph0=q8vXRF8tu8uruiQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 10 Dec 2018 02:01:31 +0100
X-Gmail-Original-Message-ID: <CAHmME9qh+3sR-YL0OVJ4+t+qmutU0j=mJM==5L3QQAZ5Ux4mJA@mail.gmail.com>
Message-ID: <CAHmME9qh+3sR-YL0OVJ4+t+qmutU0j=mJM==5L3QQAZ5Ux4mJA@mail.gmail.com>
Subject: Re: wireguard-go on android crashes due seccomp enforcement of
 sys_inotify_init
To: bdd@mindcast.org
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

Locally fixed here:

https://git.zx2c4.com/wireguard-go/commit/?id=ccd0be9e3e1ba002c57f9e8d789b0dca3ca58081
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
