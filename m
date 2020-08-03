Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E360C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 11:42:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 955E020738
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 11:42:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="cNuleHfu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 955E020738
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56dda6dc;
	Mon, 3 Aug 2020 11:18:32 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e133806
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 11:18:30 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5d0a2f5
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 11:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=jSnVwBd3vkkS1S/IGi65izF1gp4=; b=cNuleH
 fuo/f4g5HQad3+Tlqer54lAFtTz72ZLNKwxYGks1MFbtsNunGwaeNOF9Hbso5pGM
 WKCRwqMNYRFyvRxyDQ2SXL5VrlDMt90J6c+FlyCb9Q4Q57kdBzPLrWgBx8kQaWi9
 t5pevZGHmF6opQoLUM6TxN6sFybt2RpXN14CJy5o2QZaSaXSxfpIbS/J2NRUvtH+
 TjFy/notbv3anlLRl/EsztLNaRCYolACCTttJn5p6CzWRoD9Fft7SmIzesWE0zVk
 l5aqBufuYQuweqCpGpzwCJlaDGYZcrSAf6Wf9D2qI3czB7MvXmiIp1Dn1jKtB54Y
 kggMz2csz2hp286A==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 71eb155c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 11:18:29 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id k23so38097943iom.10
 for <wireguard@lists.zx2c4.com>; Mon, 03 Aug 2020 04:42:42 -0700 (PDT)
X-Gm-Message-State: AOAM530Ko7SeNds7iLkKD3Te/C9yRCHPlUpXtCFmphFAXcHdwf38icZr
 B7KYDaLCeI100H9aiMY5u7L6dJyBFnNdFFiQbPE=
X-Google-Smtp-Source: ABdhPJw/yvjE/SIlWZPRgZ3btz4fOOtSv1QqH5yIVW3xykAO//aRBSuV88o2iIsDhQ66IYnDPENNYn3fS0eSzWPq1uc=
X-Received: by 2002:a05:6602:150:: with SMTP id
 v16mr16101268iot.80.1596454962207; 
 Mon, 03 Aug 2020 04:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200803102808.GA1402387@zx2c4.com>
 <4FD17BFB-009E-4367-A208-5614EC3FAC02@knockaert.nl>
In-Reply-To: <4FD17BFB-009E-4367-A208-5614EC3FAC02@knockaert.nl>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 Aug 2020 13:42:31 +0200
X-Gmail-Original-Message-ID: <CAHmME9osZQrxe4VMXXVPxz-O50nxiSq5xkPNDMEBYgJZ07rGUg@mail.gmail.com>
Message-ID: <CAHmME9osZQrxe4VMXXVPxz-O50nxiSq5xkPNDMEBYgJZ07rGUg@mail.gmail.com>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
To: Jasper Knockaert <jasper@knockaert.nl>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, unit193@ubuntu.com, 
 Andy Whitcroft <apw@canonical.com>
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

On Mon, Aug 3, 2020 at 12:36 PM Jasper Knockaert <jasper@knockaert.nl> wrote:
> Well, I think there is a case to manually install wireguard-tools where
> you want to run wireguard in a container. In that case you may want to
> install wireguard-dkms on the host (in case its kernel doesn't yet
> support wireguard), and wireguard-tools in the container.

That's a good point. There are all sorts of unusual cases where one
_might_ want to select individual packages instead of the meta
package. But if you don't know what you're doing, `sudo apt install
wireguard` is the mnemonic most people probably want. And for the
purposes of transitioning away from the PPA, that probably has the
least friction. But you're right: containerization is one instance in
which the meta package might not be desired.
