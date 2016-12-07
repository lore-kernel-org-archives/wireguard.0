Return-Path: pageexec@freemail.hu
Received: from r00tworld.com (r00tworld.com [212.85.137.150])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5fdb101
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 00:39:31 +0000 (UTC)
From: "PaX Team" <pageexec@freemail.hu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 07 Dec 2016 01:44:44 +0100
MIME-Version: 1.0
Subject: Re: Kernel Panic
Message-ID: <58475B7C.14182.19D586@pageexec.freemail.hu>
In-reply-to: <CAHmME9q+oEAo+HuSRf8WJoGv+jbsA46c3GHXCUT4QvX8a+k23w@mail.gmail.com>
References: <e15d1fea-8761-fde9-6802-cb483340ebb4@sholland.org>,
 <CAHmME9qBAt84jOvJhnSOybekbOFQb1RH+7mmfGK=bc2i9bxADg@mail.gmail.com>,
 <CAHmME9q+oEAo+HuSRf8WJoGv+jbsA46c3GHXCUT4QvX8a+k23w@mail.gmail.com>
Content-type: text/plain; charset=US-ASCII
Cc: spender@grsecurity.net, WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: pageexec@freemail.hu
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 6 Dec 2016 at 23:39, Jason A. Donenfeld wrote:

[added spender to CC as it's his feature in grsec]

> Hey PaXTeam,
> 
> I tracked down Samuel's bug to this line in crypto/scatterwalk.c:
>         if (sg_page(sg) == virt_to_page(realbuf) &&
> 
> virt_to_page is redefined for CONFIG_GRKERNSEC_KSTACKOVERFLOW:
> 
> #define virt_to_page(kaddr)     \
>        ({ \
>                const void *__kaddr = (const void *)(kaddr); \
>                BUG_ON(!virt_addr_valid(__kaddr)); \
>                pfn_to_page(__pa(__kaddr) >> PAGE_SHIFT); \
>        })
> 
> So that's where the bug is hit. Now why is this happening?
> 
> I call scatterwalk_map_and_copy to read or write from or to a stack
> buffer

that's is your problem, DMA is forbidden to/from the stack in linux,
Documentation/DMA-API-HOWTO.txt says this:

   This rule also means that you may use neither kernel image addresses
   (items in data/text/bss segments), nor module image addresses, nor
   stack addresses for DMA.

> from a scattergather list, inside some crypto code that does
> MAC checking. When virt_addr_valid(__kaddr) returns false, it is only
> after PaX has additionally messed with its value. A few lines above
> the call to virt_to_page is:
> 
> #ifdef CONFIG_GRKERNSEC_KSTACKOVERFLOW
>        if (object_starts_on_stack(buf))
>                realbuf = buf - current->stack + current->lowmem_stack;
> #endif
> 
> Presumably this condition winds up being true, and then that
> arithmetic is wrong somehow. Alternatively, that condition isn't true
> due to a bug in object_starts_on_stack, and that arithmetic doesn't
> run when it needs to run.
> 
> Samuel reported that the problem did not exist on 4.7 but does exist
> on 4.8. If my memory serves me correctly, 4.8 introduced virtually
> mapped stacks. Could it be that this virtual mapping now eliminates
> the need for that arithmetic?

upstream will have 'virtually mapped stacks' (stupid name btw, stack is
always virtually mapped on MMU-capable systems :) as of 4.9 only, what
you're seeing above is grsec's KSTACKOVERFLOW feature which had a little
bonus added in 4.8 to handle (and detect the abuse of) IRQ stacks as well.

> Regards,
> Jason
