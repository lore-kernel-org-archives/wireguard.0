Return-Path: <SRS0=RmRV=3X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF5CC3F68F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 20:25:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B69AD2087E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 20:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="DuoZOvfR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B69AD2087E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c69ad65;
	Mon, 3 Feb 2020 20:24:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d25b3a0
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 20:24:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8be662fb
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 20:24:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd182852
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=n10J7S+AOGTmDvM08pKinjPzH+0=; b=DuoZOv
 fR92bsTay3DgDOpyf0jXMaY67OD/cq3PkTJsMgqmYYrRJAgj2mN3wP49Ih0fiES/
 NhfVzZ0IfvN2mDPgjZfk7u6SJAQFXT1ZhUCimNcFizc67vzVAXWJ28g0M8XtdN5J
 P1uX0ECF1KNbBNOXE6qxomHpDiyb7dpyMVqFTLZTzgc33I812Kn8kDU4sT+tRFbf
 Kz6ZAHqLDRQmDzERNaGBQhPUbvSaB41Yg9vM7W8QW2UCHojPLogWzQeXXBAYXb9R
 fyuxZcqmAwEoiBiSD66TymAXZCbpkUy7Q26TK1VMXY6B/+moAA7PzhIPZ2IO5omI
 oM5cWSGf26RTTO+A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8674b58e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 20:24:27 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id a22so16023891oid.13
 for <wireguard@lists.zx2c4.com>; Mon, 03 Feb 2020 12:25:10 -0800 (PST)
X-Gm-Message-State: APjAAAXw5VLUgsWiEt80r9rf54ITXyUcjojqe1NcTzAiMhrIcM6Nr4gj
 59WVdXNemMWVYeQRNZA6lL7WttYUbpf/ITv+mak=
X-Google-Smtp-Source: APXvYqwstmCx6NDTmNXty+nOFS0LtivgqcnUmYH0S+j4J1xxMHQIG+1MPE5dF5AETVuOds6I/s5hkfLHzX8gXHxYqUA=
X-Received: by 2002:a05:6808:4cc:: with SMTP id
 a12mr588645oie.115.1580761509902; 
 Mon, 03 Feb 2020 12:25:09 -0800 (PST)
MIME-Version: 1.0
References: <000000000000f8bfe8059db01519@google.com>
In-Reply-To: <000000000000f8bfe8059db01519@google.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 Feb 2020 21:24:57 +0100
X-Gmail-Original-Message-ID: <CAHmME9oVLWp_JcWzOm_OWqFOs+C=wj1kp7g=UnHANmrKHRbUsw@mail.gmail.com>
Message-ID: <CAHmME9oVLWp_JcWzOm_OWqFOs+C=wj1kp7g=UnHANmrKHRbUsw@mail.gmail.com>
Subject: Re: possible deadlock in wg_noise_handshake_create_initiation
To: syzbot <syzbot+d5bc560aaa1cedefffd5@syzkaller.appspotmail.com>
Cc: Netdev <netdev@vger.kernel.org>, syzkaller-bugs@googlegroups.com,
 David Miller <davem@davemloft.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Feb 3, 2020 at 7:28 PM syzbot
<syzbot+d5bc560aaa1cedefffd5@syzkaller.appspotmail.com> wrote:
> syzbot found the following crash on:

Thanks, fixing.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
