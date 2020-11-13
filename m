Return-Path: <SRS0=pWoz=ET=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EF1C63697
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Nov 2020 22:41:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF12622252
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Nov 2020 22:41:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ClGu4V82"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF12622252
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 875663d8;
	Fri, 13 Nov 2020 22:36:54 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 03be2af5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 22:36:51 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4f513b6
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 22:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=OJIQBsQN9YtZ59U8T292O32PRFg=; b=ClGu4V
 82JgxtH+96ZdKad/6V8fFydSOranrAO/P2pWzperym6X5Ebk09NlEza1LxNfH5et
 zSccOxVP0OWl1XKN6LjyktNrQqgOmz79PV0rBqrCRHfHkISyxy6J9rBi4CzLwEYB
 auVwVjk5oBrsbChH66Ihd9JI0kI+S//aLV+1eDLhCM1+jw0sA0+jxMkYX9/WqR/Q
 t0gXQTzeFlBeHMl+ym6jLjEhVQXOZ77bdlIrvMa5J8eo/ZO1lm4cu4VE+2pm0YPp
 TcXnEex7CyoC0JOC+YhYRsFysplWsMT876W9gq4chBHaFzQQQP4yP1l7oF6u5pU1
 /EYRvyWvU8XGohzQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bc8d1c7d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 22:37:37 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id i193so10143229yba.1
 for <wireguard@lists.zx2c4.com>; Fri, 13 Nov 2020 14:40:59 -0800 (PST)
X-Gm-Message-State: AOAM533jgNphQ0Mw10mzZAtOSV4/7Jw3YhB1TEiVKEtbtTMa5wnfrWAH
 7uRveijHPSGK24oU+zqYQqnSo4M/h+LUqdrksBA=
X-Google-Smtp-Source: ABdhPJy4GHaEV+sM67RNRkegMlf+s/XVygZw2mSKbBF4g5x7T20uFd0ua6JodgxMauamrd8pWTxcgPSeuv0shuxsYaQ=
X-Received: by 2002:a25:6f83:: with SMTP id k125mr6338937ybc.123.1605307258734; 
 Fri, 13 Nov 2020 14:40:58 -0800 (PST)
MIME-Version: 1.0
References: <20201110035318.423757-1-sashal@kernel.org>
 <20201110035318.423757-26-sashal@kernel.org>
 <CAHmME9pPbitUYU4CcLaikQLOMjj-=b16nVXgp6+jh1At4Y=vNg@mail.gmail.com>
 <X6rMJe+bF+/ZyyTz@kroah.com>
In-Reply-To: <X6rMJe+bF+/ZyyTz@kroah.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 13 Nov 2020 23:40:47 +0100
X-Gmail-Original-Message-ID: <CAHmME9r0Oar0Js5hhO=5U9JTqS1P04VkYjSq1cqXW19ZOvgh+g@mail.gmail.com>
Message-ID: <CAHmME9r0Oar0Js5hhO=5U9JTqS1P04VkYjSq1cqXW19ZOvgh+g@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.9 26/55] wireguard: selftests: check that
 route_me_harder packets use the right sk
To: Greg KH <greg@kroah.com>
Cc: Sasha Levin <sashal@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 stable <stable@vger.kernel.org>, Chen Minqiang <ptpt52@gmail.com>, 
 Pablo Neira Ayuso <pablo@netfilter.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Netdev <netdev@vger.kernel.org>, linux-kselftest@vger.kernel.org
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

On Tue, Nov 10, 2020 at 6:20 PM Greg KH <greg@kroah.com> wrote:
>
> On Tue, Nov 10, 2020 at 01:29:41PM +0100, Jason A. Donenfeld wrote:
> > Note that this requires
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=46d6c5ae953cc0be38efd0e469284df7c4328cf8
> > And that commit should be backported to every kernel ever, since the
> > bug is so old.
>
> Sasha queued this up to 5.4.y and 5.9.y, but it looks like it doesn't
> easily apply to older kernels.  If you think that it's needed beyond
> that, I'll gladly take backported patches.

Backport to older kernels coming your way shortly.
