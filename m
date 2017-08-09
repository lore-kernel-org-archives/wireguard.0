Return-Path: egbert@eggiecode.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5cda03c5
 for <wireguard@lists.zx2c4.com>; Wed, 9 Aug 2017 10:55:05 +0000 (UTC)
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17b586f9
 for <wireguard@lists.zx2c4.com>; Wed, 9 Aug 2017 10:55:05 +0000 (UTC)
Message-ID: <1502277405.1043.2.camel@eggiecode.org>
Subject: Re: Advising in packages to load new module or reboot
From: Egbert Verhage <egbert@eggiecode.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Daniel Kahn Gillmor
 <dkg@fifthhorseman.net>, Anonymous Anonymous <admin@hda.me>, WireGuard
 mailing list <wireguard@lists.zx2c4.com>
Date: Wed, 09 Aug 2017 13:16:45 +0200
In-Reply-To: <20170808231612.GA24254@zx2c4.com>
References: <20170808231612.GA24254@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Jason,

Ow, that it is a common problem.
I think your patch is a nice updated.

So I got some time left and build a patch (pull request) on github
here: https://github.com/EggieCode/wireguard-ppa/pull/24

Let me known what you think.

Greetz,
Egbert

On Wed, 2017-08-09 at 01:16 +0200, Jason A. Donenfeld wrote:
> Hey guys,
> 
> I've noticed that around 60% of emails and IRC messages I get about
> WireGuard issues are due to:
> 
> 1) forgetting to `rmmod wireguard && modprobe wireguard` after
> updating
> 2) installing new kernel headers, removing old kernel headers,
> updating
>    wireguard, and then having the module built for the newer kernel
> and
>    forgetting to reboot
> 3) not having any headers installed
> 
> I don't really know the best generic solution for (3), since
> different
> distros and distro-derivatives (armbian,raspian,archlinuxarm,etc)
> seem
> to express these dependencies in different ways, or not at all. But I
> do
> have an idea to pretty easily address (1) and (2). I've just added
> the
> below to the Gentoo ebuild:
> 
> + if [[ $(uname -r) != "${KV_FULL}" ]]; then
> +         ewarn
> +         ewarn "You have just built WireGuard for kernel ${KV_FULL},
> yet the currently running"
> +         ewarn "kernel is $(uname -r). If you intend to use this
> WireGuard module on the currently"
> +         ewarn "running machine, you will first need to reboot it
> into the kernel ${KV_FULL}, for"
> +         ewarn "which this module was built."
> +         ewarn
> + elif [[ -f /sys/module/wireguard/version ]] && \
> +      old="$(< /sys/module/wireguard/version)" && \
> +      new="$(modinfo -F version
> "${ROOT}/lib/modules/${KV_FULL}/net/wireguard.ko" 2>/dev/null)" && \
> +      [[ $old != "$new" ]]; then
> +         ewarn
> +         ewarn "You appear to have just upgraded WireGuard from
> version v$old to v$new."
> +         ewarn "However, the old version is still running on your
> system. In order to use the"
> +         ewarn "new version, you will need to remove the old module
> and load the new one. As"
> +         ewarn "root, you can accomplish this with the following
> commands:"
> +         ewarn
> +         ewarn "    # rmmod wireguard"
> +         ewarn "    # modprobe wireguard"
> +         ewarn
> +         ewarn "Do note that doing this will remove current
> WireGuard interfaces, so you may want"
> +         ewarn "to gracefully remove them yourself prior."
> +         ewarn
> + fi
> 
> There's a bit of Gentoo-specific stuff in there, but the general idea
> is
> that I first check to see if the module is being built for the
> current
> kernel or a different one, and then I check whether an older module
> is
> loaded than the one just built. It might be slightly trickier to
> accomplish this with DKMS, but I think still it's possible.
> 
> Any thoughts on this pattern?
> 
> Jason
