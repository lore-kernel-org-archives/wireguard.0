Return-Path: <SRS0=i2uS=A7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DE4C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 15:22:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B459722C9D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 15:22:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="g3UZMgFO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B459722C9D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bbf9429;
	Mon, 20 Jul 2020 15:00:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 92f966af
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 15:00:27 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70df5d32
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=e5Y6awX63tyNgrH2fB3s5LtyoAI=; b=g3UZMg
 FOg/RaQFVnQ3FXoKtXiKMDS30APx80qNC1v8kI4tEFed5QT6Jqy1yTikQpQoR5I9
 p2T59WKmAZsYTL2UGgL15OCW5gmyxAJ4fFVGNQ8Xzugn5Ka6u/SoMLwRXB0dIgk/
 9/vwp4H0E5ELhIBPhLXLZrdZikifnr7lHFaEHluGohKdDUszNySPd61J+kIU4U2W
 l/0Wc0r6XIs3dgBlPPLf0IpBccvq6MtwUGXt4PD99jb9Q4Gd9hiQcCfbXp+LtqMv
 botute9l8lxWnNbDlg50IhqVfe7A0FsBI5lYleOBS8fNgmXYZb7156tHTcRBGXJQ
 ZApSUCOw8itbtToA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5cb365f5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 15:00:26 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id i18so13610193ilk.10
 for <wireguard@lists.zx2c4.com>; Mon, 20 Jul 2020 08:22:50 -0700 (PDT)
X-Gm-Message-State: AOAM533eniiVzg/Xrx3oBHawCec3kMa09e+yudlhzM07f0cmF/Fn6aGW
 +C1bQyJifvEKE5jgEYV5JQz/4UiNYit8QQY3g+Q=
X-Google-Smtp-Source: ABdhPJx9foQQRDcjIEP58myFAHs/oeYq6eX5N1WMXPIU51xv1b4DhQG3ER/OXA/xktW2i6pceQLLBUxZ3aj38tJReEg=
X-Received: by 2002:a92:50f:: with SMTP id q15mr24417561ile.38.1595258570259; 
 Mon, 20 Jul 2020 08:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <065501d65ea2$3e652fe0$bb2f8fa0$@lindenberg.one>
 <CAHmME9qr_ZPyhK1V5ENDdNtfk0cn0pb=Ne2T_FEYwaFHtuwWCw@mail.gmail.com>
 <067601d65ea7$1b71a3b0$5254eb10$@lindenberg.one>
 <20200720201456.6dfc12df@natsu>
In-Reply-To: <20200720201456.6dfc12df@natsu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 20 Jul 2020 17:22:39 +0200
X-Gmail-Original-Message-ID: <CAHmME9rVQrSZOcPL+7Yrc2NGBuBW+8_UtkQOXp6t93XbFxGdTw@mail.gmail.com>
Message-ID: <CAHmME9rVQrSZOcPL+7Yrc2NGBuBW+8_UtkQOXp6t93XbFxGdTw@mail.gmail.com>
Subject: Re: Wireguard on Ubuntu 18.04.4 (LTS)?
To: Roman Mamedov <rm@romanrm.net>
Cc: Joachim Lindenberg <wireguard@lindenberg.one>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Mon, Jul 20, 2020 at 5:15 PM Roman Mamedov <rm@romanrm.net> wrote:
> Seems like it's available only starting from Ubuntu 19.10:
> https://packages.ubuntu.com/search?keywords=wireguard&searchon=names&suite=all&section=all

It was added to 18.04, actually. See the other email I just sent.
