Return-Path: <SRS0=pGg3=E7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22425C63777
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 12:30:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA681206F9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 12:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA681206F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bestov.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f72c747;
	Wed, 25 Nov 2020 12:24:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a86ec975
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 08:09:05 +0000 (UTC)
X-Originating-IP: 79.52.27.94
Received: from localhost (host-79-52-27-94.retail.telecomitalia.it
 [79.52.27.94]) (Authenticated sender: pbl@bestov.io)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0BC231C0017;
 Wed, 25 Nov 2020 08:14:40 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
From: "Riccardo Paolo Bestetti" <pbl@bestov.io>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Date: Wed, 25 Nov 2020 08:49:17 +0100
Message-Id: <C7C6HAUS055X.339KNR4ZAROGW@enhorning>
In-Reply-To: <CAHmME9qAjqF-p=AHrzpmO+KnFjSADMkqpYmOn+TRY9q04aBFMQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 25 Nov 2020 13:24:18 +0100
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

On Wed Nov 25, 2020 at 2:08 AM CET, Jason A. Donenfeld wrote:
> Hi Riccardo,
>
> Interesting consideration. I didn't know that.
I didn't know that either until I tried to deploy WireGuard on a laptop
yesterday! It seems not to be documented anywhere.

The group has been around since Windows XP afaik, however I have no idea
whether the associated licesing chicanery has also been around that long.

>
> Can you not add that group manually need be?
I'm not an expert on Windows, but a quick lookup on the net suggests you
cannot create a local group with a specific SID.

Since the group is looked up by SID - which is the correct way -:
  operatorGroupSid, _ :=3D windows.CreateWellKnownSid(
     windows.WinBuiltinNetworkConfigurationOperatorsSid)
I don't think this can be fixed in any (non-meddle-with-internals) way.

>
> Are there relevant use cases for "home" users using this feature?
Probably not home users, but user using the Home edition of the OS -
definitely yes.

I do some sysadmin work for small to medium sized companies, and it
happens quite often to come across "throwaway" low-cost roadwarrior
machines running Home edition.

Lately, due to the pandemic, I've had to set up a few machines with
WireGuard in a hurry (read: without due preparation and testing). 0.3
has been great news, as before that I was forced to add user accounts to
the Administrators group to allow users to connect. But I quickly
learned that this does not apply to machines running Home edition.

I understand that adding further knobs should be very carefully
considered. But I think that either this one needs to be added, or the
mechanism should be changed. For example, instead of having a on/off
registry entry, we could have an entry indicating the SID of the group
which has access to the limited UI, and its presence would indicate that
the feature should be enabled.

Riccardo

