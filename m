Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cfc4715
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:41:45 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fac3b4c9
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:41:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b48c218b
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:41:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bebdfef5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:41:44 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id b204so15710448oii.1
 for <wireguard@lists.zx2c4.com>; Wed, 17 May 2017 06:53:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0f5ecdc1-bda0-ec74-024c-e73b8791bb11@mysterious.site>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <87vap1gd2w.fsf@alrua-kau>
 <0f5ecdc1-bda0-ec74-024c-e73b8791bb11@mysterious.site>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 May 2017 15:53:06 +0200
Message-ID: <CAHmME9rq=q-v8hoEhvsA3MYb14WisDkdm0Sd_WdCcwAMFsr6Vw@mail.gmail.com>
Subject: Re: Text-based IPC for Userspace Implementations
To: Guanhao Yin <sopium@mysterious.site>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, May 16, 2017 at 6:33 PM, Guanhao Yin <sopium@mysterious.site> wrote=
:
> In the =E2=80=9Cconfiguration protocol=E2=80=9D section, I think =E2=80=
=9Cwg(8) responds to
> ...=E2=80=9D should be =E2=80=9CAn userspace implementation respondes to =
...=E2=80=9D?

Nice find, thanks.

> A text based format is certainly easier to deal with than C
> structs. Hope I can find some time to finally implement it in
> WireGuard.rs.

Looking forward to that.

Regards,
Jason
