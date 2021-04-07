Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B18AC43460
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:30:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDBA5610A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDBA5610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d9e1dc3;
	Sat, 10 Apr 2021 14:27:31 +0000 (UTC)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7e59c363
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Apr 2021 23:16:22 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id m13so206508oiw.13
 for <wireguard@lists.zx2c4.com>; Wed, 07 Apr 2021 16:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lO7BmywneQmRVVlT5P3lCPZ7ZgctVRqNZ1oB9DXwYMM=;
 b=WO0bGmGPmiwEYZZc2gPlKzcsqQU99rQSihzZEI5MVrn+Gq4Vno6WjHZCEB2gztG4ED
 lsUHSXVhgv8Ahv13gL0aRmY5DdMwgTX3X0iiwH306XLB81r968PxgBhk/rmf/QHpP3yv
 FJ8kMmBJfjZDV3nYzjZMQgMqm+vFbKtLxg0t/FaSdf3U+sp33oLAyFoR4aM3rGw9v/gT
 DE+nwZkji6LFegaU6PVJkXcUNri9P/trbarcvu/IbTV75eIz1XbPxXeuHrrvA7/titCI
 X6rhJCUPDp+nJn6pwnGUCudKQNwWwwme/wF1W09OxWTB1Gk7DB9r3IL4NvliShkMij5o
 sbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lO7BmywneQmRVVlT5P3lCPZ7ZgctVRqNZ1oB9DXwYMM=;
 b=b/A5aUeIdlWAO4CHNJeWZZ2Wo+YfjeQwxxO9Z1NoyCrrj83Y6dIUtMM25rtOoYzG1i
 bf7jjm+nnws3EETXvktu8P8B6mzrVY5TUSYAXdvgZ05NZkZ3QbGNBMaRUrTIL6qRvHXG
 JCDDMmfTo5fmcJPS4YY1bFcn5VTMY9UY/XXqtTqUGFMGoTUnoFW0sRaQoI9J0Do7VLBC
 wHSTdea7MuRtKoXlFuLJwiRsH3XVm37wy2wpYywuVNO9bnjNLimFbbUn7yGHAJr9i5gz
 ZaQLb8ozKKl4JSu5yyNDnNwTSm7+IDTrKD5qyjWij3S6uPQp1vyOjjFMa+BdstbyZORY
 Cewg==
X-Gm-Message-State: AOAM533jE8bYQAEoIgA/y0LLUO5OKlkBzzHsGJFcWf5J8Tjf8M83RnsN
 pHtm/2xu05+ygO/anug3cWMSXrG/Qab0n9dazH0=
X-Google-Smtp-Source: ABdhPJxXLG8EEjLdmSfyVMJHTRyCRteut5+agbpVxCNs3BGDsy0EHsA0sz1aHHPbsSyN8FL3HvUErepGziMQkPSYrFI=
X-Received: by 2002:aca:a8cd:: with SMTP id r196mr4052109oie.108.1617837381250; 
 Wed, 07 Apr 2021 16:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <6e259ab359c7f93f8f1119df0ba7b285cd4f53d1.camel@infradead.org>
In-Reply-To: <6e259ab359c7f93f8f1119df0ba7b285cd4f53d1.camel@infradead.org>
From: Daniel Lenski <dlenski@gmail.com>
Date: Wed, 7 Apr 2021 16:15:45 -0700
Message-ID: <CAOw_LSHa5aERnm8etcBywJV4QmW_9BesXvBYSvjKPVZ=a+whXg@mail.gmail.com>
Subject: Re: Allowing space for packet headers in Wintun Tx/Rx
To: David Woodhouse <dwmw2@infradead.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Wed, Apr 7, 2021 at 4:49 AM David Woodhouse <dwmw2@infradead.org> wrote:
> If WintunSendPacket took an additional 'offset' argument to disregard a
> certain number of bytes at the beginning of the buffer, that would
> probably suffice. Or is it possible to simply add to the pointer
> returned by WintunAllocateSendPacket()?

To expand on this possibility a little bit, I had proposed kludging a
=E2=80=9Cshift=E2=80=9D into the allocation for the outgoing packet:

    /* Always use this instead for an outgoing packet, instead of
     * malloc(sizeof(struct pkt) + payload_len */
    BYTE *tun_pkt =3D WintunAllocateSendPacket(
        vpninfo->wintun_session,
        paylod_len                 /* packet payload size */
        + sizeof(struct pkt)     /* OpenConnect's internal packet header si=
ze */
    );

    /* Then after we build and populate the outgoing packet, just tell
     * Wintun to send from an offset that's NOT at the beginning of the
     * buffer it allocated for us. No memcpy! */
    WintunSendPacket(vpninfo->wintun_session, tun_pkt + sizeof(struct pkt))=
;

The concern here is that Wintun may not have been written with this
possibility in mind, and might not always like sending from an address
other than the exact start of a buffer it's allocated for us.

Thanks,
Dan
