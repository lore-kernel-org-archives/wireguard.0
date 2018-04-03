Return-Path: vtol@gmx.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 042fa949
 for <wireguard@lists.zx2c4.com>; Tue, 3 Apr 2018 15:12:20 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bc228b5
 for <wireguard@lists.zx2c4.com>; Tue, 3 Apr 2018 15:12:20 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <trinity-e0820775-ec77-4ad6-b437-65a02fc1e5ae-1522769113474@3c-app-gmx-bs64>
From: vtol@gmx.net
To: wireguard@lists.zx2c4.com
Subject: Aw: wg-quick (script snippets) for OpenWRT/LEDE
Content-Type: text/plain; charset=UTF-8
Date: Tue, 3 Apr 2018 17:25:13 +0200
In-Reply-To: <trinity-d392f714-af63-4df5-a7bf-3bc24d3edf34-1522768786475@3c-app-gmx-bs64>
References: <trinity-d392f714-af63-4df5-a7bf-3bc24d3edf34-1522768786475@3c-app-gmx-bs64>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

remailing in plain text 

Hi,

it appears that wg-quick is not provided for OpenWRT/LEDE.

The reason is not really clear to me. As far I understand wg-quick depends on BASH whilst the default shell in OpenWRT/LEDE is ASH.
This however can be easily remidied by installing the BASH package from the OpenWRT/LEDE repo.

OpenWRT/LEDE is utilising netifd for network configuration which is lacking th3 versatility of wg-quick with there script snippets

PRE_UP=( )
POST_UP=( )
PRE_DOWN=( )
POST_DOWN=( )

Is there a way to get those script snippets working in OpenWRT/LEDE as such is required in dynamic/split/kill-switch routing scenarios.

OpenVPN provides a similar script functionality which is however not stripped on the OpenWRT/LEDE repo, respectively it does not require an extra tool package. I find it rather curious that the aforementioned script snippets are not part of wg but rather implemented in wg-quick which then is absent from OpenWRT/LEDE.
