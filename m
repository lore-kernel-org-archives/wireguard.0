Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB271C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 12:21:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3503323AC6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 12:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3503323AC6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d2e5753;
	Sat, 19 Dec 2020 12:13:02 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 329762c1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 12:13:00 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc4ab51a
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 12:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=BCQgW09qlAztgQAJ3VxlLDh4x8Q=; b=TC5CV+
 6f2TcrdSdg9WNiWl2VwMrrEN+bpf9qw+/GF0DKs0P1ojP9NWnlhqPWMQbQFT6hQF
 boV866ehSqiVERTdIvOJYqt4Nme7Ib5CgbiHrkp6FxBczuxUG7scJ7KlOKZyceTg
 qrB4ij5VONe8mzi1R6aq3v7l6uPk2i2EnJRdANfrN5Z+L2gxkHKU+AKhZZS9ZbhF
 HbiHJ/y5XF9UdK3qEhI+9uvaFra2L6ogSmhse9dOxlm77XOa4iaPWydf4iTqoKtP
 7l1zEMjqG9UHAYxUeExPWtUcBSm5SZnjkkinGF/h5B9ynytO9YdCvLfgz3a8rysg
 FXWsAo/XHtmbNPRA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e0d14839
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 12:13:46 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id d37so4509838ybi.4
 for <wireguard@lists.zx2c4.com>; Sat, 19 Dec 2020 04:21:46 -0800 (PST)
X-Gm-Message-State: AOAM530uKvhDOT5q0IqYkWO6BzxJsRZYbDaPj9ptLAN+sfYn9TIGGTWR
 VlR9H2ChH8bMrAfSn+1L14c59HWXBfkjZbknX5w=
X-Google-Smtp-Source: ABdhPJxlzViRt2nfiofrGB+KMGlMnSWeewycscctLZWF+HFAxLmchcaQqjv95RwnTp8VzlyIrr4rnlsH8WhsFGPGrHM=
X-Received: by 2002:a25:2cd6:: with SMTP id
 s205mr11674944ybs.279.1608380505981; 
 Sat, 19 Dec 2020 04:21:45 -0800 (PST)
MIME-Version: 1.0
References: <CAF-5T9H9wiZZ7qT_r5PYhj0q6cHogdjXQx38PDQ3QXXm3SftJg@mail.gmail.com>
In-Reply-To: <CAF-5T9H9wiZZ7qT_r5PYhj0q6cHogdjXQx38PDQ3QXXm3SftJg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 19 Dec 2020 13:21:35 +0100
X-Gmail-Original-Message-ID: <CAHmME9p6U_11+caCpxtaQd=b8OhGf51sW+CH1fRDpALNcyM4MQ@mail.gmail.com>
Message-ID: <CAHmME9p6U_11+caCpxtaQd=b8OhGf51sW+CH1fRDpALNcyM4MQ@mail.gmail.com>
Subject: Re: Default route on windows
To: Ronan Lucio <ronanlucio@gmail.com>
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

Add 0.0.0.0/0 to your AllowedIPs.
