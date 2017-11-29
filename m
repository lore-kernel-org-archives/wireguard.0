Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7322a55
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 14:43:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ec293ef
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 14:43:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 073b1657
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 14:43:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 34daca30
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 14:43:01 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id y10so3181324otg.10
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 06:49:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAC6SzHJ8Rd3G7KWng5JxhXV4k2OE+uf5XKQNF3k6bzsDP=wUWA@mail.gmail.com>
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
 <CAHmME9piZhSukf55XY1Un2hO0TZyfHRh+afU8kk6R6yoSA5pQA@mail.gmail.com>
 <CAC6SzHJZj5BOMek4i=1ykepHSzHRDGKYTj-Cfa4veRbsVuj2WA@mail.gmail.com>
 <CAHmME9qeUw5VsaEoAG=i0=5LfOq4aPGi2KjDHKDjAPorXKJgbA@mail.gmail.com>
 <CAC6SzHJd8DzMBhuoGG=c8gtKzKd1zFs6wndKF0mEZDQW0aB6aQ@mail.gmail.com>
 <20171129135124.GA29970@zx2c4.com>
 <CAC6SzH+yoUtuim6oHypPXmef-oh2rQZTdQXDuN5YAGteXHN7rQ@mail.gmail.com>
 <CAHmME9pjU_5AncEkqYbnSUtB-h5h1nhrD5FXgkBia-sj=8jKrA@mail.gmail.com>
 <CAC6SzHJ8Rd3G7KWng5JxhXV4k2OE+uf5XKQNF3k6bzsDP=wUWA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Nov 2017 15:49:00 +0100
Message-ID: <CAHmME9rquEO5r0cMpTgPsLW790QqbN9DLxuETm-6TfxX9ULsVg@mail.gmail.com>
Subject: Re: multi-home difficulty
To: d tbsky <tbskyd@gmail.com>
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

On Wed, Nov 29, 2017 at 3:16 PM, d tbsky <tbskyd@gmail.com> wrote:
>      sorry I misunderstand you. you mean I modify the script and run
> in my environment to reveal the problem?
> ok I will try to do it.

Take what I sent you. Run it. If it breaks, send me the output and
your kernel. If it doesn't break, mess with it until it breaks, and
then send it back to me.
