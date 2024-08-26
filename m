Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B341C5321E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2024 09:02:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc4c5489;
	Mon, 26 Aug 2024 09:02:33 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 42966041
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2024 09:02:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 41DF3A41FA2
 for <wireguard@lists.zx2c4.com>; Mon, 26 Aug 2024 09:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A0BC8CDE4
 for <wireguard@lists.zx2c4.com>; Mon, 26 Aug 2024 08:53:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="am3MrvMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1724662387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XOBQan2cuNo6sGXmvgjC+/q8rVqIlsdMv/QxNWiA1G8=;
 b=am3MrvMdq8qxMJfHUtgphuU5c6APwwYrJwnG/9251NqxjdY8PPDfonn1LDaf0kwIJYOF5n
 CbR83cP1w8RMGuw/RzI7TuMhjMEqUD0tEXhMoEG/ZYqjj9ou964VGr+Annp5O2NmV/OYp2
 KaxaUL7sf7gVJOng1UjvkpXmF3YkpRg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b08030e2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2024 08:53:07 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5d5b986a806so2838933eaf.1
 for <wireguard@lists.zx2c4.com>; Mon, 26 Aug 2024 01:53:07 -0700 (PDT)
X-Gm-Message-State: AOJu0YzBF6zZdjHcwvJGl8l9TE/jJ7y4TX7vWSVkqToM2SirKAf5WZWR
 bthl05A/iVD1NveH+7Fs53jx3YYk1nw9J1UBSBpKzM3CpaXy/sP8RDNRRUhFJVHNAivFbf3qv9+
 4g8YYLUEVvBKEeS+TZUWpWyUGW/Q=
X-Google-Smtp-Source: AGHT+IGUjyTRZheZ9uvjk/Ou6UPBfVyDXUJ/j04LEQn2i7lzPHoRJeMmUV4Ydz1asJvxBXktvtrVYdCDMvN+OecEw4A=
X-Received: by 2002:a05:6871:8a8:b0:268:282b:bdec with SMTP id
 586e51a60fabf-273c8d8bc9fmr5558655fac.8.1724662386532; Mon, 26 Aug 2024
 01:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <610ED0E6-95D0-4D54-AD9A-8BF0AD8D25E9@03s.net>
In-Reply-To: <610ED0E6-95D0-4D54-AD9A-8BF0AD8D25E9@03s.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 26 Aug 2024 10:52:55 +0200
X-Gmail-Original-Message-ID: <CAHmME9rikm_nXSP85R3hQix++NrrS_TGMBkX50fYjUyqnTRQSA@mail.gmail.com>
Message-ID: <CAHmME9rikm_nXSP85R3hQix++NrrS_TGMBkX50fYjUyqnTRQSA@mail.gmail.com>
Subject: Re: Changed SHA256 of wireguard-go 0.0.20230223 source tarball
To: Adrian Ho <ml+wireguard@03s.net>
Cc: wireguard@lists.zx2c4.com
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

https://lists.zx2c4.com/pipermail/wireguard/2024-August/008466.html
