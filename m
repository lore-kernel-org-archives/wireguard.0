Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FA9C56201
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:29:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B7EE20870
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=spamteq.com header.i=@spamteq.com header.b="LohLao+d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B7EE20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spamteq.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e4e32c6;
	Thu, 12 Nov 2020 08:24:28 +0000 (UTC)
Received: from mail-out2.spamhaus.org (mail-out2.spamhaus.org
 [193.190.148.132])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 088daa2d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 17:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=spamteq.com;
 s=dkim2018; t=1605029899;
 bh=bUd96fmAB5K8kctEsBnL1DgUz3ZNO4JQ2xg8IAqhQLo=;
 h=To:From:Subject:Date:From:Subject:Date:To:Cc;
 b=LohLao+dplzQkbH+j0Leao97YZwz+brW5h0YedcKI26LDaH0wxJ+EY5jzggY9ow0K
 KZlVPGvL6xKJ1ogIQPWWoXvO9tPw3V8f31/wXfK3GvqzR3JDKu1ff8WsuUZhbgW4Tm
 GWxt0XMqYai8NxEA+yFZwpFPZ17f2gHutHVeXLqeIVU90Y71aIVf8PsIK8IwvkhFzj
 HLdaY12d4rDgU9bEud9nt0ExsLtjldu8KOy9dCdPFVkQJ0bvXQKGQQ6m1vmo3jFCfG
 pkii49MzxbJP27X4fG08cruonXiDCqapkv1iXW7YBdhnTAZIN86BoH9rLjMBHW1xdI
 i0NyM32Yv5qyA==
To: wireguard@lists.zx2c4.com
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
From: Andrew Fried <afried@spamteq.com>
Subject: Re: Should we sunset Windows 7 support?
Message-ID: <K17360-33.1605029899@spamhaus.org>
Date: Tue, 10 Nov 2020 17:38:19 +0000
MIME-Version: 1.0
In-Reply-To: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Mailman-Approved-At: Thu, 12 Nov 2020 09:24:25 +0100
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

We recently began deploying clusters of recursive DNS "firewalls" that
use wireguard to secure and authenticate all traffic between the client
and servers.=C2=A0=C2=A0 What we quickly learned was that virtually the e=
ntire
customer base in India uses Windows 7 almost exclusively.

I can certainly understand the desire to streamline development and
focus on current versions of client operating systems, but by
deprecating support for Windows 7 you would be reducing the number of
potential Wireguard deployments by hundreds of millions of users,
particularly in Asian and underpopulated communities in Africa.=C2=A0 Mos=
t of
the end users there simply can't afford the cost of updating to the
latest version of Windows.=C2=A0 I personally wish this were not the case=
,
but it is what it is.

Andrew

On 11/10/20 7:27 AM, Jason A. Donenfeld wrote:
> Hi,
>
> Windows 7 has been EOL'd by Microsoft since January of this year. It
> is no longer receiving security updates or fixes. This email is to get
> the conversation started about doing the same with WireGuard for
> Windows.
>
> Supporting Windows 7 is an ongoing maintenance burden. For example, we
> use SHA2 signatures instead of SHA1 signatures for our drivers, which
> is not something we want to compromise on, and as a result Windows 7
> users must have KB2921916 installed. But Microsoft never supplied
> KB2921916 via Windows Update and it removed all Windows 7 hotfixes
> from its webpage last year. So in order to keep supporting this, we're
> forced to add clunky disgusting code like this:
> https://git.zx2c4.com/wireguard-windows/commit/?id=3Db63957dc830e39c948=
44d2f0d32ba29575991e44
> Keen readers will wince at all the layering violations there. Do we
> really want to keep maintaining gross stuff like this? It makes me
> uncomfortable to have kludges like that sitting around in the code.
> Shouldn't I write an auto-downloader that then checks hashes?
> Shouldn't I build this into the installer? Shouldn't I.... waste tons
> of time supporting Windows 7 better?
>
> Probably not.
>
> But I know so many users are still using Windows 7. I'd like to hear
> from you to understand why, in order to assess when is the right
> moment to sunset our Windows 7 support.
>
> So, if you care for Windows 7, please pipe up! We're not going to
> remove support for it overnight, and we're not prepared yet to
> announce any sort of formal deprecation plan, but the world is moving
> on at some point.
>
> Jason

--=20
Andrew Fried
afried@spamteq.com


