Return-Path: <SRS0=LfNZ=6Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0C5C47255
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 06:26:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 780C820708
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 06:26:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="EQeQxDMf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 780C820708
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34c5d25e;
	Mon, 11 May 2020 06:12:18 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 50f65810
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 06:12:16 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a0fd91e
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 06:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=uYHCW+8GUVTTDnx/OVX7CsjSMWI=; b=EQeQxD
 Mfg9tg2aVqxL3CWi3/b1CkjxRjmLzDnjh5pfbcAD7jMfNI6zN4y8pE890dyvAD2T
 vQ9pWqzResbW0vjm8I5Dq7uepzY5iSuTA13icHjHjeUypI4TJp5ZEAIOH9/xZwr5
 JpCLGzJPCzh95L8c+MvqV7jtev9S7gOjPmwsV+xQNRKI2BAGRhfJI3TNR+4V1KFG
 E1IFfZYZPJ0uJsiotDx0Ly3MJe8DRCoB94WxzudowQUKWyGUo55123FR8cWCEKVD
 33IW7TC5B/J3FLkoJ+IsU4hyDHPFHoiKNDWqFSSDTXElogDUqlpR7dYgJS+ThL+x
 cQXcSBw4LugJpmaQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 392005b7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 06:12:16 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id q10so7358993ile.0
 for <wireguard@lists.zx2c4.com>; Sun, 10 May 2020 23:25:33 -0700 (PDT)
X-Gm-Message-State: AGi0PuaHSrEVlbXjGXNuBPPMhei3taWGBEAq557jzW46Mo/4EpyeXdug
 Ug41JaJSTyoTn8AlMrY5KKcERRl3cBscQH851/w=
X-Google-Smtp-Source: APiQypLjBpm5v9LCMp6N+/PexwVrto5ZElQNWQ6uiFXfwodvKsKjE4LXVxuXs0qOE8XAJ7LaLQYaAYMfZOrBDMnHGJE=
X-Received: by 2002:a92:d98c:: with SMTP id r12mr15070302iln.224.1589178332617; 
 Sun, 10 May 2020 23:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <f27176e3fc6ede8d04682a9b504df177@rfraile.eu>
In-Reply-To: <f27176e3fc6ede8d04682a9b504df177@rfraile.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 May 2020 00:25:21 -0600
X-Gmail-Original-Message-ID: <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
Message-ID: <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
Subject: Re: Search Domain/DNS Suffix
To: Ricardo Fraile <rfraile@rfraile.eu>
Cc: Simon Rozman <simon@rozman.si>, virtualdxs@gmail.com, 
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

Your wish is my command:

https://lists.zx2c4.com/pipermail/wireguard/2020-May/005415.html

DNS=8.8.8.8,8.8.4.4,mycorp.net
