Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB575F483D7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2026 18:50:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 722b66ff;
	Mon, 23 Mar 2026 18:48:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ac5b7570
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2026 18:48:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 70BD7419C7
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 18:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1427BC2BC87
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 18:48:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CqSalhXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1774291688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iG92H0aFfTuwTM1GnMWr4f3k+dLkc/hY4zuLTd1Etpk=;
 b=CqSalhXlVKXfFjz9ZTBRiMJxHEHCXDSWY4BNOYYnx6kiuGRnjH1VgCdexjq7HL6N5251a2
 4ezzRzrGNQQz2jzVn13hB9VnAkeRpX9X/RPAPB8+J4BcEa1jUd9KdJ+cWwj4k/e6M2LNgy
 VFfD7km2mcz4+iU8lDXuDcTSCuSucCY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b35b4b41
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2026 18:48:08 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-40946982a78so1377671fac.2
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 11:48:07 -0700 (PDT)
X-Gm-Message-State: AOJu0YyRLDVzDWDSBFlBBvYHNs8B/Wx9NM+Ckc1DwUG0zKJFbuclDj5G
 8fKgkYRXGWJQE/ZkzI08CjDNhC05kYE3JbvG7BD8CHFrxsRVmGZ9aVtE0tkAitBE8DIA+5zUQR9
 MZuyy4wFo4+9HPjyNZCQ8pkG4pY/X76E=
X-Received: by 2002:a05:6871:3403:b0:417:3260:8586 with SMTP id
 586e51a60fabf-41c111fb1a3mr9052032fac.34.1774291687216; Mon, 23 Mar 2026
 11:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9q4gC3Ag4hW0ERTkZNi6VMv1-qMExO6+OfOKYZ5rC4mgg@mail.gmail.com>
 <CAH8yC8k1R2L2Wp-oQDyn3L14k0xQwg_jW6oYY+-cOPv9rT0EYg@mail.gmail.com>
 <CAHmME9qKp9tNG9WJZJioLJuhSHEg8rbWoT+5Fa5P0iv334pRKw@mail.gmail.com>
In-Reply-To: <CAHmME9qKp9tNG9WJZJioLJuhSHEg8rbWoT+5Fa5P0iv334pRKw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Mar 2026 19:47:56 +0100
X-Gmail-Original-Message-ID: <CAHmME9qdA_sLKjg-uh_fbWhjfiumDScwKN97R6ikZ7qQ45cxBQ@mail.gmail.com>
X-Gm-Features: AQROBzCfc4K1H1-rcksBrGRDy71agde2f7IUVC11IOBY38pVw9M5m_qqBZSZSiw
Message-ID: <CAHmME9qdA_sLKjg-uh_fbWhjfiumDScwKN97R6ikZ7qQ45cxBQ@mail.gmail.com>
Subject: Re: Sunsetting support for old Windows versions
To: noloader@gmail.com
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Simon Rozman <simon@rozman.si>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Mar 23, 2026 at 7:38=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
>
> On Mon, Mar 23, 2026 at 7:34=E2=80=AFPM Jeffrey Walton <noloader@gmail.co=
m> wrote:
> > WIndows 7 market share dropped to around 1% in January 2026.  I think i=
t is a good decision.  Confer, <https://gs.statcounter.com/os-version-marke=
t-share/windows/desktop/worldwide>.
>
> What do you suppose accounts for that December->January change? Some
> large operator enabled a TLS configuration not supported by the OS /
> by Chrome 109?

Ahh, the reason is that Server 2008R2 ESU ended January 13, 2026, and
enterprising users, god bless them, had previously hacked the update
mechanism on 7 to get those updates.
