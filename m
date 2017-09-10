Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2abaca75
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 22:04:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf2b3ed1
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 22:04:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f30e51d1
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 22:23:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6eadcef8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 22:23:48 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id v36so3090549ioi.1
 for <wireguard@lists.zx2c4.com>; Sun, 10 Sep 2017 15:30:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pe-91wvf8pCwea7kzzNQoOw4aCn9jACoO=CE+BtA3KVg@mail.gmail.com>
References: <1e1740c3-f8cf-2ee2-d842-749b687cb737@gmail.com>
 <CAHmME9ptrCHRbAXpztbveMrHZ-nSOwadgX0vfnmDgKrGE_ge7g@mail.gmail.com>
 <07621915-a53a-03f3-9c75-b7e7d188d109@gmail.com>
 <CAHmME9qEcQhsCSGxXydOkcJYjWJYw89_36KSuswHPyCu9ixtpg@mail.gmail.com>
 <a96000f1-25ac-03c0-5f07-5a9e0d09d485@gmail.com>
 <CAHmME9pe-91wvf8pCwea7kzzNQoOw4aCn9jACoO=CE+BtA3KVg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 Sep 2017 00:30:46 +0200
Message-ID: <CAHmME9rVe=zL2U_Ri78rh+Hdm0pbo8cStcnYFHScrvu=WpZUEw@mail.gmail.com>
Subject: Re: Timing issue (?) with wg-quick up on Raspberry Pi B+
To: Jim Darby <uberscubajim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Another "direct" debugging thing you could do is:

$ ip link add nlmon0 type nlmon
$ ip link set nlmon0 set up

And then start looking at the output in Wireshark. When you see the
obvious culprit (a rtnetlink message deleting the address), look at
the port ID. Then look in /proc/net/netlink to correlate the port id
("Pid") with an inode ("Inode"). Then look at the symbolic link
targets of /proc/{pid}/fd/[0-9]+ to see which pid has a fd belonging
to that inode. Then we'll know for certain.
