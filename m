Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5BDC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 Dec 2021 17:25:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7698d77f;
	Sat, 11 Dec 2021 17:25:28 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5ef69746
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Dec 2021 17:25:26 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1639243525; bh=UBSEYVHq2kVUAE/IK0bQvRIx4kMCMmneDVoivpOdiIQ=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=UU0xIEGovn1UJCvIy9usyXeA5kGTo7iVP3N5kbpByEJw5yPgY8RcnWvooMjazkeXv
 jGxxeKx7/c9eUGlQGHn83TQ8d7Flp7Em6I5oTJWa/+a5WJ2fpImwWYXSMdrCAmIuKF
 lw3SC48UuSKcT//4MDh5eXuFDVuitFWwKysyImH13Kq235S3SfAKsD1I2oGodN+PS5
 la63pO4G4U4rwP3QI0sCwhNPJ/umApPPtGTc1RCl+gCNZV0sFqbH8wdk3imUxndvh5
 kDG6/TkthEnaGTLKhqFVnMbPbmIj18BESlao4BBmg3tfFJzk86qMfcat48ZOUk2OhT
 JF5mg/4ME44og==
To: Phil Perry <pperry@elrepo.org>, wireguard@lists.zx2c4.com
Subject: Re: Cannot add wg0 on CentOS 8
In-Reply-To: <46de3fe6-b355-41c3-d92e-dfdffb163dd9@elrepo.org>
References: <1877736804.292900.1639046846065.ref@mail.yahoo.com>
 <1877736804.292900.1639046846065@mail.yahoo.com>
 <46de3fe6-b355-41c3-d92e-dfdffb163dd9@elrepo.org>
Date: Sat, 11 Dec 2021 18:25:24 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <871r2jvyt7.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Phil Perry <pperry@elrepo.org> writes:

> On 09/12/2021 10:47, Mehdi Haghgoo wrote:
>> Hi,
>>=20
>> I'm trying to add=C2=A0 a wireguard device on CentOS Stream (was Linux j=
ust converted to Stream).
>> When I enter "ip link add wg0 type wireguard" or try it using wg-quick w=
g0 up, I get the following error:
>>=20
>> RTNETLINK answers: Operation not supported
>>=20
>> I have wireguard-tools and kmod-wireguard installed.
>> Additional information:
>>=20
>> uname -r: 4.18.0-147.8.1.el8_1.x86_64
>>=20
>> wg --version: wireguard-tools v1.0.20210914 - https://git.zx2c4.com/wire=
guard-tools/
>>=20
>> kmod-wireguard version: 1.0.20211208
>>=20
>>=20
>> Best regards,
>> Mehdi
>
> Is the wireguard module loaded? I doubt it.
>
> You are running a *very* old kernel, and I suspect the version of=20
> kmod-wireguard you are running does not support that kernel. Why are you=
=20
> running a kernel that is two years out of date and full of unpatched=20
> security holes?

RHEL (and thus CentOS) kernel version numbers are a complete fiction, so
don't mind the '4.18'. The important bit is the '-147' at the end, which
is still way out of date, though...

> Updating your system is probably the first step to fixing your issue.

My guess would be that he actually did update the system, it's just
running the old kernel still? I.e., if you install kmod-wireguard from
elrepo, that depends on a specific version of the kernel (-348 in the
current version), but if you haven't rebooted to actually run that
kernel, the module is obviously not going to work...

So, erm, Mehdi, have you tried turning it off and back on again? ;)

-Toke
