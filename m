Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1b2a6f4
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:29:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34ec1fca
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:29:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c373c6e
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:29:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d7343fdb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:29:55 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id l138so12077530oib.7
 for <wireguard@lists.zx2c4.com>; Wed, 22 Nov 2017 15:35:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAC6SzHJZj5BOMek4i=1ykepHSzHRDGKYTj-Cfa4veRbsVuj2WA@mail.gmail.com>
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
 <CAHmME9piZhSukf55XY1Un2hO0TZyfHRh+afU8kk6R6yoSA5pQA@mail.gmail.com>
 <CAC6SzHJZj5BOMek4i=1ykepHSzHRDGKYTj-Cfa4veRbsVuj2WA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Nov 2017 00:35:05 +0100
Message-ID: <CAHmME9qeUw5VsaEoAG=i0=5LfOq4aPGi2KjDHKDjAPorXKJgbA@mail.gmail.com>
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

On Tue, Nov 21, 2017 at 3:35 PM, d tbsky <tbskyd@gmail.com> wrote:
> thanks for the quick reply. my wireguard configuration is in the
> previous mail, so I think the linux firewall part is what you want.

Right. So if you can give me minimal instructions on how to set up a
box that exhibits the buggy behavior you're seeing, I can try to fix
it.

Jason
