Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37a77e71
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 07:09:02 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 454708d1
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 07:09:02 +0000 (UTC)
Date: Sun, 11 Dec 2016 08:15:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan =?iso-8859-1?Q?L=FCdtke?= <mail@danrl.com>
Subject: Re: Misalignment, MIPS, and ip_hdr(skb)->version
Message-ID: <20161211071501.GA32621@kroah.com>
References: <CAHmME9o_eCNXpVztOZKW55kpRtE+1KSEQTQOjUBVn68Y2+or2g@mail.gmail.com>
 <095cac5b-b757-6f4a-e699-8eedf9ed7221@stressinduktion.org>
 <87vauvhwdu.fsf@alice.fifthhorseman.net>
 <CE942916-BF45-44CC-A5F5-3838CF9C93BC@danrl.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <CE942916-BF45-44CC-A5F5-3838CF9C93BC@danrl.com>
Cc: linux-mips@linux-mips.org, Netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, Dec 10, 2016 at 11:18:14PM +0100, Dan Lüdtke wrote:
> 
> > On 8 Dec 2016, at 05:34, Daniel Kahn Gillmor <dkg@fifthhorseman.net> wrote:
> > 
> > On Wed 2016-12-07 19:30:34 -0500, Hannes Frederic Sowa wrote:
> >> Your custom protocol should be designed in a way you get an aligned ip
> >> header. Most protocols of the IETF follow this mantra and it is always
> >> possible to e.g. pad options so you end up on aligned boundaries for the
> >> next header.
> > 
> > fwiw, i'm not convinced that "most protocols of the IETF follow this
> > mantra".  we've had multiple discussions in different protocol groups
> > about shaving or bloating by a few bytes here or there in different
> > protocols, and i don't think anyone has brought up memory alignment as
> > an argument in any of the discussions i've followed.
> > 
> 
> If the trade-off is between 1 padding byte and 2 byte alignment versus
> 3 padding bytes and 4 byte alignment I would definitely opt for 3
> padding bytes. I know how that waste feels like to a protocol
> designer, but I think it is worth it. Maybe the padding/reserved will
> be useful some day for an additional feature.

Note, if you do do this (hint, I think it is a good idea), require that
these reserved/pad fields always set to 0 for now, so that no one puts
garbage in them and then if you later want to use them, it will be a
mess.

thanks,

greg k-h
