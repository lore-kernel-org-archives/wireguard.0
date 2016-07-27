Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f03981e5
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2016 10:23:51 +0000 (UTC)
In-Reply-To: <CAHmME9qqv3kC=6Y_JTO-P++4jpfTjw8qUGtGTQhsdmCujvU4sw@mail.gmail.com>
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
 <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
 <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
 <CAHmME9qqv3kC=6Y_JTO-P++4jpfTjw8qUGtGTQhsdmCujvU4sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----IU048N9PYPX3ZHQFXCLTTVGE9Y4OO4"
From: Jens Viisauksena <jens@viisauksena.de>
Date: Wed, 27 Jul 2016 12:26:28 +0200
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <DEB54C8F-1159-48AD-B2A3-CB2B4E05C896@viisauksena.de>
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

------IU048N9PYPX3ZHQFXCLTTVGE9Y4OO4
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

It should however not lead to netifd outofmemory, load of 2.6 and the oomkiller berserking around at all... even if  its not directly wg fault.

Yesterday there was no time to test fastd in such a setting,
Similar test show 5 to 15mbs depending on used crypto in the past.
But there we test laptop - 841v9(550mhz?) - broadbanduplink - backboneserver

If we are motivated, we check fastd in the next days against different cypher algos in exact the same setting, to have a realy good base for comparing software on this fairly week devices

On July 27, 2016 12:14:12 PM GMT+02:00, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>On Wed, Jul 27, 2016 at 12:10 PM, Jens Viisauksena
><jens@viisauksena.de> wrote:
>> the small routers run fastd into the backbone.
>
>Is the performance of wireguard better or worse than fastd?
>Theoretically wireguard should be much faster, so if it isn't already
>so in practice, I'd like to optimize a bit.

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
------IU048N9PYPX3ZHQFXCLTTVGE9Y4OO4
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head></head><body>It should however not lead to netifd outofmemory, load of 2.6 and the oomkiller berserking around at all... even if  its not directly wg fault.<br>
<br>
Yesterday there was no time to test fastd in such a setting,<br>
Similar test show 5 to 15mbs depending on used crypto in the past.<br>
But there we test laptop - 841v9(550mhz?) - broadbanduplink - backboneserver<br>
<br>
If we are motivated, we check fastd in the next days against different cypher algos in exact the same setting, to have a realy good base for comparing software on this fairly week devices<br><br><div class="gmail_quote">On July 27, 2016 12:14:12 PM GMT+02:00, &quot;Jason A. Donenfeld&quot; &lt;Jason@zx2c4.com&gt; wrote:<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class="k9mail">On Wed, Jul 27, 2016 at 12:10 PM, Jens Viisauksena &lt;jens@viisauksena.de&gt; wrote:<br /><blockquote class="gmail_quote" style="margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"> the small routers run fastd into the backbone.<br /></blockquote><br />Is the performance of wireguard better or worse than fastd?<br />Theoretically wireguard should be much faster, so if it isn't already<br />so in practice, I'd like to optimize a bit.<br /></pre></blockquote></div><br>
-- <br>
Sent from my Android device with K-9 Mail. Please excuse my brevity.</body></html>
------IU048N9PYPX3ZHQFXCLTTVGE9Y4OO4--
