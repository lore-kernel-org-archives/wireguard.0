Return-Path: paul@mjr.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf49f19a
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 11:36:09 +0000 (UTC)
Received: from mjr.org (mjr.org [212.13.216.238])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4aaa66b9
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 11:36:09 +0000 (UTC)
Message-ID: <96021f8628fce828f728c81be2f1976370434cf3.camel@mjr.org>
Subject: Re: Key distribution and rotation tools?
From: Paul Hedderly <paul@mjr.org>
To: David Woodhouse <dwmw2@infradead.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Giacomo Bernardi <mino@minux.it>
Date: Wed, 23 May 2018 12:37:21 +0100
In-Reply-To: <1527067858.8186.76.camel@infradead.org>
References: <CABcNfLs4Z8uLu+Bn-3RCeAXkowB1ty0P_7hfGrAy_taS75CRdA@mail.gmail.com>
 <CAHmME9oMUDiSzdw6+1nqkMQwCjOCJDUkH_69DWSg-9LEp0J87g@mail.gmail.com>
 <1527067858.8186.76.camel@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, 2018-05-23 at 10:30 +0100, David Woodhouse wrote:
> On Wed, 2018-05-23 at 00:06 +0200, Jason A. Donenfeld wrote:
> > On Tue, May 22, 2018 at 3:42 PM, Giacomo Bernardi <mino@minux.it>
> > wrote:
> > > rotate pre-shared secrets by design [1].
> > 
> > Ahh, my apologies, I read "pre-shared" and assumed you were talking
> > about PSK mode. But I think you're really interested in more
> > general
> > key distribution.
> > 
> > Some people are just doing this over TLS with basic rest APIs
> > beforehand.
> 
> If you have established a TLS session from A to B then you can just
> derive your PSK from the master secret of that TLS session.
> 
> That's exactly what the Cisco AnyConnect protocol does, for
> "upgrading"
> its HTTPS connection to DTLS. It first connects via HTTPS and does
> all
> the authentication and client configuration that way, and then
> establishes a UDP connection *if* it isn't prevented by stupid
> firewalls.
> 
> In OpenConnect we've already extended the UDP connectivity to support
> *standard* DTLS1.2 and saner ciphersuites like chacha20/poly1305,
> rather than Cisco's pre-v1.0 version of DTLS.
> 
> I'm toying with the idea of extending it to use WireGuard too. It
> seems
> like a good complement — WireGuard gives us a very efficient UDP
> transport with kernel acceleration, and what's left is all the bits
> that are explicitly out of scope for WireGuard — configuration and
> authentication and key exchange. It fills in all the gaps and turns
> WireGuard into the basis of a complete client VPN solution.
> 
> Is anyone interested in that?
> 

Very much so....

But I'm also interested after reading about a possible mash of WG and
Tinc... the mesh over WG model would be awesome.
