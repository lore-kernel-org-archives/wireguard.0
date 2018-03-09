Return-Path: tuxmealux@protonmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c7b888b
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 16:32:12 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e74aa68
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 16:32:11 +0000 (UTC)
Date: Fri, 09 Mar 2018 11:41:45 -0500
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Gianluca Gabrielli <tuxmealux@protonmail.com>
Subject: TCP Wireguard with socat
Message-ID: <utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: Gianluca Gabrielli <tuxmealux@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi everybody,

I'm an happy wireguard user since a while, but at that time I need to link =
two peers and I can only use TCP. I know that there are thousand of other t=
ools I can use, but I'd like to do it using wireguard.
My first thought has been to make use of socat, since some newest version a=
 new address type called INTERFACE has been added (http://www.dest-unreach.=
org/socat/doc/socat.html#ADDRESS_TYPES), so I tried to use it but I've not =
been able to make it works.
This is why I'm here asking your feedbacks, or to collect other ideas to le=
t wireguard works through a TCP tunnel.

I wrote all the notes about the tests I made on a pdf, I know that this is =
not the good way to share with you my results, and I should write it here o=
nce again in plaintext. But for me it will would turn on a waste of time do=
 it again, and it also would be less comprehensible.
I uploaded the pdf online instead to attach it to this email hence nobody n=
eeds to open it on his personal laptop, but it can be viewed via any browse=
r. I personally hate open unknown file on my computer. The pdf can be viewe=
d from the following link:
https://drive.google.com/open?id=3D1KrLvU1D0K4YpRHi-jsIjbExh0lFTRQks

I will really appreciate any constructive feedback or suggestion on how to =
easily use wireguard with TCP.

Thanks,
Gianluca
