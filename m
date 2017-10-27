Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6233ab25
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 17:50:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a461a05e
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 17:50:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b0da574
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 17:50:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 51da97ad
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 17:50:38 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id q4so12075336oic.7
 for <wireguard@lists.zx2c4.com>; Fri, 27 Oct 2017 10:52:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pn977yhsu-rVdR-Mz+ZnsrUaxjQYxc2SveYL9zKNXB4w@mail.gmail.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
 <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
 <92b6b9c5-b07c-52fa-a72a-0fc2dcc253bc@solidadmin.com>
 <CAHmME9pn977yhsu-rVdR-Mz+ZnsrUaxjQYxc2SveYL9zKNXB4w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 27 Oct 2017 19:52:29 +0200
Message-ID: <CAHmME9p0=E983dHJ=ziowqz=XCWLB3QK9SC3dQWeK3+ky2oX8g@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: Joe Doss <joe@solidadmin.com>
Content-Type: multipart/mixed; boundary="001a11409f6adb1bcb055c8af3d5"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11409f6adb1bcb055c8af3d5
Content-Type: text/plain; charset="UTF-8"

Okay, so, in the rpm spec, you can patch wg-quick.bash before the make install.

sed -n -i -e '/^cmd_usage()/r path/to/hatchet.bash' -e 1x -e
'2,${x;p}' -e '${x;p}' path/to/src/tools/wg-quick.bash

This is using the attached hatchet.bash file.

--001a11409f6adb1bcb055c8af3d5
Content-Type: application/octet-stream; name="hatchet.bash"
Content-Disposition: attachment; filename="hatchet.bash"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j9a720t70

c2V0X2RucygpIHsKCVtbICR7I0ROU1tAXX0gLWd0IDAgXV0gfHwgcmV0dXJuIDAKCglpZiBbWyAk
KHJlc29sdmNvbmYgLS12ZXJzaW9uIDI+L2Rldi9udWxsKSA9PSBvcGVucmVzb2x2XCAqIF1dOyB0
aGVuCgkJcHJpbnRmICduYW1lc2VydmVyICVzXG4nICIke0ROU1tAXX0iIHwgY21kIHJlc29sdmNv
bmYgLWEgIiRJTlRFUkZBQ0UiIC1tIDAgLXgKCWVsc2UKCQllY2hvICJbI10gbW91bnQgXGAke0RO
U1sqXX0nIC9ldGMvcmVzb2x2LmNvbmYiID4mMgoJCVtbIC1lIC9ldGMvcmVzb2x2LmNvbmYgXV0g
fHwgdG91Y2ggL2V0Yy9yZXNvbHYuY29uZgoJCXsgY2F0IDw8LV9FT0YKCQkJIyBUaGlzIGZpbGUg
d2FzIGdlbmVyYXRlZCBieSB3Zy1xdWljayg4KSBmb3IgdXNlIHdpdGgKCQkJIyB0aGUgV2lyZUd1
YXJkIGludGVyZmFjZSAkSU5URVJGQUNFLiBJdCBjYW5ub3QgYmUKCQkJIyByZW1vdmVkIG9yIGFs
dGVyZWQgZGlyZWN0bHkuIFlvdSBtYXkgcmVtb3ZlIHRoaXMgZmlsZQoJCQkjIGJ5IHJ1bm5pbmcg
XGB3Zy1xdWljayBkb3duICRJTlRFUkZBQ0UnLCBvciBpZiB0aGF0CgkJCSMgcG9zZXMgcHJvYmxl
bXMsIHJ1biBcYHVtb3VudCAvZXRjL3Jlc29sdi5jb25mJy4KCgkJX0VPRgoJCXByaW50ZiAnbmFt
ZXNlcnZlciAlc1xuJyAiJHtETlNbQF19IgoJCX0gfCB1bnNoYXJlIC1tIC0tcHJvcGFnYXRpb24g
c2hhcmVkIGJhc2ggLWMgIiQoY2F0IDw8LV9FT0YKCQkJc2V0IC1lCgkJCW1vdW50IC0tbWFrZS1w
cml2YXRlIC9kZXYvc2htCgkJCW1vdW50IC10IHRtcGZzIG5vbmUgL2Rldi9zaG0KCQkJY2F0ID4g
L2Rldi9zaG0vcmVzb2x2LmNvbmYKCQkJbW91bnQgLW8gcmVtb3VudCxybyAvZGV2L3NobQoJCQlt
b3VudCAtbyBiaW5kLHJvIC9kZXYvc2htL3Jlc29sdi5jb25mIC9ldGMvcmVzb2x2LmNvbmYKCQlf
RU9GCgkJKSIKCWZpCglIQVZFX1NFVF9ETlM9MQp9Cgp1bnNldF9kbnMoKSB7CglbWyAkeyNETlNb
QF19IC1ndCAwIF1dIHx8IHJldHVybiAwCgoJaWYgW1sgJChyZXNvbHZjb25mIC0tdmVyc2lvbiAy
Pi9kZXYvbnVsbCkgPT0gb3BlbnJlc29sdlwgKiBdXTsgdGhlbgoJCWNtZCByZXNvbHZjb25mIC1k
ICIkSU5URVJGQUNFIgoJZWxzZQoJCWNtZCB1bW91bnQgL2V0Yy9yZXNvbHYuY29uZgoJZmkKfQo=
--001a11409f6adb1bcb055c8af3d5--
