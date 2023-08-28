Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB55FC83F12
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 28 Aug 2023 15:44:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba445d02;
	Mon, 28 Aug 2023 15:41:03 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f9099f15
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Aug 2023 15:41:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52a3ec08d93so4448907a12.2
 for <wireguard@lists.zx2c4.com>; Mon, 28 Aug 2023 08:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=krose.org; s=google; t=1693237259; x=1693842059;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zARob631HDu4vo9he63BDoIZlN3GRJv3Tzyt1ZZONg8=;
 b=UC0MudefTilk1Q4R3UHc3P5O91ry8kq+IMtwrS1IPShiOaF0hdTa8ePU5AvQ2YH/QF
 /s/WE3KRuCbtQIE/2rcybuUBokQR8AdwaN9g7FzOyfqJyJwZrJg32xfyDWXbSZF2oTeW
 EGgfa8XDN4xE8K6r8yJAiI7UThSoyx7ATDzYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693237259; x=1693842059;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zARob631HDu4vo9he63BDoIZlN3GRJv3Tzyt1ZZONg8=;
 b=EUyVn7sUDaM+gySTV6DfXoTqST1JZ0WbIWBnsyIQgvdyD3ltDYx8RQqOCbnalek1rd
 kPn6whnnLjVZ28PfQZ5Kwpme1VeIiuJK/MFLQXnnGblzteIOHo70pfJX7WLMMDFHZdGl
 tUWz9hClR5BjU1WJQVoZhwBEfE2if/8yT/7ooQ2oMi53kF/MFRQoliXLvTgc/t/0cn01
 eUaMytIavEAfXmSld0OaSuf5l96CChrvM2N2j4MPdxkIEpOE+YHoqcKDm01ztD9LRaGK
 aBa9YRGOUmu1hvf/przsGOnodXuxXkOpzrZLZPP08yVKbQO4aVmjC3D+fRFcmzpWqDSU
 Vlag==
X-Gm-Message-State: AOJu0Ywf+3txMKIuVrkyko8LJR8uroQWwj6iQYhxZVr6aP6XS8hcEEC+
 NQLu8EoSplfFZUYo/OTofQ7qW7O8aFBgOgo5/IJJxD0Xexb0LR0c
X-Google-Smtp-Source: AGHT+IEgC9ZhzfaXVNRbNDAvR+7KXDs4YmDZ/ixPQ2GjWwIxo+IG7AekYmves8mqffYG+MiBortGr4stgsdGZ/Qomf8=
X-Received: by 2002:aa7:c30d:0:b0:522:3a37:a463 with SMTP id
 l13-20020aa7c30d000000b005223a37a463mr19378745edq.20.1693237259594; Mon, 28
 Aug 2023 08:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230819140218.5algu2nfmfostngh@House.clients.dxld.at>
 <4b-64e11f80-13-5e880900@8744214>
 <20230819212357.lkshcpslkgbeaq4e@House.clients.dxld.at>
In-Reply-To: <20230819212357.lkshcpslkgbeaq4e@House.clients.dxld.at>
From: Kyle Rose <krose@krose.org>
Date: Mon, 28 Aug 2023 11:40:48 -0400
Message-ID: <CAJU8_nVR_ohTetKzHoxFH=dYccQg9HdniqV+JKk4LoJGorx0ZA@mail.gmail.com>
Subject: Re: [Babel-users] [RFC] Replace WireGuard AllowedIPs with IP route
 attribute
To: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>
Cc: Steffen Vogel <post@steffenvogel.de>, wireguard@lists.zx2c4.com,
 bird-users@network.cz, babel-users@alioth-lists.debian.net
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

On Sat, Aug 19, 2023 at 5:25=E2=80=AFPM Daniel Gr=C3=B6ber <dxld@darkboxed.=
org> wrote:
> Having read Kyle's use-case I'm thinking my original plan to extend the w=
g
> internal source-address filtering to use a rt lookup with our new attribu=
te
> would not be maximally useful so now my thinking is we should just have a
> boolean toggle to disable it explicitly per device.

If there is interest among the maintainers in eventually merging a
change with a per-interface knob to turn off the source IP check, I
will go through the trouble of putting together an initial pass at
this. I don't want to spend the time if there is firm opposition to
the idea.

Thanks,
Kyle
