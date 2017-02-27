Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95f957b6
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 03:21:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3497be83
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 03:21:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29fb1fcb
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 03:21:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3c7988ad
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 03:21:04 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id x10so44173101otb.1
 for <wireguard@lists.zx2c4.com>; Sun, 26 Feb 2017 19:22:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAApVa_kyD=KZYN3ABZU5yZGExNhC-34ryF+JZAPZ0JAKgmdJLw@mail.gmail.com>
References: <5e4ad220-6009-7ec9-95eb-ddccb994bb9e@gmail.com>
 <CAHmME9pH5xbVR04b9JLqFfho=i_K-jod6N8tJt0ggDXPfqQ_LA@mail.gmail.com>
 <a80303ca-e841-77f1-5ea6-6833f69b6059@gmail.com>
 <CAApVa_kyD=KZYN3ABZU5yZGExNhC-34ryF+JZAPZ0JAKgmdJLw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 27 Feb 2017 04:22:34 +0100
Message-ID: <CAHmME9ppn7wonfYTjOu9V-mmuRnF-S6v+1aoLneq4zLeoEShGg@mail.gmail.com>
Subject: Re: kernel warning with 0.0.20170223: entered softirq 3 NET_RX
 net_rx_action+0x0/0x760 with preempt_count 00000101, exited with 00000100?
To: Pipacs <pageexec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Brad Spengler <spender@grsecurity.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Pipacs,

I've been receiving reports of strange bugs from grsec users with
WireGuard. The first set of bugs was a heisenbug crash, and I never
found the root cause, but it seemed to happen in the rx path. Then
today Timoth=C3=A9e emailed another different bug from a grsec box, also
along the rx path. This time it was related to the preemption count
being wrong coming into and going out of the rx softirq. This kind of
preemption mismatch, I figure, might account for the earlier bug I
never solved.

So armed with this new information, I went hunting. I followed the
path inward, surrounding the body of each function with:

int i =3D preempt_count();
function_body...
if (i !=3D preempt_count()) pr_err("LORDHAVEMERCY\n");

Eventually I isolated the bug to an interesting situation like this:

int i =3D preempt_count();
other_function(...);
if (i !=3D preempt_count()) pr_err("This will print out\n");

void other_function(int a)
{
int vla[a];
int i =3D preempt_count();
function_body...
if (i !=3D preempt_count()) pr_err("This will NOT print out\n");
}

Since I only got the outer print, I thought this was strange, so I rearrang=
ed:

void other_function(int a)
{
int i =3D preempt_count();
int vla[a];
if (i !=3D preempt_count()) pr_err("This will print out\n");
function_body...
}

Yay, we found the bug. But wtf, what could possibly be changing the
preempt_count there?

So I went disassembling, and lo and behold the clever PaX stack leak
plugin was adding calls to pax_check_alloca. Very nice! But still, why
the preemption bug situation? I went hunting further:

void __used pax_check_alloca(unsigned long size)
{
 ...
       case STACK_TYPE_IRQ:
               stack_left =3D sp & (IRQ_STACK_SIZE - 1);
               put_cpu();
               break;
 ...
}

Do you see the bug? Looks like somebody snuck in a "put_cpu()" there,
where it really does not belong. "put_cpu()" basically just jiggers
the preempt_count. I can confirm that removing the erroneous call to
"put_cpu()" fixes the bug.

So, either this is by design, and there's some odd subtlety I'm
missing, or this is a bug that should be fixed in grsec/PaX.

In the case of the latter, I believe this introduces a security
vulnerability, since it opens up a whole host of interesting race
conditions that can be exploited.

Thanks,
Jason
