Return-Path: <SRS0=oxb/=FZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1155C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 13:51:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 241802222A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 13:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 241802222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18a4ef3e;
	Mon, 21 Dec 2020 13:42:15 +0000 (UTC)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [2607:f8b0:4864:20::b36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 56ffc04f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 13:42:13 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id x2so8821976ybt.11
 for <wireguard@lists.zx2c4.com>; Mon, 21 Dec 2020 05:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mHgLaGHkyXcabO8xIkwlWJDr0MLBnIf8/qlkiv3QkXo=;
 b=F1s3IZItQhZW8oKY8yQAFhMb+5YpQSaWkdzriG2F1JWsUb8om7K0UcjMwvEToL3a8X
 vPB/icFWCy3T7WJ2+UaDJlBHkeU8xx3cwO/ZQdZ+XhfiGCcRjnlwavdFlACH+szE6Xdr
 2J/YXkVXHD1ghNJm7VBM0OZf+4J6O4Scu5uPRxvV4hzEiD8fKqP7E1hidDSO8MMpn5jX
 GhZhDq0dYQcIjJOjXs1eSktSFHugLxz9zJM3KlIupNe2UY1m6L5AErmaW1KaWIaVv+dP
 oFfmbitNFCQ1KQH0muFAqoRKjTt35L5jRMwlLBMv3emwPuhHmwmHgUgGx7sB5IvW3uz1
 xHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mHgLaGHkyXcabO8xIkwlWJDr0MLBnIf8/qlkiv3QkXo=;
 b=LfTToEMVeOU2KmF1OdV8+Tfs/Mw2JloKdffMHJnh1QI6meT1JTlGEb7Z0KlHix5bth
 LpFZF/MHKh0yKyeozYxOUz5kgzVpBtcTmAravWntTsZsknOB0jw8RPNzoiNsOs88/iW4
 BhipCN0CryaNL9ToByUncXSxHXZg6gH5xgx3ndczgKYl3C4SxxpFVhrFwWwU99rbIuR+
 MqX7dpfaKuxInPxW2E9x6KxZZsUsamRECcvdFrWRt3+/iO9DPIrn5dq4ZMqewzyE+WcP
 nl/3wl9Wd8sx3AS+OqIihQjevcYEpT/vb2HfibGzBXvYVJ0kwcvGxTM3XvAWkBJiOs7D
 uIMA==
X-Gm-Message-State: AOAM532wh3WyrKzjrD8vNkeZqHs7XJmV3Kshup+sS8DCd4ubhnABo0pH
 +3CrxsdAp6j3f8e+mwF5Dngi8M53whYTADfSr9g=
X-Google-Smtp-Source: ABdhPJyHPXD2WoRee0gLQTCh8E0/Ceo8vhSHe7ZKLTkLXezBU+vPi6psE0EHYE1zYhtBw5l7l2aL3OvVEYweBA+zdHM=
X-Received: by 2002:a25:40d:: with SMTP id 13mr23258507ybe.422.1608558675780; 
 Mon, 21 Dec 2020 05:51:15 -0800 (PST)
MIME-Version: 1.0
References: <20201128193335.219395-1-masahiroy@kernel.org>
 <20201212161831.GA28098@roeck-us.net>
 <CANiq72=e9Csgpcu3MdLGB77dL_QBn6PpqoG215YUHZLNCUGP0w@mail.gmail.com>
 <8f645b94-80e5-529c-7b6a-d9b8d8c9685e@roeck-us.net>
 <CANiq72kML=UmMLyKcorYwOhp2oqjfz7_+JN=EmPp05AapHbFSg@mail.gmail.com>
 <X9YwXZvjSWANm4wR@kroah.com>
 <CANiq72=UzRTkh6bcNSjE-kSgBJYX12+zQUYphZ1GcY-7kNxaLA@mail.gmail.com>
 <CAK7LNARXa1CQSFJjcqN7Y_8dZ1CSGqjoeox3oGAS_3=4QrHs9g@mail.gmail.com>
In-Reply-To: <CAK7LNARXa1CQSFJjcqN7Y_8dZ1CSGqjoeox3oGAS_3=4QrHs9g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Dec 2020 14:51:05 +0100
Message-ID: <CANiq72m5_mc=Cq1gkMtO6UTo+x91aE7+UBDYJQLazmTh4RbntA@mail.gmail.com>
Subject: Re: [PATCH v3] Compiler Attributes: remove CONFIG_ENABLE_MUST_CHECK
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Nathan Chancellor <natechancellor@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, Shuah Khan <shuah@kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
 Network Development <netdev@vger.kernel.org>, wireguard@lists.zx2c4.com
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

On Mon, Dec 21, 2020 at 7:20 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Sorry for the delay.

No problem!

> Now I sent out the fix for lantiq_etop.c
>
> https://lore.kernel.org/patchwork/patch/1355595/

I saw it, thanks for the Cc!

> The reason of the complication was
> I was trying to merge the following patch in the same development cycle:
> https://patchwork.kernel.org/project/linux-kbuild/patch/20201117104736.24997-1-olaf@aepfle.de/

Ah, then that explains why Guenter's had an error instead of a warning.

> Tomorrow's linux-next should be OK
> and, you can send my patch in this merge window.

Thanks!

Cheers,
Miguel
