Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 191f29d6
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Nov 2017 14:17:35 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98de6029
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Nov 2017 14:17:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d89cc99
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Nov 2017 14:17:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bc3d4b41
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Nov 2017 14:17:34 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id j29so20812566oth.13
 for <wireguard@lists.zx2c4.com>; Sat, 25 Nov 2017 06:23:05 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 25 Nov 2017 15:23:04 +0100
Message-ID: <CAHmME9q8VbC_brP5BJVTS9YFTNxoiL2owW3gGdmJCpcXtzHgXw@mail.gmail.com>
Subject: Easily adding WireGuard to Android ROMs
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Sultan XDA <sultanxda@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey folks,

Work continues on making a userspace version of WireGuard that will
allow us to run on normal Play Store/App Store apps on Android and
iOS. The work is coming along nicely, and we have some wind on our
sails thanks to the recent submission on this mailing list. This email
isn't about that, however. It's about the WireGuard kernel module and
CLI components on Android.

Custom ROM integrators have expressed interest in shipping the kernel
component of WireGuard with their Android ROMs, in order to have the
best possible WireGuard experience. No matter how good we make the
userspace implementation, a kernel implementation will inherently
always be faster, more power efficient, and better integrated into the
deepest mechanics of the operating system. That's just how it works.
Thus, in addition to the userspace work we're doing for global
compatibility, we're also very interested in providing a viable path
for ROM integrators to use the kernel module.

Currently the kernel component ships on Sultan's ROMs, and next week
after some other things happen, I expect for it to be picked up by a
few other ROM builders as well.

In order to make this as easy as possible, I've made a repository to
which ROM builders can link via their local_manifest.xml file by
simply adding these two lines:

  <remote name="zx2c4" fetch="https://git.zx2c4.com/" />
  <project remote="zx2c4" name="android_kernel_wireguard"
path="kernel/wireguard" revision="master" sync-s="true" />

Documentation is available here:
https://git.zx2c4.com/android_kernel_wireguard/about/

This automatically patches the kernel component directly into the
Android kernel at build time, and also includes wg(8) and wg-quick(8)
in /system/xbin. It will stay up to date via `repo sync`, so as we
roll out new snapshots, ROM integrators will pick up those changes
naturally on their next rebuild.

The Android GUI app, which is currently in development, will
opportunistically use the kernel component if it's available, and will
then fall back to the userspace implementation otherwise.

So, if any of you on this list are into building your own Android ROMs
and would like to give this a try, don't hesitate to see what happens
when you link to that repo via the manifest xml. Let me know how it
goes.

Enjoy!
Jason
