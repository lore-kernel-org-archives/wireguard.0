Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdc1eee8
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:15:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70dc957a
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:15:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0ec9e213
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:15:16 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id p16so101939412qta.0
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 06:18:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <A7E34EE0-F8F0-4F88-AA94-58434D0DF2BA@danrl.com>
References: <A7E34EE0-F8F0-4F88-AA94-58434D0DF2BA@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 15:18:03 +0100
Message-ID: <CAHmME9r0tdR8=nnC4yPLJoOE8yU_7iJi0qEpx9POyM3OBZ3otQ@mail.gmail.com>
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Demo Server: Dual stack?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Dan,

I guess I could provide IPv6 connectivity, but.... why? It's a demo.
If you're using it as an access point to the Internet with intentions
beyond simply trying out WireGuard, then you're abusing my service.

I'm happy to consider this, but I'll need to be convinced that this
actually matters.

Jason

On Wed, Nov 16, 2016 at 12:39 PM, Dan L=C3=BCdtke <mail@danrl.com> wrote:
> Jason,
>
> do you plan on adding IPv6 compatibility to the demo server? If not, do y=
ou mind if I set one up? How difficult is it to run the demo server. It jus=
t accepts every key, right?
>
> Cheers,
>
> Dan
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard
