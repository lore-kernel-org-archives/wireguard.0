Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b35d110
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Aug 2016 23:04:13 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
 <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
 <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
 <CAHmME9qqv3kC=6Y_JTO-P++4jpfTjw8qUGtGTQhsdmCujvU4sw@mail.gmail.com>
 <DEB54C8F-1159-48AD-B2A3-CB2B4E05C896@viisauksena.de>
 <CAHmME9oveH4hLUzEjwWnZ8Nj8U63LEuVezgivsxVxgpZKL_PwQ@mail.gmail.com>
 <8eebb32d-b302-5975-726b-874a9ad12a84@viisauksena.de>
 <20160803064853.Horde.ZExiUp0by8SskYUmZW7CFq4@www.vdorst.com>
 <ce094d6d-2314-8bfe-72e1-879b88ec7141@viisauksena.de>
 <20160803201014.Horde.RctXDT7A7Fi6hFbWMcqDmJs@www.vdorst.com>
 <923cdc92-aa01-758a-5741-99a3f6009dc5@viisauksena.de>
 <CAHmME9oNd9o6rzqPU-Lh69E09oWb8_gHApxuD5+asAdQbgAcwA@mail.gmail.com>
 <b1788ba6-edc5-98d9-2f49-8321e6c3e7b1@viisauksena.de>
 <90a667ed-4f48-a0cc-1e93-472fcc5ef67f@viisauksena.de>
From: jens <jens@viisauksena.de>
Message-ID: <cd1a3622-a301-b612-4113-9bdfd285c100@viisauksena.de>
Date: Tue, 16 Aug 2016 01:05:22 +0200
MIME-Version: 1.0
In-Reply-To: <90a667ed-4f48-a0cc-1e93-472fcc5ef67f@viisauksena.de>
Content-Type: multipart/alternative;
 boundary="------------550F27B90E3F348DC1584623"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] LEDE / OpenWrt test - on TP-Link841Nv11 - 15MBs and
 crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------550F27B90E3F348DC1584623
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

by building i ran in the same error described here ..

[LEDE-DEV] kmod-udptunnel{4, 6} packages are empty (Was: Kernel symbol
dependencies and KCONFIG usage for kernel packages)
<https://www.mail-archive.com/search?l=lede-dev@lists.infradead.org&q=subject:%22Re%5C%3A+%5C%5BLEDE%5C-DEV%5C%5D+kmod%5C-udptunnel%5C%7B4%2C+6%5C%7D+packages+are+empty+%5C%28Was%5C%3A+Kernel+symbol+dependencies+and+KCONFIG+usage+for+kernel+packages%5C%29%22&o=newest>

udptunnel4 and 6 are build malicously , so i cant do any of the tests
actually ..

i try this patch
https://git.lede-project.org/?p=lede/hauke/staging.git;a=commitdiff;h=195413a223fb1d6f91927a2c5a8780c7b1829f76
as suggested in
https://www.mail-archive.com/search?l=lede-dev@lists.infradead.org&q=subject:%22%5C%5BLEDE%5C-DEV%5C%5D+Kernel+symbol+dependencies+and+KCONFIG+usage+for+kernel%09packages%22&o=newest

sorry for that .. but all buildings from my side before to test you
suggestions were faulty , so i have to solve this before - which again
takes some time

-- 
make the world nicer, please use PGP encryption


--------------550F27B90E3F348DC1584623
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>by building i ran in the same error described here ..<span
        class="subject"><a
href="https://www.mail-archive.com/search?l=lede-dev@lists.infradead.org&amp;q=subject:%22Re%5C%3A+%5C%5BLEDE%5C-DEV%5C%5D+kmod%5C-udptunnel%5C%7B4%2C+6%5C%7D+packages+are+empty+%5C%28Was%5C%3A+Kernel+symbol+dependencies+and+KCONFIG+usage+for+kernel+packages%5C%29%22&amp;o=newest"
          rel="nofollow"><span itemprop="name"><br>
            <br>
            [LEDE-DEV] kmod-udptunnel{4, 6} packages are empty (Was:
            Kernel symbol dependencies and KCONFIG usage for kernel
            packages)</span></a></span></p>
    <p>udptunnel4 and 6 are build malicously , so i cant do any of the
      tests actually .. <br>
    </p>
    <p>i try this patch <br>
<a class="moz-txt-link-freetext" href="https://git.lede-project.org/?p=lede/hauke/staging.git;a=commitdiff;h=195413a223fb1d6f91927a2c5a8780c7b1829f76">https://git.lede-project.org/?p=lede/hauke/staging.git;a=commitdiff;h=195413a223fb1d6f91927a2c5a8780c7b1829f76</a><br>
      as suggested in <br>
<a class="moz-txt-link-freetext" href="https://www.mail-archive.com/search?l=lede-dev@lists.infradead.org&amp;q=subject:%22%5C%5BLEDE%5C-DEV%5C%5D+Kernel+symbol+dependencies+and+KCONFIG+usage+for+kernel%09packages%22&amp;o=newest">https://www.mail-archive.com/search?l=lede-dev@lists.infradead.org&amp;q=subject:%22%5C%5BLEDE%5C-DEV%5C%5D+Kernel+symbol+dependencies+and+KCONFIG+usage+for+kernel%09packages%22&amp;o=newest</a><br>
      <br>
      sorry for that .. but all buildings from my side before to test
      you suggestions were faulty , so i have to solve this before -
      which again takes some time<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
make the world nicer, please use PGP encryption</pre>
  </body>
</html>

--------------550F27B90E3F348DC1584623--
