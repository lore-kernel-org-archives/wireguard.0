Return-Path: <SRS0=NvnE=2C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E01CC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 20:27:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 969342077B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 20:27:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="e3C2MC0u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 969342077B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd385457;
	Thu, 12 Dec 2019 20:27:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d68b7fb
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 20:27:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ecb3877
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 20:27:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec8c7c11
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 19:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Y+aSZTadnU3iDN0e/xe/GOXVSw8=; b=e3C2MC
 0uNezQ7aDldgmSTorC8aiaRstw4w8pGljQ1X/sVt+Dijm+OQzdPJj1wes5Ne52M/
 +5FNo8PU6e2CbXqEksMW7y+LdgdPLItNfvtx1oze35DgnFUMfDHnUdihIc31F0a3
 CnouC8MohWuguWDJkb/ZzJa5y0vJ5wegXx6aQgq1OTS7wC0nCEkFz8cDk6N2wSAz
 6tgSSgFbFBN/WB/JEsnXZxi1D9wBA6zNtfJryFnJDiNo+n33kJFZGvvJCWE38aMX
 prIa49lHOpEBFqJZsF5mi+if1O7iPADmHlHmWXgMYY+xDSp+JMppShMSdnRgENxA
 Y5Zj3F68hgI51NZg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 50507c24
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 19:31:21 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id d17so3373424otc.0
 for <wireguard@lists.zx2c4.com>; Thu, 12 Dec 2019 12:27:11 -0800 (PST)
X-Gm-Message-State: APjAAAW0RUtxhb7n5tZUjxoONAdjT1VYsnBM/eeuyqdG+g9Wfi8P4oHx
 DfGyb7lwl0kTaZmp4lKhhF4kqqIIIpUziaU1dUI=
X-Google-Smtp-Source: APXvYqyNWh5KiJ0fkh8lteicuueIAq2Oq6Mhn936MRDlUHOuiGbVbQwu8eT/2J3zcVlyggv4YaSA5svZu76ChkRRuBg=
X-Received: by 2002:a05:6830:1b6a:: with SMTP id
 d10mr10574416ote.52.1576182430638; 
 Thu, 12 Dec 2019 12:27:10 -0800 (PST)
MIME-Version: 1.0
References: <CABPTpJBGQcze6b3_tJij8Ysp8zwb_4fyQAEv_fy4Bx9YpVcpRw@mail.gmail.com>
 <99D61A626FDA8A4B90A270669121BE10C9B3E6A8@PLANJAVA.amebis.doma>
 <b341c46c-5be8-4f6c-401f-beea6d13c8ba@trustiosity.com>
In-Reply-To: <b341c46c-5be8-4f6c-401f-beea6d13c8ba@trustiosity.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 12 Dec 2019 21:26:59 +0100
X-Gmail-Original-Message-ID: <CAHmME9qPk9SjwCYEz2npZgLKR=XMA4k6dAUxY2MAVQn+u+Jwwg@mail.gmail.com>
Message-ID: <CAHmME9qPk9SjwCYEz2npZgLKR=XMA4k6dAUxY2MAVQn+u+Jwwg@mail.gmail.com>
Subject: Re: Wireguard for Windows - local administrator necessary?
To: zrm <zrm@trustiosity.com>
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

On Thu, Dec 12, 2019 at 8:12 PM zrm <zrm@trustiosity.com> wrote:
> It makes sense that users shouldn't be able to manipulate WireGuard
> tunnels by default, but shouldn't it be possible to change the default
> through something less drastic than giving the user full administrator
> access?

I have no desire to add complex ACL schemes inside WireGuard. Catering
to that kind of user demand inevitably results in a security disaster.
Network and firewall config is an administrative task. Be
administrator. If you want to do otherwise, you're free to run your
own service that listens for commands on a named pipe with whatever
ACLs you want. But the development of that kind of ACL'd backdoor is
up to you and your organization.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
