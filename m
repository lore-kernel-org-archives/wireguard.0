Return-Path: <SRS0=PSWY=GK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC15C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 18:58:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E0ED23406
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 18:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E0ED23406
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36651c7c;
	Thu, 7 Jan 2021 18:58:52 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [167.71.246.149])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0e85fe31
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jan 2021 18:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1610045925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GybwxZ+fcAnRK5WulINfCV4XXDp0aYjZeXNFQAJLYRs=;
 b=qBWdrHy/pqEDItDiulyv/cE0j1V+9oJwlPpNk1aSL1VS22bo/HiI/PvhS9pQCBmg7M0+BA
 YP0bHnTfe2rmEXmujjGdOPPYSo5m1QS2tkhyQZnDh7qaeotXyrtAGgCUUmdlNTKUuVqJhO
 ydsvFjKk7K3f7PM0UNVhNaD4e+R6g1k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f62752a4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jan 2021 18:58:45 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id k78so7027794ybf.12
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jan 2021 10:58:45 -0800 (PST)
X-Gm-Message-State: AOAM530JGzHXyqZYcpSXVrMW2lD/231c0VL8b2PULD8hWI0QMDfVETJL
 hs4/FPM4vR0wP0rDrLuJvvAId3Wjrd11tebxe4E=
X-Google-Smtp-Source: ABdhPJwhBfJ3hWsQL86YkKnwk7CHJ23AsoeRZ6fhcxtZbphLdGIhRwhZwhodN2wDszFYsbGTJ42uY0BzfceOycyHrys=
X-Received: by 2002:a25:880a:: with SMTP id c10mr299404ybl.456.1610045924718; 
 Thu, 07 Jan 2021 10:58:44 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <68452c93-de95-aaa6-3cac-d868a202ea6f@linux.ibm.com>
In-Reply-To: <68452c93-de95-aaa6-3cac-d868a202ea6f@linux.ibm.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 7 Jan 2021 19:58:33 +0100
X-Gmail-Original-Message-ID: <CAHmME9pHRZqTXCiQT+LRRs7vFq8ARL7wq_g_HpbVToxrxHvpeg@mail.gmail.com>
Message-ID: <CAHmME9pHRZqTXCiQT+LRRs7vFq8ARL7wq_g_HpbVToxrxHvpeg@mail.gmail.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
To: Julian Wiedmann <jwi@linux.ibm.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Kees Cook <keescook@google.com>, 
 Netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eric Dumazet <edumazet@google.com>
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

On Thu, Jan 7, 2021 at 6:02 PM Julian Wiedmann <jwi@linux.ibm.com> wrote:
>
> On 21.12.20 12:23, Jason A. Donenfeld wrote:
> > Hi Dmitry,
> >
>
> ...
>
> > fall on the border of a mapping? Is UBSAN non-deterministic as an
> > optimization? Or is there actually some mysterious UaF happening with
> > my usage of skbs that I shouldn't overlook?
> >
>
> One oddity is that wg_xmit() returns negative errnos, rather than a
> netdev_tx_t (ie. NETDEV_TX_OK or NETDEV_TX_BUSY).
>
> Any chance that the stack mis-interprets one of those custom errnos
> as NETDEV_TX_BUSY, and thus believes that it still owns the skb?

The stack trace shows the splat happening as a result of
__skb_queue_tail, called from wg_xmit, not something that happens
after wg_xmit returns.
