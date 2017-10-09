Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2cd69c5
 for <wireguard@lists.zx2c4.com>; Mon, 9 Oct 2017 22:50:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3170148c
 for <wireguard@lists.zx2c4.com>; Mon, 9 Oct 2017 22:50:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccd648e1
 for <wireguard@lists.zx2c4.com>; Mon, 9 Oct 2017 23:09:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bd7a2dfa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Oct 2017 23:09:08 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id q4so24811403oic.7
 for <wireguard@lists.zx2c4.com>; Mon, 09 Oct 2017 16:19:46 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Oct 2017 01:19:45 +0200
Message-ID: <CAHmME9ovdYWEMkQKedvO+-4p4X5dOVARFhQ_W74sXJyvP=53Pg@mail.gmail.com>
Subject: October, Paris, France - Meticulous In-person WireGuard Codebase
 Study Session
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey folks,

A few friends asked if I'd do a meticulous read through and
explanation, in person, of every line of the relatively short
WireGuard code base. We had done this at some point in 2015, before
the project was made public, and it took several highly intense hours
to study the whole thing, but was a fairly interesting time for all
(though undoubtedly mentally exhausting to the fullest).

Now they're asking me to do it again. But this time I thought I'd
extend the session to a bit larger group.

If anybody is in Paris during the next few weeks and would like to
attend, please let me know, either on list or off list, and we'll pick
a time and place and all meet up for several hours of intense study.

Requirements are a working knowledge of C and a general idea of what
it's like to use WireGuard. The rest of everything will be explained
line by line in an thorough and detailed fashion. The end result is
that all attendees will be capable of contributing to WireGuard and
hacking on the code base. You and I will both learn a lot from
discussing crypto and strange algorithms, and I expect it to be
productive for everybody involved.

So, if this sounds fun to anybody in town, don't hesitate to shout out.

See you soon maybe,
Jason
