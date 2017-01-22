Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb85fd2e
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Jan 2017 23:18:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ad4ec6a
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Jan 2017 23:18:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67b377b0
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Jan 2017 23:18:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 99e7c19f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Jan 2017 23:18:39 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id 73so91595028otj.0
 for <wireguard@lists.zx2c4.com>; Sun, 22 Jan 2017 15:29:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANA3KFX+nR2=g0MkKu3rzwxD3FQ+A7DyWCp-D8+x5xA-cbi9BA@mail.gmail.com>
References: <CANA3KFU0THGCkVhCsEC4CMfoj394XetYZ_TebyFGTwYiDZ9cBg@mail.gmail.com>
 <CAHmME9qS7ptMcCuvxcobi12hgfYdd4yYcOW5+D_uL6uOGq2f2A@mail.gmail.com>
 <CANA3KFWZP9XmCyWNnb19ywGRa8q57OUNt=42G1yjqkvLYc1kPw@mail.gmail.com>
 <CAHmME9qG4KnuFOCVi6w8fUJ9DVDL9_XjZnWxWPQGQaaPz6UTQw@mail.gmail.com>
 <CANA3KFUyf6NP9hu5i0rWfaKq7a27NQhWg4z-LE2SnTHTrbKM9g@mail.gmail.com>
 <F343B5F3-4A99-4F0D-B5BE-DBDC0CDECE09@danrl.com>
 <CANA3KFWHVtdDTRPqrbOfqJmHU=oh=ZDHitHmjBRO=xv+LnjYJg@mail.gmail.com>
 <1CF3351B-5760-45D6-9D54-4D0A4FC92036@danrl.com>
 <CANA3KFWy1k7L=-FFegh0_3ujw5fx6JSDS15LTbvaKg=a4_gpqQ@mail.gmail.com>
 <9157BE7F-FAC4-4826-8493-E29F1C3D75AB@danrl.com>
 <CANA3KFX+nR2=g0MkKu3rzwxD3FQ+A7DyWCp-D8+x5xA-cbi9BA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Jan 2017 00:29:57 +0100
Message-ID: <CAHmME9rK2t3u9puEnhOm=XgDWqni6tkxni60iTBwJJyHm9fYdA@mail.gmail.com>
Subject: Re: Built-in Roaming is limited due to a design fault adding STUN and
 TURN support would be good and make wire-guard connections more
 durable.
To: Peter Dolding <oiaohm@gmail.com>
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

Hello,

You raise interesting points. Symmetric NAT hole punching requires
lots of notification hooks to implement. Seeing as these types of
hooks and expanded userspace API are already something useful for
other things people have been talking about, I expect to expand the
userspace API. I imagine on top of those expansions, you'll be able to
implement performant STUN punching or TURN relaying. I thought I had
made these points clear much earlier, and asked whether you'd be
willing to implement some code.

In short, if you're interesting in writing code, you'll have what you
want, and you'll have a partner in me writing APIs for the kernel side
of things.

However, if it's going to be more extremely long rambling emails,
which are borderline offensive at times, that's not really going to
work.

It's now gotten to the point where people have been writing to me,
"hey you have a great mailing list and project, and now this guy is
really burdensome to read, what's the deal?" And indeed, a simple
google search reveals a history of odd trolling.

Therefore, I ask you to keep subsequent replies on this thread short
and efficient. If you'd like to write some interesting network code,
let's do it. Otherwise, at the very least I certainly do thank you for
your suggestion. You've made more clear in my mind exactly what the
challenges of symmetric NAT are. I'm quite confident we'll get to the
point where these network concerns can be addressed, and where
wireguard has the right notification mechanisms to enable this to
happen.

Regards,
Jason
