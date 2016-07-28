Return-Path: bjin@ctrl-d.org
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
 [209.85.215.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 472ec974
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jul 2016 13:06:38 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id b199so49262932lfe.0
 for <wireguard@lists.zx2c4.com>; Thu, 28 Jul 2016 06:09:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qF=jWLXfoO0Y7Vt04SyqvYUKEgr-JhG1iMC=oc84=FCg@mail.gmail.com>
References: <CAHQn_MD74m-mHQLCbK7UG72BnCdbVbdUpiD0jF4Jk1NFuJMLAw@mail.gmail.com>
 <CAHmME9qF=jWLXfoO0Y7Vt04SyqvYUKEgr-JhG1iMC=oc84=FCg@mail.gmail.com>
From: Bin Jin <bjin@ctrl-d.org>
Date: Thu, 28 Jul 2016 15:09:04 +0200
Message-ID: <CAHQn_MAQUR4x5Tn0bRNi1yrnhjihxCRO7pGiJe56ONwiTS8CXA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Suggestion: Hide private key by default with wg tool
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Yes, that looks great. Thanks!

Bin

On Thu, Jul 28, 2016 at 2:01 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hi Bin,
>
> I think I'll just get rid of it completely in `show` but not in the
> more explicit views. So,
>
>   - # wg show wg0  -- no private key
>   - # wg show wg0 private-key -- yes private key
>   - # wg showconf wg0 -- yes private key
>
> What would you think of this?
>
> Regards,
> Jason
