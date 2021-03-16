Return-Path: <SRS0=B3Yb=IO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B94C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 17:13:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F9BE65123
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 17:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F9BE65123
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0861698f;
	Tue, 16 Mar 2021 17:13:51 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [2607:f8b0:4864:20::d33])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fe416cff
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Mar 2021 17:13:49 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id g27so38021291iox.2
 for <wireguard@lists.zx2c4.com>; Tue, 16 Mar 2021 10:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=LdTU8JNN19De/6YG0m9exoj67s4UkjHWivqTBVMyxSY=;
 b=lzupkKG+FvaRp0PjWDQE//WskdEXBwWGqjcfk0s3qNm0UhClL6rVvkKbYnbLuxwXbd
 gDhgWWnxI4uVg5n8zu6/s1wIen+WkfDRi7lOvwHuYFsVHtRw+KRv3cURfwdleRQ83Bhx
 2TKY6MWBMA9WJg/OxsHWWwg4TRtSM19KAD/tYsvN159YiEtQex3UrpAAl8E0K19O+rVg
 XhGrHTNbF8dMfILdUwqqcHEDUD3/UoNG+fkzH1b9utonmDzBBehfXCzoUdD3MbVy1nxM
 ASvQLQfXvBd7Qs5LSU/5ZheMUcm6UPj8c6vmNxT+JgN1FNc2Vk7my1vW+/3/MnaWxAhN
 D8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=LdTU8JNN19De/6YG0m9exoj67s4UkjHWivqTBVMyxSY=;
 b=E170MiiRQMORSfd90NPD3NUgk7HZDgKjHCjRA87mRYj3uDX3QBOZcfCP+uhelKI60z
 jNNkd9YNLPr7NVIRH26xb8xi6RW10LikALzfbT/dX4ItI+HBtOKJ0gvvf+sBzR8xLXQj
 g4EInH5W2URGeJ9X2lhVqmtiwErwODwxO8qeQcGIVSWUBo3PB5GhYvOhgnX8jtwBXe8N
 AMaIc8woJuZPUT4khnhehIXDzDc9R7LxMQpAumGzsXPqfhwGk5mu4aYI987t/7YVsUac
 pFKb9ftTfE0VIHnPtyiadDXVEwgrq5eXbxoGi3ZLc7Dsj3mlIamtcaYQ1qI0AZTdWB7j
 HGoA==
X-Gm-Message-State: AOAM5330+m7YKdqXkk/rS2N6O6EOutnXOCs+9mDilKotpKo8l+8yDDDM
 vYUWXMGoqEKMPvcjO7UeXKqTDSIMr7jL9aGxifPiPAoc1+PVqg==
X-Google-Smtp-Source: ABdhPJxgZRgSO4zUBdqu3fymybt0U9uYN1cRmYhzSIgpDyYUk/THlqMVFC+AkJMlND6puMJWfIfum+GKTxRS9BPmCZY=
X-Received: by 2002:a5d:8552:: with SMTP id b18mr4169939ios.124.1615914827889; 
 Tue, 16 Mar 2021 10:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
In-Reply-To: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Tue, 16 Mar 2021 13:13:36 -0400
Message-ID: <CAH8yC8=3o+xDJH25DCWgMCaWbQpViX5QSAvud-ufZb7jpR03bg@mail.gmail.com>
Subject: Re: Removing WireGuard Support From FreeBSD Base
To: Kyle Evans <kevans@freebsd.org>
Cc: freebsd-arch@freebsd.org, FreeBSD Hackers <freebsd-hackers@freebsd.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Kyle,

I'm going to top post because there's only two points to raise. Sorry
about that.

I don't have a dog in this fight, so take this with a grain of salt...

> Netgate, pfSense, nor the original developer deserved the level of
> scorn and criticism that they've received in the past days from both the
> press and the community at large.

I have not really seen any scorn or criticism by the press or
community. But maybe my feeds are missing something...

> In the next day or so, I will be committing a removal of all WireGuard
> related bits from our 'main' branch, including the work that I recently
> committed. It will be followed up by a removal of the implementation
> from stable/13, and we will seek appropriate approval to remove it
> from releng/13.0 as well. Please, do not be concerned by any of this;
> this is being done with mutual support from all parties.

The thing I find unusual is, the move appears to lack technical
justification. The best I can tell, the reasons seem to be political.
But like I said, maybe my feeds are missing something...

As a naive outsider, if you are going to yank it, then the technical
reasons for the action should be clearly enumerated. Everything else
is just chatter or noise. The move just looks like a bunch of bruised
egos and sour grapes.

Maybe a good middle ground would be to take the existing code and put
it in a Wireguard branch. Those who wish to keep Wireguard out of
FreeBSD mainline have done so. FreeBSD users who wish to use Wireguard
can build the Wireguard branch. And those who wish to improve
Wireguard have a working branch for patches. Later, the branch can be
re-merged back to master.

Jeff

On Tue, Mar 16, 2021 at 12:51 PM Kyle Evans <kevans@freebsd.org> wrote:
>
> You may have recently noticed some chatter around the internet about
> FreeBSD's in-kernel WireGuard implementation, and the work we've done
> on it in the last week.  You may have also noticed additional chatter
> afterwards with regards to the original implementation.  I'd like to give
> some context and information with regards to the current situation, as
> well as provide some insight into the future as one of the developers
> involved.
>
> With regard to the original implementation, this will be my only
> commentary on the matter. I'm a developer, and I'm passionate
> about the work that I do- often to a fault. I've said some things that
> I regret; the accusations that Scott Long alluded to in an e-mail on FreeBSD
> mailing lists were indeed made by me, and his phrasing of what I
> said was much kinder than it could have been. These were mistakes,
> and I'm going to own that. However, my personal belief is that neither
> Netgate, pfSense, nor the original developer deserved the level of
> scorn and criticism that they've received in the past days from both the
> press and the community at large.
>
> In the next day or so, I will be committing a removal of all WireGuard
> related bits from our 'main' branch, including the work that I recently
> committed. It will be followed up by a removal of the implementation
> from stable/13, and we will seek appropriate approval to remove it
> from releng/13.0 as well. Please, do not be concerned by any of this;
> this is being done with mutual support from all parties.
>
> Did the original implementation have issues? Yes, it did. Are we
> certain that our new version -doesn't- have issues? I believe it
> doesn't, but it hasn't been through thorough enough review. We hacked
> on this for a week, and we all reviewed each others' work in the
> process. The problem is that this work, in particular, is a driver with fairly
> severe security implications. Review by "three developers working
> and beating on it" is not the higher bar that we should be
> holding this to. While I believed I was doing what's right for the
> community, it's become clear that what's right for the community is
> to take a step back and do this the right way.
>
> Note that we're not dropping this effort. We will continue iterating
> on this out-of-tree, and we will go through the proper review
> channels. Folks will be unhappy in the interim because we're removing
> it right now, but in the end we will have a better FreeBSD because of
> it. There will be a kernel module available in ports at some point,
> but not before it's ready.
>
> Moving forward, myself, members of Netgate, and members of the larger
> community *are* working together on strictly technical details. I urge
> anyone with an interest in reviewing the driver to also get in touch with me.
> Please, let's move forward as a community on this.
