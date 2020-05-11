Return-Path: <SRS0=LfNZ=6Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8DFC47255
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 21:18:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C87C20661
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 21:18:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhiLXBNi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C87C20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 486fd70d;
	Mon, 11 May 2020 21:04:12 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f582e2e6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 21:04:09 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x73so8777628lfa.2
 for <wireguard@lists.zx2c4.com>; Mon, 11 May 2020 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ULIhGKsXnVN/DmpIJXKWOYJr8FghoDklACAzyPi3rW8=;
 b=hhiLXBNiQWEkfuZ9CNsSJHYyisKx3FiyocrDzNRIX6tiTi3pgo2PG49ORmUV5mMJvB
 4bYLZbKF5VH6CzSdNrrQOo3+tovkxCAxlrzP12XmtcXYdFZgWsd6b7ISNglp1QSTN7LH
 poG/BJWP+xzI4Wl+XFvjzjzJZXs9QzKOqeThMfyxhilU/yQofsSTmkqCJfHHu4xGqeYu
 2FAB0CwwuFxMbcTf/Ps9IGkqLST/rKhL6iUBZ7SMcc/6axoD7VWBDMPrSxmc2NFnSlrB
 yf+YkSZnEthiq9Xe/Zl/q7/8PbWnUGqV5eLmiJZwC+vHR504zW6v20FZtSETnJxesV2X
 pVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ULIhGKsXnVN/DmpIJXKWOYJr8FghoDklACAzyPi3rW8=;
 b=Fzn2Y96eFTndAtDJUkQ5mnQSf8uV2hZzRRPJ1R27di42FT5K4zFJ8e3pt8jCfjTLeM
 9z6I6uyF3o/Xe683UwDRk2xNEBc9HJQH1CfDmWGk+BAeODKpRssg/BLTNIFzBGvGHI9G
 vhmaU0hqPAaIp8OIagBCD0zJcpnYrptoQb6FoT6IRrk798IYvlCu4j7AtgBCAK0rWZgD
 /g+W7oB/b+agXW9iZOMAzxY8sqyczGgT2VcjXIcuhrwu1FgJvkvToo1Jb6iEyAliLtFV
 mSf3t0U2yTvn5ajVa9NIg59IQ5hJMom4qzzEJL4+VudvhU8A7WlSbPQerG4o5JpFSE+g
 HHgw==
X-Gm-Message-State: AOAM532wQqY6Pj7K2XxCbct5E5xURyvp71usMIyHibXX1qpKorlJ2iXF
 mms0DpdgGUGNXH2L8cJQsHUFlXTsKUJQVJrh0J0=
X-Google-Smtp-Source: ABdhPJx66mrZ0wjgHapwYVO92FZ66s68CnIHvbGvefj1eXcTXr/24PaxSY+oXbA6B+AFmP/EK2oIwH1OAZy6EvKTAA0=
X-Received: by 2002:ac2:5046:: with SMTP id a6mr12201966lfm.103.1589231848762; 
 Mon, 11 May 2020 14:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <f27176e3fc6ede8d04682a9b504df177@rfraile.eu>
 <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
In-Reply-To: <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Mon, 11 May 2020 23:16:52 +0200
Message-ID: <CABtXGiAP6SvNrsTArCe2fNLqTUEeBEOy9Osx+uCinfm6q9Yz1Q@mail.gmail.com>
Subject: Re: Search Domain/DNS Suffix
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Ricardo Fraile <rfraile@rfraile.eu>, Simon Rozman <simon@rozman.si>,
 virtualdxs@gmail.com, WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Wireguard site is showing fedora wireguard-tools as up to date. It has
not been released yet, still marked as pending testing

https://bodhi.fedoraproject.org/updates/?packages=wireguard-tools


On Mon, 11 May 2020 at 08:26, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Your wish is my command:
>
> https://lists.zx2c4.com/pipermail/wireguard/2020-May/005415.html
>
> DNS=8.8.8.8,8.8.4.4,mycorp.net



-- 
Use this contact page to send me encrypted messages and files

https://flowcrypt.com/me/phillipmcmahon

P.S. Drowning in email? Try SaneBox and take back control:
http://sanebox.com/t/old3m. I love it.
