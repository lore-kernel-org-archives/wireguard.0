Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CF5C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Dec 2021 20:54:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3725c628;
	Mon, 6 Dec 2021 20:54:16 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d3d5996b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Dec 2021 20:54:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c4so24970044wrd.9
 for <wireguard@lists.zx2c4.com>; Mon, 06 Dec 2021 12:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DPhlBZddyJ3+rVEfHdUwgeNZaH3/+qCIqcu3m1UAzD0=;
 b=nyvPWh027xMkuGdOWXUsMTx//maHaT45ZH1hYx7NiVXv9FBKTQ5DwtxogR6zksUTM+
 NkIY51RQiv79Itla9ok+8TXI4iVPRsJOm4YZ1DSjVN5lc1Vvs0DFRiDYeC7wGvmrER7k
 yT/ODYbUSY+L7tL5DgOxZoRxFUSohpYSnDY2oSBHtVRnDJvp5k+jULKxxSr1KX9vFBHd
 T0SiRWvBsxdHGoFkKbgkxiz7CDxnEh24ePR9YoR/bIjv8FvffVoEnjv3ISlZZg2laSON
 m1/4XonxgeP/bpljjYFtc34OaIn+WUqwEpCEhdln5/S4DR3KV5kgHQ8Yqy1A51pNaEAA
 +l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DPhlBZddyJ3+rVEfHdUwgeNZaH3/+qCIqcu3m1UAzD0=;
 b=ylCuLIZYEDj5lVWJfm4biBtk0owSgSoo2MBF/HIF+ladWHuTtLU4MZxiaJVXkc5eRb
 xsIwoCACe13FEWZE0j+3K1MNbq9o3zfcQ3xCGFqSUA2w9Kv7e7rWHb87/XQ9Jbsyar3d
 RiURdtFIFV10h/wxCBpHkuoUsh3YjSg62DkPkQheEM3k0DdPIPUwQNns3V0DLL8TR754
 cgn4/dlJKC5OdH/D6J7YmD7Pw+MIll/70DlYtGlQ6hYNilxuZ2JgeODy6HCEsEedo7t7
 3iuGz14o6Y2z3s1IIUJoSeq69XmNGMbTzK/3Pan2KqNk7spVlAIirI+45m0K/dUxvZzZ
 1l3A==
X-Gm-Message-State: AOAM532F9Kx7q2vpIkqkMNZ2rOQipDu8Pwo3hQr/m5wm7B98shdjay9O
 kz415xMxerESdDQ+TtaSkurCQSi7RZxJ+Q==
X-Google-Smtp-Source: ABdhPJz4Do9v/klcyCsKuHes5gFfzuA+IT+SDsBf95aNStp+IqXX4sCPv97crHZ6zE4pbRMMMv3Nmw==
X-Received: by 2002:a5d:6e01:: with SMTP id h1mr43739448wrz.403.1638824053548; 
 Mon, 06 Dec 2021 12:54:13 -0800 (PST)
Received: from ?IPv6:2003:f6:af03:cb00:aa51:ac04:48b6:3372?
 (p200300f6af03cb00aa51ac0448b63372.dip0.t-ipconnect.de.
 [2003:f6:af03:cb00:aa51:ac04:48b6:3372])
 by smtp.gmail.com with ESMTPSA id q4sm11955752wrs.56.2021.12.06.12.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 12:54:13 -0800 (PST)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9o38fA4_nDVyS9FvO1EL-Z4fS+a2eCo6Xq7VzMSrPYNKQ@mail.gmail.com>
 <c772d6c2-dac7-8c11-7c41-aaa6435a0bd6@grsecurity.net>
 <CAHmME9oyopU8euSuVy7su91fia6xG5V+9i+QodCBdTGdR_rD5Q@mail.gmail.com>
 <3a2d41dc-effb-158c-4a52-d7eb282ecb7e@grsecurity.net>
 <CAHmME9r4gspVnZGhgHhB1nR6FvOaryLoZvAJwpRU=-=rrbdoqQ@mail.gmail.com>
 <5bcdecdb-fbc0-4714-895d-1b1e6a87287a@grsecurity.net>
 <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
 <1ef9bbf4-b8f8-18df-3c80-3181c2b5b9c5@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <CAHmME9qhZZWf2SNFGWJepzuLXZx1o+AEa9-QunWupxBE8sk2mA@mail.gmail.com>
From: Mathias Krause <minipli@grsecurity.net>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
Message-ID: <490048f6-0e1b-f058-753c-fdc1892b9167@grsecurity.net>
Date: Mon, 6 Dec 2021 21:54:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9qhZZWf2SNFGWJepzuLXZx1o+AEa9-QunWupxBE8sk2mA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi Jason,

Am 06.12.21 um 20:28 schrieb Jason A. Donenfeld:
> On Mon, Dec 6, 2021 at 7:55 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> Nice detective work! I just loaded this up on the CI, so we'll see if
>> this does work across the board.
> 
> Looks like https://git.zx2c4.com/wireguard-linux-compat/commit/?id=42c931dbccf9570f10a84e282daf79f385d51623
> is all green on https://www.wireguard.com/build-status/ in the
> wireguard-linux-compat category. Let me know if that commit looks okay
> to you or if you want to adjust something about it. After that, I'll
> cut a new compat snapshot release.

ah, you modified the original commit of mine. Yeah, that works too.
However, I'd add the following to the commit log to account for the
output to input operand move:

"""
Also make 'out' an input-only operand as it is only used as such. This
not only allows gcc to optimize its usage further, but also works around
older gcc versions, apparently failing to handle multiple alternatives
correctly, as in failing to initialize the 'out' operand with its input
value.
"""

Thanks,
Mathias
