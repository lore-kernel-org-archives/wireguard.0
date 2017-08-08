Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bfa3fd1c
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 22:54:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce54678d
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 22:54:24 +0000 (UTC)
Date: Wed, 9 Aug 2017 01:16:14 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>,
 Egbert Verhage <egbert@eggiecode.org>, Anonymous Anonymous <admin@hda.me>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Advising in packages to load new module or reboot
Message-ID: <20170808231612.GA24254@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey guys,

I've noticed that around 60% of emails and IRC messages I get about
WireGuard issues are due to:

1) forgetting to `rmmod wireguard && modprobe wireguard` after updating
2) installing new kernel headers, removing old kernel headers, updating
   wireguard, and then having the module built for the newer kernel and
   forgetting to reboot
3) not having any headers installed

I don't really know the best generic solution for (3), since different
distros and distro-derivatives (armbian,raspian,archlinuxarm,etc) seem
to express these dependencies in different ways, or not at all. But I do
have an idea to pretty easily address (1) and (2). I've just added the
below to the Gentoo ebuild:

+ if [[ $(uname -r) != "${KV_FULL}" ]]; then
+         ewarn
+         ewarn "You have just built WireGuard for kernel ${KV_FULL}, yet the currently running"
+         ewarn "kernel is $(uname -r). If you intend to use this WireGuard module on the currently"
+         ewarn "running machine, you will first need to reboot it into the kernel ${KV_FULL}, for"
+         ewarn "which this module was built."
+         ewarn
+ elif [[ -f /sys/module/wireguard/version ]] && \
+      old="$(< /sys/module/wireguard/version)" && \
+      new="$(modinfo -F version "${ROOT}/lib/modules/${KV_FULL}/net/wireguard.ko" 2>/dev/null)" && \
+      [[ $old != "$new" ]]; then
+         ewarn
+         ewarn "You appear to have just upgraded WireGuard from version v$old to v$new."
+         ewarn "However, the old version is still running on your system. In order to use the"
+         ewarn "new version, you will need to remove the old module and load the new one. As"
+         ewarn "root, you can accomplish this with the following commands:"
+         ewarn
+         ewarn "    # rmmod wireguard"
+         ewarn "    # modprobe wireguard"
+         ewarn
+         ewarn "Do note that doing this will remove current WireGuard interfaces, so you may want"
+         ewarn "to gracefully remove them yourself prior."
+         ewarn
+ fi

There's a bit of Gentoo-specific stuff in there, but the general idea is
that I first check to see if the module is being built for the current
kernel or a different one, and then I check whether an older module is
loaded than the one just built. It might be slightly trickier to
accomplish this with DKMS, but I think still it's possible.

Any thoughts on this pattern?

Jason
