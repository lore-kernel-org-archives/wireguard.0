Return-Path: samuel@sholland.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa7f1f1e
 for <wireguard@lists.zx2c4.com>; Wed, 8 Nov 2017 05:11:49 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 762f0a8d
 for <wireguard@lists.zx2c4.com>; Wed, 8 Nov 2017 05:11:49 +0000 (UTC)
Subject: Re: WireGuard root-less support for android
To: =?UTF-8?Q?Aur=c3=a9lien_Chabot?= <aurelien@chabot.fr>,
 wireguard@lists.zx2c4.com
References: <20171107043817.9050-1-aurelien@chabot.fr>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <962a4121-b5c8-c64a-30c1-e061eba656b0@sholland.org>
Date: Tue, 7 Nov 2017 23:15:06 -0600
MIME-Version: 1.0
In-Reply-To: <20171107043817.9050-1-aurelien@chabot.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

On 11/06/17 22:38, Aurélien Chabot wrote:
> I worked on a set of change to add root-less support of WireGuard for
> android. The solution I choose is to use the wireguard-go library 
> inside the android application. Golang as a mechanism to export some 
> native binding quite easily to java. The set of patch need some 
> feedback but it's actually working well. I'd like to know if you 
> think this is a good direction to take for the android application.

Thanks for your contribution! This is definitely the direction we want
to work toward; the Go implementation is much more accessible to
non-rooted devices. I had assumed we would have to run wireguard-go as a
separate process (my only experience with Go-on-Android is syncthing[1],
which pretends its Go binary is a native library[2]). If we can run
wireguard-go in process, that would be much better!

[1]: https://github.com/syncthing/syncthing-android
[2]: 
https://github.com/syncthing/syncthing-android/blob/master/make-syncthing.bash

> The patch are in the thread but I used a submodule to integrate the 
> wireguard-go library inside the wireguard-android so at least this 
> need to be change with the official url if it's get merge.

Also, your patch 2 won't work as-is with the upstream version since it
won't have the same commit hash.

> You can also find the set of change on my github : 
> https://github.com/trishika/wireguard-android 
> https://github.com/trishika/wireguard-go

I've started looking through your Java changes, and they're generally
looking good. The actual wireguard-go glue can't be merged until after
the changes to the other repository (hooray submodules!), but I'll go
ahead and try to integrate your service abstraction layer. That way I
can reuse it for switching the kernel-space interface from wg-quick to
wg proper (an existing to-do item).

> Aurélien
Thanks,
Samuel
