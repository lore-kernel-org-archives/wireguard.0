Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3dda33a9
 for <wireguard@lists.zx2c4.com>; Sun, 6 Nov 2016 10:17:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f190012
 for <wireguard@lists.zx2c4.com>; Sun, 6 Nov 2016 10:17:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7dc19819
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Nov 2016 10:17:07 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id o141so21286431lff.1
 for <wireguard@lists.zx2c4.com>; Sun, 06 Nov 2016 02:18:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1289478110.20161106110707@vodka.home.kg>
References: <25241985.20161106100258@vodka.home.kg>
 <1289478110.20161106110707@vodka.home.kg>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 6 Nov 2016 11:18:40 +0100
Message-ID: <CAHmME9qfoOnxr_sobcB_ZGSOsFSfU+fDt4-EGBfXSPOzH1sLpQ@mail.gmail.com>
To: k@vodka.home.kg
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] mips32 crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi k,

Yowza! Any thing else useful in dmesg?

Using that same 20161103 snapshot?

Was it easy to come by or did it occur a bit sporadically? If you can
reliably reproduce, that'd be helpful.

Thanks,
Jason

On Sun, Nov 6, 2016 at 9:07 AM,  <k@vodka.home.kg> wrote:
>> <4>[13905.634933] Process  (pid: 41189632, threadinfo=82bca000, task=810000ce, tls=8100cea5)
>
>> Likely caused by memory corruption.
>
> Look  at  pid  value.  Its defenitly not valid pid. Task structure was
> corrupted.
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard
