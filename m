Return-Path: mathias@hall-andersen.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e41889d
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Dec 2017 09:33:31 +0000 (UTC)
Received: from mailrelay2-2.pub.mailoutpod1-cph3.one.com
 (mailrelay2-2.pub.mailoutpod1-cph3.one.com [46.30.212.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e49ecc5
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Dec 2017 09:33:31 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: Mathias <mathias@hall-andersen.dk>
Subject: Separate tools from kernel module
Message-ID: <22a378f1-7c2c-a91d-1171-94d75f7c04ca@hall-andersen.dk>
Date: Tue, 12 Dec 2017 10:41:26 +0100
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

Hi Jason

Have you considered separating the WireGuard tools (src/tools) from the
kernel module itself?

The reasons being:

1. The tools are also used for configuring userspace implementations.
2. Work is ongoing on cross-platform WireGuard (e.g. experimental on
OSX), where the tools compile.
3. The kernel space implementation could in the future be configured by
different tools produced by 3rd parties.

Best Regards
Mathias
