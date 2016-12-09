Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 640a67ef
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 11:12:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08fc1e5c
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 11:12:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aed16777
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 11:12:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 22deb42f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 11:12:02 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id t79so22215969wmt.0
 for <wireguard@lists.zx2c4.com>; Fri, 09 Dec 2016 03:17:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161208231626.GA5230@grsecurity.net>
References: <e15d1fea-8761-fde9-6802-cb483340ebb4@sholland.org>
 <CAHmME9qBAt84jOvJhnSOybekbOFQb1RH+7mmfGK=bc2i9bxADg@mail.gmail.com>
 <CAHmME9q+oEAo+HuSRf8WJoGv+jbsA46c3GHXCUT4QvX8a+k23w@mail.gmail.com>
 <58475B7C.14182.19D586@pageexec.freemail.hu>
 <CAHmME9rHB20Ywi_ZkFGq5WioqeDApUvaTwaOP1HB1WBpYRVCag@mail.gmail.com>
 <CAHmME9pVCDu88c6n+LV9Mtd5Ohu8o-7RSQB4kRjsHGRQ3jF8zw@mail.gmail.com>
 <20161208231626.GA5230@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Dec 2016 12:17:39 +0100
Message-ID: <CAHmME9oY+Q7mWkpNejKnPg=DpbtGaXkthCCkPLusMv1uBANLTQ@mail.gmail.com>
Subject: Re: Kernel Panic
To: Brad Spengler <spender@grsecurity.net>
Content-Type: text/plain; charset=UTF-8
Cc: pageexec@freemail.hu, WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Brad,

On Fri, Dec 9, 2016 at 12:16 AM, Brad Spengler <spender@grsecurity.net> wrote:
> I see now, but your code is still wrong as it's relying on undefined
> behavior of the API.  Anyway, I will work around your incorrect code
> in the next patch (or more likely with our 4.9 patch) -- also don't
> rely on looking at other code as evidence of yours being correct,
> just look at all the examples being fixed in 4.9 as evidence ;)

I think actually the API was designed with the very purpose of copying
to stack buffers in mind. It was quite clearly made for MAC checks.
There's no way in hell I'm going to kmalloc just to check a MAC. The
intent of the function is correct, but along the way upstream tried to
add an optimization, that killed the correctness of it.

In theory, the function should map the DMA region to some accessible
virtual addresses, and then byte by byte (or word by word) memcpy data
from those addresses to some user supplied buffer. That user supplied
buffer can be a stack buffer. There's no way that that's disallowed.
The function should essentially read a word from the DMA vaddr into a
register, and then write a word into the stack buffer from a register.
This is kosher. But things get messed up with the kernel's
optimization for this. I'll paste the code line by line below and
annotate it to make it clear:

> void scatterwalk_map_and_copy(void *buf, struct scatterlist *sg,
>                               unsigned int start, unsigned int nbytes, int out)

buf can be anything, including a stack address.
sg is the DMA regions, which shouldn't include stack addresses.
start and nbytes are offset and length.
out controls the direction of the memcpy.

> {
>         struct scatter_walk walk;
>         struct scatterlist tmp[2];
>
>         if (!nbytes)
>                 return;
>
>         sg = scatterwalk_ffwd(tmp, sg, start);

So far so good. We're only doing ffwd on the non-stack DMA regions.

>
>         if (sg_page(sg) == virt_to_page(buf) &&
>             sg->offset == offset_in_page(buf))
>                 return;

Here's where we potentially get into trouble. In an effort to optimize
this function, to prevent overwriting a region with its own data, the
kernel developers introduced this short circuit. The problem is, it's
perhaps not correct to use this kind of optimization if buf is on the
stack.

But this optimization is actually just totally incorrect. It's
entirely possible that while sg and buf might _start_ at the same
place, there's no guarantee that they'll end at the same place. buf
could extend along a contiguous region, while sg has some other
fragments.

I'll write to LKML about this. But I think if you'd like grsecurity to
be the most "correct", the easiest way to fix this would be to just
remove this wrong optimization. Don't go patching all the consumers of
this function; that's not correct. Instead just fix the brokenness of
the actual function.

>
>         scatterwalk_start(&walk, sg);

Fine, only touches sg.

>         scatterwalk_copychunks(buf, &walk, nbytes, out);

Here's where things could become controversial, since we're passing
buf to a scatterwalk family function. But let's see what this actually
does next.

>         scatterwalk_done(&walk, out, 0);

Fine.
> }


> void scatterwalk_copychunks(void *buf, struct scatter_walk *walk,
>                             size_t nbytes, int out)

buf is our stack buffer.
walk is our non-stack DMA regions.
nbytes is length.
out is direction.

> {
>         for (;;) {
>                 unsigned int len_this_page = scatterwalk_pagelen(walk);
>                 u8 *vaddr;
>
>                 if (len_this_page > nbytes)
>                         len_this_page = nbytes;
>
>                 if (out != 2) {
>                         vaddr = scatterwalk_map(walk);

All this is fine. It only touches walk thus far, which is all
non-stack. What we're left with is a vaddr mapping of the DMA region.

>                         memcpy_dir(buf, vaddr, len_this_page, out);

Maybe this could become controversial, but when I paste the function
below, you'll see it's fine.

>                         scatterwalk_unmap(vaddr);
>                 }
>
>                 scatterwalk_advance(walk, len_this_page);
>
>                 if (nbytes == len_this_page)
>                         break;

Only deals with the non-stack DMA regions, fine.

>
>                 buf += len_this_page;

Touching the stack address pointer, but pretty clear this is okay.

>                 nbytes -= len_this_page;
>
>                 scatterwalk_pagedone(walk, out & 1, 1);
>         }
> }

Only touching the non-stack DMA regions.

Onto that potentially scandalous memcpy:

> static inline void memcpy_dir(void *buf, void *sgdata, size_t nbytes, int out)

buf is our stack buffer.
sgdata is our non-stack DMA region mapped to a vaddr.
nbytes is length.
out is direction.

> {
>         void *src = out ? buf : sgdata;
>         void *dst = out ? sgdata : buf;

Now we know who the src and dst are based on the direction.

>
>         memcpy(dst, src, nbytes);

And voila! A simple memcpy. This is either reading stack to register
and writing register to DMA vaddr, or reading DMA vaddr to register
and writing register to stack. Totally uncontroversial.

> }


So anyway, I think you'll agree things are fine, once you remove the
bogus optimization. Meanwhile I'll write to LKML about that for
mainline kernel. Hopefully for the next grsec 4.8 patch you can just
get rid of the optimization too and make things work again.

Jason
