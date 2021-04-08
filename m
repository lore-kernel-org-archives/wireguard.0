Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C307C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:30:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDB646115B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDB646115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b423a08d;
	Sat, 10 Apr 2021 14:27:32 +0000 (UTC)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ad5473a8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Apr 2021 16:10:23 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 s16-20020a0568301490b02901b83efc84a0so2773274otq.10
 for <wireguard@lists.zx2c4.com>; Thu, 08 Apr 2021 09:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A/V94MPcmgB8OZ6LImbCA+uEP2l9ZKfdlX+v2UiJmxM=;
 b=gHEa0UrmqrCU7GDp8T6NcbF+I2wQ3P+TGDdDbm+P7MZcnARMuwNVWB+qtCLqRg3ZUC
 qE/8TGkt+7tXOAO99OlgH4UPPIuuFxaWLHUMpyqlFGPZIxf36Lm40UxaetO81NJSakEq
 a1J1NgI766RlW8d98rK1fM4ooYVsMghzxKnoz+t/IO61/9DXmTXuWNEO5fIS8aDOvlVj
 qt4ThyBDXwpj83B8k4N1QW+G/phbvuM5cV9CJImrhGGqq1wiMwMLg8yXDdCwBLl9hRpC
 +yfTkz9I0Sj+HSWOBmmvFyYPnLbMW8AnKMVwv5WRS+3Zo9Ae4Nfa1PLDRmEzbkx+xXys
 7X7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A/V94MPcmgB8OZ6LImbCA+uEP2l9ZKfdlX+v2UiJmxM=;
 b=Yp07SG+czjTgpA6AVHhnkORJd1xyv6tu0L8hKVipNy4u1P6+6hOXxUp/YIQ66i7wnN
 pNsWWnHKnbm1T7rWc+gqP5fHg8kt3VrV8TFJED91j9nX8oGJtFwhAFTbDmmLplame9Sr
 O4DRcjceGZLrL3cg7Epgn06ke3oKxFBAecVuoB3s4G39YTArh9pZFL4ZZ90cUGCliFHt
 m4CQf9tbSj44gfDhhe/ywyCB4T5cxKSrF/pRF0nRLiOlzMKTo6GJVEr0PWC7tBGUGpC2
 wRl8zicLe9N/tBAAOaI0a/J1eQVI1gE0l4bKKgi2eC5Z3pXmaiROo5+6g+U98Wrspr/Y
 9zmQ==
X-Gm-Message-State: AOAM532nLJfZ3MKk8RLwVUKntfo2dWdE2v9vU25yDTeY8Ddd13BWfMky
 QucKIE42RqUmb9icoCWtG9xevpR3vAgipMMYHPc=
X-Google-Smtp-Source: ABdhPJxoGSqLXpWPl/t/SIzH+txaboZP+3uRDf9rDbPAY8sb1aCLMm1Lzld+hU4LVoaPe74hLJgazxcVZfKiDUQ8uek=
X-Received: by 2002:a9d:7481:: with SMTP id t1mr8438173otk.208.1617898222061; 
 Thu, 08 Apr 2021 09:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <e166447dac58ecaa73bf3f6a2b9bece6a01bf5cd.camel@infradead.org>
 <CAHmME9q-qw=sCxz6Fije+ENQTY2-GdS4bZLSakuh+6Eze4LR3w@mail.gmail.com>
 <CAOw_LSEasJuHDPXGkVQnYh_aHd+nOY53D0LRUXuH+pN45ynz2w@mail.gmail.com>
 <5D336E0F-1A42-4692-8597-6A035C4FA699@infradead.org>
In-Reply-To: <5D336E0F-1A42-4692-8597-6A035C4FA699@infradead.org>
From: Daniel Lenski <dlenski@gmail.com>
Date: Thu, 8 Apr 2021 09:09:46 -0700
Message-ID: <CAOw_LSF_8x6zyDuus0dyJRnSADmf1DSPWjOBsN2-ddp+eTpUrg@mail.gmail.com>
Subject: Re: Duplicate IP address, and permissions problems on Windows
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 10 Apr 2021 14:27:25 +0000
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

On Thu, Apr 8, 2021 at 1:46 AM David Woodhouse <dwmw2@infradead.org> wrote:
> Unless netsh will do it for us when we ask *it* to set the IP address? Op=
enConnect doesn't normally bother itself with administrivia like setting IP=
 addresses; its job is to pass packets.

I'm afraid not. I tried playing around with various documented and
undocumented options to netsh, and did not found a way to get it to
set an IP address which is a duplicate of another adapter's address.
That's puzzling since it IS POSSIBLE to set a duplicate IP address
(conflicting with a down adapter) via the Control Panel GUI.

I gave up and asked for any hints on StackExchange:
https://serverfault.com/questions/1059221/using-netsh-interface-ip-set-addr=
ess-to-override-another-adapters-address

> I preserved it in the first cut of Wintun support because the existing vp=
nc-script for Windows actually depends on it... but purely for waiting for =
the interface to come up. Can we ditch that, let the script set the address=
 for us, and forget we ever saw that O(n=C2=B2) code because netsh handles =
the conflicting interfaces for us?

One way we could move this IP-reclaiming code out of OpenConnect
itself would be to make the script do it. However, this would still be
an O(n^2) loop, and it would involve parsing the text output of netsh
or similar=E2=80=A6 which will get pretty ugly very fast.

(Either that or someone figures out a/the magical option that allows
netsh to handle this itself.)
