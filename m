Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8ECC388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 16:26:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15DAB206CB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 16:26:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="j9DVqOj2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15DAB206CB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43f048da;
	Mon, 9 Nov 2020 16:22:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c53a6ad0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Nov 2020 16:22:26 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f4d492b
 for <wireguard@lists.zx2c4.com>; Mon, 9 Nov 2020 16:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :subject:message-id:mime-version:content-type; s=mail; bh=GCXE7I
 p2uMgg9ytpQ4mwyuuvB5k=; b=j9DVqOj2N65+Tx7c+JLh7iVsp0ZTa665faA9Zh
 5y/IUQ5NPQXo+lm3Djoo++sKzSX+8WKxK2+Sg3FgqWNddbEbo5HQqQrfK+zCAZbt
 B2J3GHDR7taFcBNdCOSk9pcAbMUHPO3SBr9M45lWiXZU97azC9qxi0t0vt+0WAAn
 LkipUUvTB1N7ySwbubk6zbeZcIjH5tHjdpuBwaHif7oB9C9cTDOvw0+2DGxsIc9G
 FGRqKTZhKj9XFo2ScjyVBhA6i/a9W/yiaxl5W7eQsTb+0x2wGMACyXS/uOswpQBr
 KGL0bn6AHBAqagsgGRluvA/wIA2b/voauq9HuAFgFe9hl3mw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3b7c02f1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Nov 2020 16:23:12 +0000 (UTC)
Date: Mon, 9 Nov 2020 17:25:58 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Subject: [ANNOUNCE] Wintun 0.9 Released with Major Usability Improvements
Message-ID: <20201109162558.GA2277411@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi folks,

Simon and I are very excited to announce the release of Wintun 0.9, the
release in which Wintun finally becomes easy and enjoyable to use by
developers. I consider this the most significant release of Wintun yet.

Webpage: https://www.wintun.net/

For background: Wintun is a driver for the Windows kernel that enables
userspace programs to create network tunnels. It's a "/dev/net/tun" of the
Windows world. We use this for WireGuard. We had investigated OpenVPN's "tap6"
driver but found it to be a crumbling mess with dubious security, and instead
endeavored to write a lightweight minimal replacement that obtains extremely
high speeds using a ring buffer, similar to Linux's io_uring.

Big Change 1: API Library and Easy Distribution
-----------------------------------------------

We used to rely on an obscure Microsoft technology for distributing Wintun,
called MSI Merge Modules (MSM), in which application writers would bundle the
signed MSM we provided as part of their MSI installer. This was great in that
it encapsulated a lot of logic and hid it from developers, but relying on MSM
was a hassle and precluded the use of Wintun in many non-MSI apps.

The MSM also would simply make sure the driver was installed, but wouldn't
provide anything else. It was up to developers to then navigate arcane Windows
driver instantiation APIs, which are some of the oldest and most obscure to
use. Then, once installed, developers had to manage a ring and various IOCTLs
themselves. It all worked -- WireGuard and OpenVPN (after receiving our
assistance) successfully deployed it -- but it was cumbersome enough that
nobody else was going to use this.

With Wintun 0.9, we're changing what we distribute and also providing an easy
to use API. Rather than shipping MSMs to developers, we now ship a single
basic boring wintun.dll. This dll hides all of the driver installation and
adapter instantiation logic, and provides a nice interface for managing
adapters and shuffling data in and out of the ring buffer. So, application
developers can now just grab that dll, plop it into their application like
they would any other dll, and use Wintun without even noticing that it's
inserting a kernel driver when necessary

Big Change 2: Support for WOW64 and ARM
---------------------------------------

Windows does not support setupapi.dll and related driver functions on 32-bit
processes running on 64-bit operating systems. This meant that it was
impossible for WOW64 processes to use Wintun. Wintun also formerly required
64bit addresses, which made the kernel ABI clumsy for WOW64 processes. With
Wintun 0.9, we now bundle a 64-bit version of Wintun inside 32-bit versions of
the wintun.dll, and we marshal calls back and forth to an on-demand proxy
process running on the native architecture.

Not only do we have this for basic WOW64, but we also have this working for
Windows' ARM64 emulation of x86 binaries. So you can now run an x86 program on
ARM64 and wintun.dll will figure out what to do.

This has big effects for us. Since Go still has not been ported to ARM64, we
use an ARM build and rely on this new feature of Wintun. This means we should
have a WireGuard for ARM64 Windows release in the coming week or two.

Big Change 3: Administrator User Permissions
--------------------------------------------

Wintun requires the Local System user. But if you're running as Administrator,
the wintun.dll library will attempt to do its operations as Local System,
automatically. This effectively means that normal apps can bundle Wintun now,
rather than just services.


Please let us know if you have any questions or feedback. We're certainly
interested in developer reports on what integrating this is like.

- The API reference is available online:
  https://git.zx2c4.com/wintun/about/

- And there's some simple example code too:
  https://git.zx2c4.com/wintun/tree/example/example.c

- A signed wintun.dll for amd64, arm64, x86, and arm is on the webpage:
  https://www.wintun.net/

- And of course, it's open source:
  git clone https://git.zx2c4.com/wintun

Regards,
Jason
