Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4106BC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 19:58:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BB1661168
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 19:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BB1661168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e457c04;
	Wed, 22 Sep 2021 19:58:28 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id edb4c34c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 19:58:25 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id q68so3875064pga.9
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 12:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=D5J/Jh1t1DZ+/TIfPFTz0kFM04x13zJxzZAkRj6baAQ=;
 b=fCArcACjwadz4bD92W/CjUTqB17eGuSZ5CL4isi7rKwDd+XEQANt4kRhFlgZOFVQq0
 T5JnGwlUuaCrpVIOpCAJ0Tct3WXTLZF2P9DgYacHYVioQ9KhLCdsEABKkxFCzNkMHCLT
 dQ1/9Zv/RScxnzgGKItxEUOihsROfwQa2j1jo69+/Yb/0QI/N7C49Wvmf0o7vgncWlLI
 bvGtA3Ar0hrPlDefYO9RPKG+2zjOCRhDgz0AtKGvDHorXvtmmM0ErkDozUl/t+hsbmva
 CUWXCeDv11uAyagCD2pr3/fHXOdkgrqSPsMB6ZOy4e+uH9RdE/Ftbl01mboZnwdqavjt
 lYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=D5J/Jh1t1DZ+/TIfPFTz0kFM04x13zJxzZAkRj6baAQ=;
 b=nth2W50eS7Tt4TXOaP0eijXMU7w6gs/xVE9ioPHcnTHfHgBV2xqMW/fWFTqOJVZ4/x
 S0CHs6tOvReZXLeW3xJcacHuxptm//F6expUZSDNzE+MVHw6W8lvnn/zuAPY+K1NWZzw
 1BRA8EwlRLwEWfH+jfWtvFNa4N5NOimvFlwBbZouaVQgluyW+Q/UOF7IY17JbRw0/wqq
 hYqStcgyqoRkPW434AFubPwB/JgTswDNe/9J8ooBaN23/lIOtnhZ9SPSXd+acYQQTk7X
 u6+Sc92IaiVZ9Wie9Ofma8MO6TkaG07mkeepdgRXAQP9x7Z3ZoMdmVmOXL2zm3BXlwo1
 TfTg==
X-Gm-Message-State: AOAM531Qy2BDVxy9mjmxdUMsI7MkOEGhoSphesi8RLKhnf9QpeKAqRky
 rdRf12G1ga0P0iCO3skgtTNOojR1wmgMbCl9/44=
X-Google-Smtp-Source: ABdhPJxbo5uElPshe3g8Bbl24M/Ld3zAJpjRZaTl3l6M3MhXQ//V39eo6+83pGoKMJt/4zkCPU1zdg7IfIcgKmuQDEE=
X-Received: by 2002:a63:b046:: with SMTP id z6mr655615pgo.106.1632340703559;
 Wed, 22 Sep 2021 12:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
In-Reply-To: <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Wed, 22 Sep 2021 15:58:01 -0400
Message-ID: <CAH8yC8mG6TR76jJOh5fiz7hgCPEkxAZDqGM3L5DTEkwRMU8xpw@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, Sep 22, 2021 at 3:31 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi all,
>
> I've got a new build submitted to the App Store, and so now we wait
> for Apple's review.
>
> I do not understand the root cause or how it might resolve itself yet,
> because I haven't been able to reproduce. But I've removed the
> ridiculous code that deletes network profiles when the keychain can't
> be opened. My hope is that the open failure is transient, and so this
> fix will be sufficient to unwedge it. I guess we'll see...

I recall reading a report last night... An app lost access to its
keychain items after an iOS 15 upgrade. The workaround was to "Enable
iCloud Keychain".

I don't think that's a good idea, however. You don't want your secrets
leaving your security boundary and moving to Apple's cloud. In fact, I
stopped using Apple devices back around iOS 6 when Apple integrated
the keychain into their cloud services.

Jeff
