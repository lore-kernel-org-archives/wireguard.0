Return-Path: vtol@gmx.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cfcc4aea
 for <wireguard@lists.zx2c4.com>; Tue, 3 Apr 2018 15:06:54 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 390f1501
 for <wireguard@lists.zx2c4.com>; Tue, 3 Apr 2018 15:06:53 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <trinity-d392f714-af63-4df5-a7bf-3bc24d3edf34-1522768786475@3c-app-gmx-bs64>
From: vtol@gmx.net
To: wireguard@lists.zx2c4.com
Subject: wg-quick (script snippets) for OpenWRT/LEDE
Content-Type: text/html; charset=UTF-8
Date: Tue, 3 Apr 2018 17:19:46 +0200
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Hi,</div>

<div>&nbsp;</div>

<div>it appears that wg-quick is not provided for OpenWRT/LEDE.</div>

<div>&nbsp;</div>

<div>The reason is not really clear to me. As far I understand wg-quick depends on BASH whilst the default shell in OpenWRT/LEDE is ASH.</div>

<div>This however can be easily remidied by installing the BASH package from the OpenWRT/LEDE repo.</div>

<div>&nbsp;</div>

<div>OpenWRT/LEDE is utilising netifd for network configuration which is lacking th3 versatility of wg-quick with there script snippets</div>

<div>&nbsp;</div>

<div>PRE_UP=( )<br/>
POST_UP=( )<br/>
PRE_DOWN=( )<br/>
POST_DOWN=( )</div>

<div>&nbsp;</div>

<div>Is there a way to get those script snippets working in OpenWRT/LEDE as such is required in dynamic/split/kill-switch routing scenarios.</div>

<div>&nbsp;</div>

<div>OpenVPN provides a similar script functionality which is however not stripped on the OpenWRT/LEDE repo, respectively it does not require an extra tool package. I find it rather curious that the aforementioned script snippets are not part of wg but rather implemented in wg-quick which then is absent from OpenWRT/LEDE.</div>

<div>&nbsp;</div>

<div class="signature">&nbsp;</div></div></body></html>
