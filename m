Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DATE_IN_PAST_12_24,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E09C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 19:55:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD59320786
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 19:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QepQelHk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD59320786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54a18e66;
	Thu, 18 Jun 2020 19:36:50 +0000 (UTC)
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [2607:f8b0:4864:20::b44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bed92c3f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 01:05:08 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id d13so2249931ybk.8
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 18:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GAqNPNlb+AFQviJCRiZI16sUyD/adcRbeeuyneInuoE=;
 b=QepQelHkhTl7tKzCp7bhoOryPvhPh0DHCEofZz4+vO1Iw6hobXJQ8EyfPoBmLIkL+1
 SgkfJ4e6sARg1GSbQmrPCTA+GN9Ed15kkohH8+fzw1+wVEaxajfeuLsLy4dx7XFXGC3s
 rglIMMj3VQnebEQ/IJ/a0xF2wmBuYc1FgtqmZENIPa0p6iNsRe1qXBzu+DCytlBW2JnQ
 rJXUXvj2SoRPsBnAP+bQsOz6qLb4+EqInru6uFJCJJ/CaD4xTnoyCTiAm40WOsZqa7RV
 ODFJTi7Q2Fc7AaKMao619ACMyoiURDnL3QsHIJtmG5BDYEunXWJ2YYsoOJB6DHYEG8ek
 m3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GAqNPNlb+AFQviJCRiZI16sUyD/adcRbeeuyneInuoE=;
 b=lj3e5qAIeINe+JlIJeTHkKTWKM6k271BIQcjLrhXhAEnnolQZzl/Tj7Wl1c7XdrAA7
 qN3PTNlJPlDlh/vMgzaxJJRRtW2cmyrTI9dExuGrV2MKtd/Ob6EG99lPLAXARoS943Uu
 pFtuPTiOmLMX4SRzuHoyKGIzfZBCYT0cRs01S16owYnDBnvg1dyh+omWaw+jMZ0spg7p
 TGHI7J9FjFhfDDlQOmRcRBQL1pRSMvkeeSPa8hphpZIfRT9SWFuUSZ3ROTft8T/cT8eZ
 mlZlXDSV31qpzLFXfHiksgtN5DdqwhHDoGr3HZjpRwXhlzaOnS2eMo1v+V+DratsvpF8
 kmpw==
X-Gm-Message-State: AOAM533VS9rrJjw6C+zJMpT7hukl6etVWAF4HHbnc8lUl/F1oEDtAu9s
 s6DLsMp1kDl4cR/12jif4BIL4RRhFhcCe/r0wJhlKpVxeyM=
X-Google-Smtp-Source: ABdhPJyI53kI0LB6FutxDa9LV3WDD+CtUpTiaCVGZ2Sh3ZrsbJnQMxrKijHAhmtko7sQLTO6QjqcEmFFsAaRxjjhizA=
X-Received: by 2002:a4a:e58a:: with SMTP id o10mr6434017oov.21.1592396762662; 
 Wed, 17 Jun 2020 05:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200528184510.51675-1-contact@garrit.xyz>
 <CAHmME9pt7itFsXQnU=9LeRrcT5Yh7gd97bghOA-5a-nCvo85UQ@mail.gmail.com>
 <29f7ec55-3a4b-42df-91f8-5204179639f5@www.fastmail.com>
 <CAHmME9oiN4uUjKPqAAkvrVtzh-0LgfLcPd92xQgFJAqgtWtXsw@mail.gmail.com>
 <bbb39589-9b55-49fc-9723-8086909e0bcf@www.fastmail.com>
In-Reply-To: <bbb39589-9b55-49fc-9723-8086909e0bcf@www.fastmail.com>
From: Garrit Franke <garritfranke@gmail.com>
Date: Wed, 17 Jun 2020 14:25:51 +0200
Message-ID: <CAD16O85k90LSSzno1pQpOXGKTzfEx=uKGbaduWmmL5WMQ2RwSQ@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: add restart command
To: Eric Light <eric@ericlight.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 18 Jun 2020 21:36:45 +0200
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

Thanks for your comments!
I really like the systemctl reload approach. My main intention with
this patchset was to add this feature to wg-quicks arsenal because (at
least for me) it's the most obvious approach. I mainly use `wg-quick
down wg0 && wg0 up wg0`, I think you guys see where I'm coming from.

I haven't dealt with systemd units yet, but I can certainly look into
it and submit a corresponding patch soon.

Am Mi., 17. Juni 2020 um 10:32 Uhr schrieb Eric Light <eric@ericlight.com>:
>
> Oh hey that sounds like a great way to do it.  Seems like it'd be simpler than this patch set as well, which is always good.
>
> E
>
> --------------------------------------------
> Q: Why is this email five sentences or less?
> A: http://five.sentenc.es
>
> On Wed, 17 Jun 2020, at 20:19, Jason A. Donenfeld wrote:
> > On Wed, Jun 17, 2020 at 2:17 AM Eric Light <eric@ericlight.com> wrote:
> > >
> > > As a purely Debian user, the 'service x restart' pattern is far more memorable than the syncconf method.  I know personal preference isn't a great reason to add a knob, but Garrit's method is probably going to be much more familiar to many users.
> >
> > For users who want service management patterns like that, it'd
> > certainly be possible to map the wg-quick strip stuff to `systemctl
> > reload wg-quick@wg0.service`, for that purpose. Maybe that's something
> > we should consider?
> >
