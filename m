Return-Path: <SRS0=zGfa=LJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C94AC48BE5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jun 2021 15:07:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77B961107
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jun 2021 15:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77B961107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 623857dc;
	Tue, 15 Jun 2021 15:07:48 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [2607:f8b0:4864:20::52b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a97e47e0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Jun 2021 15:07:47 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id e20so11740612pgg.0
 for <wireguard@lists.zx2c4.com>; Tue, 15 Jun 2021 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+VoNuBs7pA5OvFKEJh9w0iPAbIGtlou9/p2L3hmsFEI=;
 b=uMRsgAIQprXfxmV4ii6iGHHWFSMoMdD6H6PgkRZp1yiMaspEGCpgooJGAIE1qsOuEF
 rj+/V4jn8DJF9YsK5GyJtbufK/4OHffByIPJZn/DVk2VqRkfcRCEA4OvshNdwjhPcFBs
 OiWQ2H7MEU+As8L0mGXTdCStn9W3A3eu1mWhsfydscTBL7qtcrGosh6Ivr7GHsAmGd4J
 B2NqDdD5MFeeihMa1y10QwG90td432zA13zCn3vCgro4MLM/de/2hFHleH/+zQehbgHq
 MNRi/MBInPRN3p5G80wjkogDI9lII+A1A5aI+c0HaCLCk6gQr/JMUPqJh+r0SeEgSFVY
 /kQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+VoNuBs7pA5OvFKEJh9w0iPAbIGtlou9/p2L3hmsFEI=;
 b=FM6QCT7PlAC9BZ8EWcPso9CEJkui+m4K7RoB8vQIyAaN3150/DzaO7H7SgZtFPzApt
 I1GNpXKkfmmSZB58rq+5SMz7RF2aldtbeCVG5TnEovnXXzhI6h4T4B+PAQmIOVEFCyMN
 r88GuzszrJi4idb1UpA50jbuSAnjm8lgeLkKQWXEwo4eEk83dYTzZ55HOZkA9UX0ddw+
 sa+xs6k9C0VXkoawt6oPD1H/d7IjvVodiVL6iAXsqEowpxps3ZcsuwT5Y+2bYOG5IFaA
 0Jr0LxYfcx+lSnQZR2ax5W2iT0OjKtRw/EMzHl8JBbNavAGFEVhu/7t8P+ujMP0cFoo4
 aZiA==
X-Gm-Message-State: AOAM531EexPYPpMlPmdLzujrHImUsOKmyEMAOC3r2SBHbI9zne9KGiG6
 PjxTbrHpYptzJ+sb4KVGoI2zcJL7bw7FXxdL0DY=
X-Google-Smtp-Source: ABdhPJwowXnpGjLyTUqh0yPpNkY++4SyNtWZuY8EA5nCgyvxYO8IVfWCqgkz4GXWBCa7HD3jmFknAWY9STWdbJN2QXU=
X-Received: by 2002:a65:6445:: with SMTP id s5mr22540390pgv.109.1623769665442; 
 Tue, 15 Jun 2021 08:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <CADTMz0Kfxc3pQAM=KNstz-dZeHfYDWeqz360pPZLC1RvrW6+pw@mail.gmail.com>
 <CAHmME9qKqGkBp=JjQa0JdQGYa-YSZjdKADZ7k7KwZa1E4+FOOA@mail.gmail.com>
 <B86BC46E-BBD1-4C0F-9193-7E6F31513E69@lonnie.abelbeck.com>
In-Reply-To: <B86BC46E-BBD1-4C0F-9193-7E6F31513E69@lonnie.abelbeck.com>
From: Christian McDonald <rcmcdonald91@gmail.com>
Date: Tue, 15 Jun 2021 11:07:33 -0400
Message-ID: <CADTMz0++zot3+g2qeGG92ouCjE6UpkHryugZ+xJDzfVqzTYhTw@mail.gmail.com>
Subject: Re: wg syncconf (and setconf) error when one or more endpoints is
 unresolvable
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Lonnie,

Thanks for the quick response and the trivial fix! This is perfect

Best,
Christian

On Tue, Jun 15, 2021 at 9:24 AM Lonnie Abelbeck
<lists@lonnie.abelbeck.com> wrote:
>
>
> > On Jun 15, 2021, at 5:52 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > This is intended behavior. DNS resolution happens at config parsing time.
>
> Christian,
>
> While I appreciate Jason's strict DNS requirement, for the last 2.5 years our project has implemented a trivial patch [1] to ignore endpoint DNS failure.  On a DNS failure, essentially ignoring the (optional) Endpoint= dns-hostname peer entry.
>
> This has worked well for our use case.  WireGuard always starts.
>
> Lonnie
>
> [1] Ignore endpoint DNS failure
> https://github.com/astlinux-project/astlinux/blob/master/package/wireguard-tools/wireguard-tools-0001-ignore-endpoint-dns-failure.patch
>


-- 
R. Christian McDonald
E: rcmcdonald91@gmail.com
