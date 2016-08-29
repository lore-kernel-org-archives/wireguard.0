Return-Path: dave.taht@gmail.com
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
 [209.85.214.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f3699a6
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 19:43:28 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id g62so2540581ith.1
 for <wireguard@lists.zx2c4.com>; Mon, 29 Aug 2016 12:50:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qhEyd4+=XcZbMAn9EXLX5ey0Ry8-pg7Rr4UVOZZfUXEw@mail.gmail.com>
References: <CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com>
 <CAHmME9pLBK44L1VzBA2tPsYKsu4YWXNvtXyZBWDDfp+F7qcYuA@mail.gmail.com>
 <CAHmME9qhEyd4+=XcZbMAn9EXLX5ey0Ry8-pg7Rr4UVOZZfUXEw@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Mon, 29 Aug 2016 12:50:16 -0700
Message-ID: <CAA93jw6Nzjftn_H2gwq_i+bkWpnH8FoUqeJN4vEzKAR_VLM5GQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] fq, ecn, etc with wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Nice to see you so quickly being productive. I am still constructing a
reply to your previous message.

Rather than try to expand your macros, my mental model on encode is

if(inner_dscp & 3) outer_dscp = (outer_dscp & 3) | (inner_dscp & 3);

decode is different. A bad actor could, for example, flip the outer
ecn bits from ect(1) to ect(0) (which have different meanings in the
l4s effort in the ietf),  or set the outer to CE (one evil ISP did
this until the worldwide test by apple last year for ecn capability
got them to fix it), when the inner is not ECN capable at all.

if(itos = inner_dscp & 3) if (otos = outer_dscp & 3)  if(otos == 3)
itos = itos | 3;

I see you are using the cb to temporarily store these bits. If we end
up sneaking fq_codel into there, you'll also need space for a
timestamp and another field.....

I didn't even know ip_tunnel_get_dsfield() even existed!
