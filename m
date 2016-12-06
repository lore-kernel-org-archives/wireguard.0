Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0211cdda
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 22:34:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49caf1b9
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 22:34:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 92b0b515
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 22:34:18 +0000 (UTC)
Received: by mail-wj0-f177.google.com with SMTP id xy5so340203428wjc.0
 for <wireguard@lists.zx2c4.com>; Tue, 06 Dec 2016 14:39:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qBAt84jOvJhnSOybekbOFQb1RH+7mmfGK=bc2i9bxADg@mail.gmail.com>
References: <e15d1fea-8761-fde9-6802-cb483340ebb4@sholland.org>
 <CAHmME9qcOm5Thc1q+DnPWh_orJ3a64gyBGrfnetCrO+Lsc8zGg@mail.gmail.com>
 <d976751e-a6a3-86bd-b3e3-87d68223efd6@sholland.org>
 <CAHmME9qBAt84jOvJhnSOybekbOFQb1RH+7mmfGK=bc2i9bxADg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Dec 2016 23:39:36 +0100
Message-ID: <CAHmME9q+oEAo+HuSRf8WJoGv+jbsA46c3GHXCUT4QvX8a+k23w@mail.gmail.com>
Subject: Re: Kernel Panic
To: pageexec@freemail.hu
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey PaXTeam,

I tracked down Samuel's bug to this line in crypto/scatterwalk.c:
        if (sg_page(sg) == virt_to_page(realbuf) &&

virt_to_page is redefined for CONFIG_GRKERNSEC_KSTACKOVERFLOW:

#define virt_to_page(kaddr)     \
       ({ \
               const void *__kaddr = (const void *)(kaddr); \
               BUG_ON(!virt_addr_valid(__kaddr)); \
               pfn_to_page(__pa(__kaddr) >> PAGE_SHIFT); \
       })

So that's where the bug is hit. Now why is this happening?

I call scatterwalk_map_and_copy to read or write from or to a stack
buffer from a scattergather list, inside some crypto code that does
MAC checking. When virt_addr_valid(__kaddr) returns false, it is only
after PaX has additionally messed with its value. A few lines above
the call to virt_to_page is:

#ifdef CONFIG_GRKERNSEC_KSTACKOVERFLOW
       if (object_starts_on_stack(buf))
               realbuf = buf - current->stack + current->lowmem_stack;
#endif

Presumably this condition winds up being true, and then that
arithmetic is wrong somehow. Alternatively, that condition isn't true
due to a bug in object_starts_on_stack, and that arithmetic doesn't
run when it needs to run.

Samuel reported that the problem did not exist on 4.7 but does exist
on 4.8. If my memory serves me correctly, 4.8 introduced virtually
mapped stacks. Could it be that this virtual mapping now eliminates
the need for that arithmetic?

Regards,
Jason
