Return-Path: samuel@sholland.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88effac0
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Apr 2017 19:11:19 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d0ca916
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Apr 2017 19:11:18 +0000 (UTC)
Subject: Re: Issue, WireGuard on a PaX kernel
To: saeidscorp <saeidscorp@yahoo.com>, wireguard@lists.zx2c4.com
References: <wexyqgwcryb4usbwj8td1g9m.1492956648412@email.android.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <dbfdc15d-f7b8-f195-d8f3-013165bb8e84@sholland.org>
Date: Sun, 23 Apr 2017 14:19:45 -0500
MIME-Version: 1.0
In-Reply-To: <wexyqgwcryb4usbwj8td1g9m.1492956648412@email.android.com>
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

On 04/23/17 09:53, saeidscorp wrote:
> I've been having troubles using WireGuard on Gentoo hardened/PaX
> kernel. I have set up WireGuard on regular kernels several times, but
> on a PaX kernel it causes the kernel to panic.
>
> All steps of interface addition and configuration using wg tool work
> well, but as soon as the first packet goes through the interface, it
> crashes the whole system.

You didn't mention your kernel version, so I assume you're using the
latest stable hardened-sources. The panic is a known issue for 4.8,
caused by a combination of bugs in the upstream kernel and the
grsecurity patch. You can resolve it by either downgrading to 4.7 or
upgrading to 4.9.

See this thread[0] for more information.

Regards,
Samuel

[0] https://www.mail-archive.com/wireguard@lists.zx2c4.com/msg00385.html
