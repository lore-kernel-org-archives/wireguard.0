Return-Path: labawi-wg@matrix-dream.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36b85545
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 15:32:26 +0000 (UTC)
Received: from matrix-dream.net (matrix2.matrix-dream.net [84.200.73.251])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a5c6d85
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 15:32:26 +0000 (UTC)
Received: from ivan by matrix-dream.net with local (Exim 4.88)
 (envelope-from <labawi-wg@matrix-dream.net>) id 1dAedS-0003BK-5n
 for wireguard@lists.zx2c4.com; Tue, 16 May 2017 16:43:42 +0100
Date: Tue, 16 May 2017 16:43:42 +0100
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: wireguard@lists.zx2c4.com
Subject: Re: Text-based IPC for Userspace Implementations
Message-ID: <20170516154342.GC9458@matrix-dream.net>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

does changing one peer affect settings of another
peer if they have common allowed_ips?

Regards,
Ivan Labáth

On Tue, May 16, 2017 at 02:36:00PM +0200, Jason A. Donenfeld wrote:
> Hey guys,
> 
> Currently wg(8) talks to the kernel by passing structs through an
> ioctl. Due to upstream demands, this is going to be changed to
> netlink, and we'll ditch those structs. wg(8) previously tried to
> re-use those same structs for userspace implementations, passing them
> through a unix socket. Implementors did not like dealing with this.
> Since the structs are going for the kernel stuff, we might as well
> move to something better, too, for the userspace stuff. Therefore
> wg(8) now has a very simple text-based IPC format over unix sockets
> (or Windows named pipes) that can be easily implemented in nearly
> every language, even bash.
> 
> I've written a small description of it here: https://www.wireguard.io/xplatform/
> 
> This will be part of the next snapshot.
> 
> Any questions?
> 
> Regards,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
