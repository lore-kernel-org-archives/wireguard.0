Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4212b504
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 21:59:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bee4a7b0
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 21:59:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ce0664b
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 22:18:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b36aa8dc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 22:18:11 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id v36so3059389ioi.1
 for <wireguard@lists.zx2c4.com>; Sun, 10 Sep 2017 15:25:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a96000f1-25ac-03c0-5f07-5a9e0d09d485@gmail.com>
References: <1e1740c3-f8cf-2ee2-d842-749b687cb737@gmail.com>
 <CAHmME9ptrCHRbAXpztbveMrHZ-nSOwadgX0vfnmDgKrGE_ge7g@mail.gmail.com>
 <07621915-a53a-03f3-9c75-b7e7d188d109@gmail.com>
 <CAHmME9qEcQhsCSGxXydOkcJYjWJYw89_36KSuswHPyCu9ixtpg@mail.gmail.com>
 <a96000f1-25ac-03c0-5f07-5a9e0d09d485@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 Sep 2017 00:25:08 +0200
Message-ID: <CAHmME9pe-91wvf8pCwea7kzzNQoOw4aCn9jACoO=CE+BtA3KVg@mail.gmail.com>
Subject: Re: Timing issue (?) with wg-quick up on Raspberry Pi B+
To: Jim Darby <uberscubajim@gmail.com>
Content-Type: multipart/mixed; boundary="001a113d613c6445370558dd48aa"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113d613c6445370558dd48aa
Content-Type: text/plain; charset="UTF-8"

I just wrote the attached script, which will tell you all the
processes that have an open netlink socket...

There's a bit too much fluff in there on a desktop system, but I
imagine the pi might help boil it down to a few candidates. Probably
we'll determine it's an ifplugd/ifupdown.action thing, but we'll see.

--001a113d613c6445370558dd48aa
Content-Type: application/x-sh; name="netlistenwho.sh"
Content-Disposition: attachment; filename="netlistenwho.sh"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j7fb33j70

IyEvYmluL2Jhc2gKCltbICRVSUQgPT0gMCBdXSB8fCB7IGVjaG8gIlJ1biBtZSBhcyByb290ISI7
IGV4aXQgMTsgfQoKZGVjbGFyZSAtQSBzb2NrZXRzCndoaWxlIHJlYWQgLXIgZmlsZSBzb2NrOyBk
bwoJW1sgJGZpbGUgPX4gL3Byb2MvKFswLTldKykvZmQvWzAtOV0rIF1dIHx8IGNvbnRpbnVlCglw
aWQ9IiR7QkFTSF9SRU1BVENIWzFdfSIKCVtbICRzb2NrID1+IHNvY2tldDpcWyhbMC05XSspXF0g
XV0gfHwgY29udGludWUKCWlub2RlPSIke0JBU0hfUkVNQVRDSFsxXX0iCglzb2NrZXRzWyRpbm9k
ZV09JHBpZApkb25lIDwgPChmaW5kIC1QIC9wcm9jIC1tYXhkZXB0aCAzIC1taW5kZXB0aCAzIC1s
bmFtZSAnc29ja2V0OlxbKlxdJyAtcHJpbnRmICclcCAlbFxuJyAyPi9kZXYvbnVsbCkKCmRlY2xh
cmUgLWEgcGlkcwp3aGlsZSByZWFkIC1yIF8gXyBfIF8gXyBfIF8gXyBfIGlub2RlOyBkbwoJW1sg
JGlub2RlID09IElub2RlIF1dICYmIGNvbnRpbnVlCglwaWRzKz0oICR7c29ja2V0c1skaW5vZGVd
fSApCmRvbmUgPCAvcHJvYy9uZXQvbmV0bGluawoKcHMgIiR7cGlkc1tAXX0iCg==
--001a113d613c6445370558dd48aa--
